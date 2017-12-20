extern crate assign7;
extern crate time;
#[macro_use]
extern crate clap;
extern crate serde;
#[macro_use]
extern crate serde_json;

use clap::{Arg, App};
use std::collections::HashMap;
use assign7::*;
use time::now;
use std::sync::Arc;
use op::*;

macro_rules! bench {
    ($name:expr, $f:expr, $v:expr, $ops:expr) => {{
        let start = now();
        $f($v.iter().cloned(), $ops.clone());
        let elapsed = now() - start;
        let elapsed_time = elapsed.num_milliseconds() as f64 / 1000.0;
        elapsed_time
    }}
}

fn bench(v: &[f64], ops: Vec<Op>) -> f64 {
    let elapsed_time: f64 =
        bench!("collect_par", collect_par::collect_par, v, &ops);
    elapsed_time
}

arg_enum! {
    #[derive(Debug)]
    enum TestKind {
        Basic,
        HighCompute,
        Imbalanced,
        ManyGroups,
        ManyMaps,
        All
    }
}

fn bench_test(test: &TestKind, num_items: i64, json: bool) {
    let v: Vec<f64> = (0..num_items).into_iter().map(|x| x as f64).collect();
    let mut results_hashmap: HashMap<&str, f64> = HashMap::new();

    match test {
        &TestKind::Basic | &TestKind::All => {
            let basic_time: f64 =
                bench(
                    &v,
                    vec![
                        Op::Map(Arc::new(|x| x.sqrt())),
                        Op::Filter(Arc::new(|x| (*x as i64) % 2 == 0)),
                        Op::GroupBy(
                            Arc::new(|x| (x / 2.0) as i64),
                            Arc::new(|v| v.len() as f64)
                        ),
                    ],
                );
            if json {
                results_hashmap.insert("basic", basic_time);
            } else {
                println!("{}: {}", "basic", basic_time);
            }
        }
        _ => {}
    };

    match test {
        &TestKind::HighCompute |
        &TestKind::All => {
            let high_compute_time: f64 = bench(
                &v,
                vec![
                    Op::Map(Arc::new(|x| x.sqrt())),
                    Op::Map(Arc::new(|x| x.cos())),
                    Op::Map(Arc::new(|x| x.tan())),
                    Op::Map(Arc::new(|x| x.asin())),
                    Op::Map(Arc::new(|x| x.acos())),
                    Op::Map(Arc::new(|x| x.cos())),
                    Op::Map(Arc::new(|x| x.tan())),
                    Op::Map(Arc::new(|x| x.asin())),
                    Op::Map(Arc::new(|x| x.acos())),
                ],
            );
            if json {
                results_hashmap.insert("high_compute", high_compute_time);
            } else {
                println!("{}: {}", "high_compute", high_compute_time);
            }
        }
        _ => {}
    };

    match test {
        &TestKind::Imbalanced |
        &TestKind::All => {
            let imbalanced_time: f64 = bench(
                &v,
                vec![
                    Op::Filter(Arc::new(move |x| {
                        *x < ((num_items / 10) as f64)
                    })),
                    Op::Map(Arc::new(|x| {
                        (0..64).into_iter().fold(x, |acc, _| acc.exp().ln() + 1.0)
                    })),
                ],
            );
            if json {
                results_hashmap.insert("imbalanced", imbalanced_time);
            } else {
                println!("{}: {}", "imbalanced", imbalanced_time);
            }
        }
        _ => {}
    };

    match test {
        &TestKind::ManyMaps |
        &TestKind::All => {
            let many_maps_time: f64 = bench(
                &v,
                (0..300)
                    .into_iter()
                    .map(|_| Op::Map(Arc::new(|x| x + 1.0)))
                    .collect(),
            );
            if json {
                results_hashmap.insert("many_maps", many_maps_time);
            } else {
                println!("{}: {}", "many_maps", many_maps_time);
            }
        }
        _ => {}
    };

    match test {
        &TestKind::ManyGroups |
        &TestKind::All => {
            let many_groups_time: f64 =
                bench(
                    &v,
                    vec![
                        Op::Map(Arc::new(|x| x.sqrt())),
                        Op::GroupBy(Arc::new(|x| x as i64), Arc::new(|v| v[0])),
                        Op::Map(Arc::new(|x| x.ln())),
                        Op::GroupBy(
                            Arc::new(|x| (x / 100.0) as i64),
                            Arc::new(|v| v.into_iter().fold(0.0, |acc, x| x + acc))
                        ),
                        Op::Map(Arc::new(|x| x.exp())),
                        Op::GroupBy(
                            Arc::new(|x| (x as i64) % 3),
                            Arc::new(|v| v.len() as f64)
                        ),
                    ],
                );
            if json {
                results_hashmap.insert("many_groups", many_groups_time);
            } else {
                println!("{}: {}", "many_groups", many_groups_time);
            }
        }
        _ => {}
    };


    if json {
        println!("{}", json!(results_hashmap));
    }
}

fn main() {
    let matches = App::new("benchmarks")
        .arg(
            Arg::with_name("test")
                .possible_values(&TestKind::variants())
                .required(true),
        )
        .arg(
            Arg::with_name("num_items")
                .long("num_items")
                .takes_value(true)
                .help("Size of input vector"),
        )
        .arg(Arg::with_name("json").long("json").help(
            "Output results as JSON",
        ))
        .get_matches();

    let test = value_t!(matches.value_of("test"), TestKind).unwrap();
    let num_items = value_t!(matches.value_of("num_items"), i64)
        .unwrap_or_else(|_| 1000 * 1000 * 256);
    let json = matches.is_present("json");
    if !json {
        println!("Test: {:?}", test);
    }
    bench_test(&test, num_items, json);
}
