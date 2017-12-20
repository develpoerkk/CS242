extern crate num_cpus;
#[macro_use]
extern crate lazy_static;

pub mod op;
pub mod collect_block;
pub mod collect_stream;
pub mod collect_par;

#[cfg(test)]
mod test {
    use super::*;
    use op::*;
    use std::sync::Arc;

    macro_rules! correctness {
        ($name:expr, $f:expr, $v:expr, $ops:expr, $expected:expr) => {
            let result = $f($v.iter().cloned(), $ops.clone());
            assert_eq!(result.len(), $expected.len());
            for i in 0..$expected.len() {
                assert_eq!(result[i], $expected[i]);
            }
        }
    }

    fn correctness_all(v: &[f64], ops: Vec<Op>, expected: &[f64]) {
        correctness!(
            "collect_block",
            collect_block::collect_block,
            v,
            &ops,
            expected
        );
		correctness!(
			"collect_stream",
			collect_stream::collect_stream,
			v,
			&ops,
			expected
		);
		// correctness!(
		//     "collect_par",
		//     collect_par::collect_par,
		//     v,
		//     &ops,
		//     expected
		// );
    }

    #[test]
    fn map_test() {
        let v: Vec<f64> = (0..1024).into_iter().map(|x| x as f64).collect();
        let ops = vec![
            Op::Map(Arc::new(|x| 2.0 * x)),
            Op::Map(Arc::new(|x| x + 1.0)),
        ];
        let mut expected: Vec<f64> = Vec::new();
        for item in &v {
            expected.push(*item * 2.0 + 1.0);
        }

        correctness_all(&v, ops, &expected);
    }

    #[test]
    fn filter_test() {
        let v: Vec<f64> = (0..1024).into_iter().map(|x| x as f64).collect();
        let ops = vec![Op::Filter(Arc::new(|x| *x < 512.0))];
        let expected: Vec<f64> =
            (0..512).into_iter().map(|x| x as f64).collect();
        correctness_all(&v, ops, &expected);
    }

    #[test]
    fn one_group_test() {
        let v: Vec<f64> = (0..1024).into_iter().map(|x| x as f64).collect();
        let ops = vec![
            Op::GroupBy(
                Arc::new(|_x| 1 as i64),
                Arc::new(|v| v.len() as f64)
            ),
        ];
        let expected = vec![1024.0];
        correctness_all(&v, ops, &expected);
    }

    #[test]
    fn many_groups_test() {
        let v: Vec<f64> = (0..1024).into_iter().map(|x| x as f64).collect();
        let ops = vec![
            Op::GroupBy(
                Arc::new(|x| (x / 2.0) as i64),
                Arc::new(|v| v.len() as f64)
            ),
        ];
        let expected: Vec<f64> =
            (0..512).into_iter().map(|_x| 2 as f64).collect();
        correctness_all(&v, ops, &expected);
    }

    #[test]
    fn map_filter_test() {
        let v: Vec<f64> = (0..1024).into_iter().map(|x| x as f64).collect();
        let ops = vec![
            Op::Filter(Arc::new(|x| *x >= 512.0)),
            Op::Map(Arc::new(|x| x - 512.0)),
        ];
        let expected: Vec<f64> =
            (0..512).into_iter().map(|x| x as f64).collect();
        correctness_all(&v, ops, &expected);
    }

    #[test]
    fn streaming_test() {
        let v = (0..(1024i64 * 1024 * 1024 * 4)).into_iter().map(
            |x| x as f64,
        );
        let ops = vec![Op::Filter(Arc::new(|_x| false))];

        collect_stream::collect_stream(v, ops);
    }
}
