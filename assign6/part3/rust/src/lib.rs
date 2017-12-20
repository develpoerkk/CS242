use std::collections::{HashMap, HashSet};
use std::collections::VecDeque;

/* This trait is an interface to a generic graph that has some type T
 * associated with the nodes. It's equivalent to the interface provided in
 * graph.mli. */
pub trait Graph<T> {
	type Node;
	fn add_node(&mut self, x: T) -> Self::Node;
	fn value(&self, n: Self::Node) -> &T;
	fn connected(&self, n1: Self::Node, n2: Self::Node) -> bool;
	fn add_edge(&mut self, _from: i32, _to: i32) -> (); 
	fn neighbors(&self, node: i32) -> &Vec<i32>; 

	/* Fill in the public interface for add_edge and neighbors here! */
}

pub struct AdjListGraph<T> {
nodes: HashMap<i32, T>, edges: HashMap<i32, Vec<i32>>
}

impl<T> AdjListGraph<T> {
	pub fn new() -> AdjListGraph<T> {
		AdjListGraph {nodes: HashMap::new(), edges: HashMap::new()}
	}

	fn all_reachable(&self, node: i32) -> HashSet<i32> {
		// BFS or DFS
		let mut queue: VecDeque<i32> = VecDeque::new();
		let mut nodes: HashSet<i32> = HashSet::new();
		queue.push_back(node);
		nodes.insert(node);
		while !queue.is_empty() {
			let curr_node = queue.pop_front().unwrap();
			let neighbors = self.edges.get(&curr_node).unwrap();
			for i in 0..neighbors.len() {
				let this_neighbor = neighbors[i];
				if !nodes.contains(&this_neighbor) {
					queue.push_back(this_neighbor);
					nodes.insert(this_neighbor);
				}
			}
		}
		return nodes;
	}
}

impl<T> Graph<T> for AdjListGraph<T> {
	type Node = i32;

	fn add_node(&mut self, x: T) -> i32 {
		let i = self.nodes.len() as i32;
		self.nodes.insert(i, x);
		let vec = vec![];
		self.edges.insert(i, vec);
		return i;
	}

	/* Your add_edge method goes here */
	fn add_edge(&mut self, _from: i32, _to: i32) -> () {
		// if self.edges.contains_key(&_from) {	// key exists
			let x = self.edges.get_mut(&_from).unwrap();
			x.push(_to);
		// } else {								// key does not exist
		//     let vec = vec![_to];
		//     self.edges.insert(_from, vec);
		// }
	}

	/* Your neighbors function goes here! */
	fn neighbors(&self, n: i32) -> &Vec<i32> {
		return self.edges.get(&n).unwrap();		
	}

	fn value(&self, n: i32) -> &T {
		return self.nodes.get(&n).unwrap();	
	}

	fn connected(&self, n1: i32, n2: i32) -> bool {
		/* Your solution goes here! Delete the line below. */
		let nodes = self.all_reachable(n1);
		return nodes.contains(&n2);
	}
}

#[cfg(test)]
mod test {
	use super::*;

#[test]
	fn node_test() {
		let mut g: AdjListGraph<String> = AdjListGraph::new();
		let n1 = g.add_node("Hello".into());
		let n2 = g.add_node("World".into());
		assert_eq!(g.value(n1), "Hello");
		assert_eq!(g.value(n2), "World");
	}

#[test]
	fn neighbors_test() {
		let mut g: AdjListGraph<String> = AdjListGraph::new();
		let n1 = g.add_node("Hello".into());
		let n2 = g.add_node("World".into());
		g.add_edge(n1, n2);
		assert_eq!(g.neighbors(n1), &[n2]);
		assert_eq!(g.neighbors(n2), &[]);
	}

#[test]
	fn connected_test() {
		let mut g: AdjListGraph<String> = AdjListGraph::new();
		let n1 = g.add_node("Hello".into());
		let n2 = g.add_node("World".into());
		let n3 = g.add_node("Foobar".into());
		g.add_edge(n1, n2);

		assert!(g.connected(n1, n2));
		assert!(!g.connected(n1, n3));
	}
}
