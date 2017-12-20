// use std::collections::HashMap;
use std::collections::BTreeMap;

use op::*;

pub fn collect_stream<T: Iterator<Item = f64>>(
    source: T,
    ops: Vec<Op>,
) -> Vec<f64> {
    let mut v: Box<Iterator<Item = f64>> = Box::new(source);
    for op in ops {
        v = match op {
            Op::Map(f) => {
				Box::new(v.map(move |x| f(x)))
            }
            Op::Filter(f) => {
				Box::new(v.filter(move |x| f(x)))
            }
            Op::GroupBy(key, group) => {
				let mut map = BTreeMap::new();
				let array = v.collect::<Vec<f64>>();
				for ele in array {
					let k = key(ele);
					if !map.contains_key(&k) {
						let mut vec = Vec::new();
						vec.push(ele);
						map.insert(k, vec);
					} else {
						let mut val = map.get_mut(&k).unwrap();
						val.push(ele);
					}
				}
				let mut ret = Vec::new();
				for (key, val) in map.iter() {
					ret.push(group(val));
				}
				return ret;
			}
		}
	}
    v.collect()
}
