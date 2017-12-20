use num_cpus;
use std::sync::{Arc, Mutex};
use std::thread;
use std::collections::BTreeMap;

use op::*;
use collect_stream::collect_stream;

/* lazy_static allows us to define a global variable that needs initialization
 * code (that code runs on the first time the variable is referenced).
 * To use the NUM_WORKERS variable, you just need to dereference it, e.g.
 *   for _ in 0..*NUM_WORKERS { .. }
 */
lazy_static! {
    static ref NUM_WORKERS: usize = num_cpus::get();
}

pub fn collect_par<T: Iterator<Item = f64>>(
    source: T,
    ops: Vec<Op>,
) -> Vec<f64> {
	let mut v: Vec<f64> = source.collect();		// materialization to calculate size
	let mut sector_size = v.len() / *NUM_WORKERS;
	if v.len() % *NUM_WORKERS != 0 {
		sector_size += 1;	
	}
	for op in ops {
		let mut reference: Arc<Vec<f64>> = Arc::new(v);
		v = match op {
			Op::Map(f) => {
				let mut handlers: Vec<thread::JoinHandle<Vec<f64>>> = vec![];
				let mut ret: Vec<f64> = vec![];
				for sector in reference.chunks(sector_size) {
					let f = f.clone();					 // copy
					let this_sector = sector.to_owned(); // need to be owned
					let handler = thread::spawn(move || {this_sector.into_iter().map(|x| f(x)).collect()});
					handlers.push(handler);
				}
				for h in handlers {
					ret.extend(h.join().unwrap());
				}
				return ret;
			}
			Op::Filter(f) => {
				let mut handlers: Vec<thread::JoinHandle<Vec<f64>>> = vec![];
				let mut ret: Vec<f64> = vec![];
				for sector in reference.chunks(sector_size) {
					let f = f.clone();					 // copy
					let this_sector = sector.to_owned(); // need to be owned
					let handler = thread::spawn(move || {this_sector.into_iter().filter(|x| f(x)).collect()});
					handlers.push(handler);
				}
				for h in handlers {
					ret.extend(h.join().unwrap());
				}
				return ret;
			}
			Op::GroupBy(key, group) => {
				let mut handlers: Vec<thread::JoinHandle<_>> = vec![];
				let map = Arc::new(Mutex::new(BTreeMap::new()));
				let mut ret = vec![];
				for sector in reference.chunks(sector_size) {
					let key = key.clone();
					let map_clone = map.clone();
					let this_sector = sector.to_owned();
					let handler = thread::spawn(move || {
						for ele in this_sector {
							let mut map = map_clone.lock().unwrap();
							let k = key(ele);
							if !map.contains_key(&k) {
								let mut vec = Vec::new();
								vec.push(ele.clone());
								map.insert(k, vec);
							} else {
								let mut val = map.get_mut(&k).unwrap();
								val.push(ele.clone());
							}
						}
					});
					handlers.push(handler);
				}
				for h in handlers {
					h.join().unwrap();
				}
				for (key, val) in map.lock().unwrap().iter() {
					ret.push(group(val));
				}
				ret
			}
		}
	}
	v
}
