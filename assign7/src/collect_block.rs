// use std::collections::HashMap;
use std::collections::BTreeMap;

use op::*;

pub fn collect_block<T: Iterator<Item = f64>>(
    source: T,
    ops: Vec<Op>,
) -> Vec<f64> {
    let mut v: Vec<f64> = source.collect();
    for op in ops {
        v = match op {
            Op::Map(f) => {
				v.into_iter().map(move |x| f(x)).collect()
            }
            Op::Filter(f) => {
				v.into_iter().filter(move |x| f(x)).collect()
            }
            Op::GroupBy(key, group) => {
				let mut map = BTreeMap::new();	
				for x in v {
					let k = key(x);
					if !map.contains_key(&k) {
						let mut vec = Vec::new();
						vec.push(x);
						map.insert(k, vec); 
					} else {
						let mut val = map.get_mut(&k).unwrap();
						val.push(x);
					}
				}
				let mut ret = Vec::new();
				for (key, val) in map.iter() {
					ret.push(group(val));
				}
				ret
            }
        }
    }
    v
}
