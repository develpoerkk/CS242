use std::collections::{HashMap, HashSet};
use std::collections::BinaryHeap;
use std::collections::VecDeque;
use std::hash::{Hash, Hasher};
use std::iter::FromIterator;
use std::cell::RefCell;
use std::rc::Rc;

// Graph Library by Rao
// Note: avoid directly accessing node due to this represetation

// -------- Node Implementation -------
#[derive(Eq, Debug)]
pub struct NodeType {
    name: String,
    into: HashSet<String>,     // once an arc is constructed, it is never changed, but node is not
    goto: HashSet<String>
}

impl NodeType {
    pub fn new(s: &str) -> Rc<RefCell<NodeType>> {
        return  Rc::new(RefCell::new(NodeType {
            name: String::from(s),
            into: HashSet::new(),
            goto: HashSet::new()
        }));
    }
}

impl Hash for NodeType {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.name.hash(state);
    }
}

impl PartialEq for NodeType {
    fn eq(&self, other: &NodeType) -> bool {
        return self.name == other.name;
    }
}

// -------- Arc Implenetation --------
#[derive(Eq, Debug)]
pub struct ArcType {
    weight: i32,
    nickname: String,
    start: Rc<RefCell<NodeType>>,    // node should be able to change, when a new edge is added into the graph
    finish: Rc<RefCell<NodeType>>
}

impl ArcType {
    pub fn new(w: i32, s: &Rc<RefCell<NodeType>>, f: &Rc<RefCell<NodeType>>) -> ArcType {
        return ArcType {
            weight: w,
            nickname: (*s).borrow().name.clone() + "@#@" + &(*f).borrow().name,
            start: Rc::clone(s),
            finish: Rc::clone(f)
        }; 
    }
}

impl Hash for ArcType {
    fn hash<H: Hasher>(&self, state: &mut H) {  // pay attention here, if there is an issue, it must be here
        self.nickname.hash(state);
    }
}

impl PartialEq for ArcType {
    fn eq(&self, other: &ArcType) -> bool {
        return self.nickname == other.nickname;
    }
}

// -------- Graph Implementation --------
pub struct AdjListGraph {
    nodes: HashMap<String, Rc<RefCell<NodeType>>>,
    edges: HashMap<String, ArcType>
}

impl AdjListGraph {
    pub fn new() -> AdjListGraph {
        return AdjListGraph {
            nodes: HashMap::new(),
            edges: HashMap::new()
        };
    }

    pub fn add_node(&mut self, name: &str) -> Rc<RefCell<NodeType>> {
        let key = String::from(name);
        let node = NodeType::new(name);
        if self.nodes.contains_key(&key) {
            panic!("This node exists!")
        } else {
            self.nodes.insert(key, Rc::clone(&node));
            return node;
        }
    }

    pub fn get_value(&self, node: &Rc<RefCell<NodeType>>) -> Option<String> {
        for val in self.nodes.values() {
            if *val == *node {
                return Some((*node).borrow().name.clone());
            }
        }
        return None;
    }

    pub fn get_node(&self, name: &str) -> Option<Rc<RefCell<NodeType>>> {
        let key = String::from(name);
        if self.nodes.contains_key(&key) {
            return Some(self.nodes.get(&key).unwrap().clone());
        } else {
            return None; 
        }
    }

    pub fn get_weight(&self, from: &Rc<RefCell<NodeType>>, to: &Rc<RefCell<NodeType>>) -> Option<i32> {
        if !self.nodes.contains_key(&(*from).borrow().name) {
            return None;
        }
        if !self.nodes.contains_key(&(*to).borrow().name) {
            return None;
        }
        let arc = ArcType::new(0, from, to);
        let nickname = arc.nickname.clone();
        if self.edges.contains_key(&nickname) {
            let weight = self.edges.get(&nickname).unwrap().weight;
            return Some(weight);
        } else {
            return None;
        }
    }

    pub fn add_edge(&mut self, weight: i32, from: &Rc<RefCell<NodeType>>, to: &Rc<RefCell<NodeType>>) -> () {
        if !self.nodes.contains_key(&(*from).borrow().name) {
            panic!("Start is not in the graph!");
        }
        if !self.nodes.contains_key(&(*to).borrow().name) {
            panic!("Finish is not in the graph!");
        }
        let arc = ArcType::new(weight, from, to);
        let nickname = arc.nickname.clone();
        // add to edges
        if self.edges.contains_key(&arc.nickname) {
            panic!("This edge exists in the graph!");
        } else {
            self.edges.insert(nickname.clone(), arc);
        }
        // add to start node and finish node 
        {
            if (*from).borrow().goto.contains(&nickname) {
                panic!("This edge exists in the start set!");
            } else {
                (*from).borrow_mut().goto.insert(nickname.clone()); 
            }
        }
        {
            if (*to).borrow().goto.contains(&nickname) {
                panic!("This edge exists in the finish set!");
            } else {
                (*to).borrow_mut().into.insert(nickname.clone());
            }
        }
        // return a reference to the edges hashmap
        // return &self.edges.get(&nickname).unwrap();
        // return a value will cause mutable borrow self twice !!!
    }


    fn all_reachable(&self, node: &Rc<RefCell<NodeType>>) -> HashSet<String> {
        if !self.nodes.contains_key(&(*node).borrow().name)  {
            panic!("This node does not exist in the graph!");
        }
        let mut queue: VecDeque<String> = VecDeque::new();
        let mut visit: HashSet<String> = HashSet::new();
        queue.push_back((*node).borrow().name.clone());
        visit.insert((*node).borrow().name.clone());
        while !queue.is_empty() {
            let curr_node = queue.pop_front().unwrap();          // String
            let temp = self.nodes.get(&curr_node).unwrap();      // Rc<Ref<NodeType>>
            let neighbors = (*temp).borrow().goto.clone();       // all goto edges keys
            for neighbor in neighbors {                          // neighbor is key for edge
                let arc = self.edges.get(&neighbor).unwrap();    // &ArcType
                let next_node = arc.finish.clone();
                let name = (*next_node).borrow().name.clone();
                if !visit.contains(&name) {
                    queue.push_back(name.clone());
                    visit.insert(name.clone());
                }
            }
        }
        return visit;
    }

    pub fn connected(&self, n1: &Rc<RefCell<NodeType>>, n2: &Rc<RefCell<NodeType>>) -> bool {
        let names = self.all_reachable(n1);
        return names.contains(&(*n2).borrow().name);
    }

    pub fn clear(&mut self) -> () {
        self.edges.clear();
        self.nodes.clear();
    }

    pub fn is_empty(&self) -> bool {
        return self.nodes.len() == 0;
    }

    pub fn neighbors(&self, node: &Rc<RefCell<NodeType>>) -> HashSet<String> {
        if !self.nodes.contains_key(&(*node).borrow().name)  {
            panic!("This node does not exist in the graph!");
        }
        let keys = (*node).borrow().goto.clone();
        let mut set = HashSet::new();
        for key in keys {
            let val = self.edges.get(&key).unwrap();
            set.insert((*val.finish).borrow().name.clone());
        }
        return set; 
    }

    pub fn nodes(&self) -> HashSet<String> {
        return HashSet::<String>::from_iter(self.nodes.keys().cloned());
    }
    
    pub fn edges(&self) -> HashSet<(String, String)> {
        let mut set = HashSet::new();
        for v in self.edges.values() {
            let start = (*v.start).borrow().name.clone();
            let finish = (*v.finish).borrow().name.clone();
            set.insert((start, finish));
        }
        return set;
    } 

    pub fn remove_edge(&mut self, from: &Rc<RefCell<NodeType>>, to: &Rc<RefCell<NodeType>>) -> () {
        let arc = ArcType::new(0, from, to);
        let nickname = arc.nickname.clone();
        (*arc.start).borrow_mut().goto.remove(&nickname);
        (*arc.finish).borrow_mut().goto.remove(&nickname);
        self.edges.remove(&nickname);
    }

    pub fn remove_node(&mut self, node: &Rc<RefCell<NodeType>>) -> String {
        let name = (*node).borrow().name.clone();
        if !self.nodes.contains_key(&name) {
            panic!("This node does not exist in the graph!");
        }
        // in-coming edges removal
        let into_edges = (*node).borrow().into.clone();
        for e in &into_edges {
            let from_node = self.edges.get(e).unwrap().start.clone();
            (*from_node).borrow_mut().goto.remove(e);
            self.edges.remove(e);
        }
        // out-going edges removal
        let goto_edges = (*node).borrow().goto.clone();
        for e in &goto_edges {
            let to_node = self.edges.get(e).unwrap().finish.clone();
            (*to_node).borrow_mut().into.remove(e);
            self.edges.remove(e);
        }
        // node removal
        self.nodes.remove(&name);
        return "hey".into();
    }

    pub fn dijkstra(&self, from: &Rc<RefCell<NodeType>>, to: &Rc<RefCell<NodeType>>) -> Vec<String> {
        if !self.nodes.contains_key(&(*from).borrow().name) {
            panic!("Start node does not exist in the graph");
        }
        if !self.nodes.contains_key(&(*to).borrow().name) {
            panic!("Start node does not exist in the graph");
        }
        let mut heap = BinaryHeap::new();
        let mut set = HashSet::new();
        let start_name = (*from).borrow().name.clone();
        heap.push((0, vec![start_name]));
        while !heap.is_empty() {
            let curr_unit = heap.pop().unwrap();
            let curr_dist = curr_unit.0;
            let curr_path= curr_unit.1;
            let curr_name = curr_path[curr_path.len() - 1].clone();
            let curr_node = self.nodes.get(&curr_name).unwrap();
            if curr_node == to {
                return curr_path;
            }
            if set.contains(&curr_name) {
                continue;
            } else {
               set.insert(curr_name);
               let neighbors = self.neighbors(&curr_node);  // all the next node names
               for neighbor in neighbors {
                   let next_node = self.nodes.get(&neighbor).unwrap();
                   let weight = self.get_weight(&curr_node, &next_node).unwrap();
                   let dist = curr_dist - weight;
                   let mut path = curr_path.clone();
                   path.push(neighbor);
                   heap.push((dist, path));
               }
            }
        }
        return Vec::<String>::new();
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn node_eq() {
        let n01 = NodeType::new("node0");
        let n02 = NodeType::new("node0");
        let n11 = NodeType::new("node1");

        assert_eq!(n01, n02);
        assert_ne!(n01, n11);
    }

    #[test]
    fn edge_eq() {
        let n01 = NodeType::new("node0");
        let n02 = NodeType::new("node0");
        let n11 = NodeType::new("node1");

        let e01 = ArcType::new(1, &n01, &n11);
        let e02 = ArcType::new(2, &n02, &n11);
        let e11 = ArcType::new(3, &n11, &n02);

        assert_eq!(e01, e02);
        assert_ne!(e01, e11);
    }

    #[test] 
    fn add_node_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = NodeType::new("node");

        assert_eq!(g.get_value(&n1), Some("hello".into()));
        assert_eq!(g.get_value(&n2), Some("world".into()));
        assert_eq!(g.get_value(&n3), None);
    }

    #[test]
    fn get_node_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");

        assert_eq!(g.get_node("hello"), Some(n1));
        assert_eq!(g.get_node("world"), Some(n2));
        assert_eq!(g.get_node("abcde"), None);
    }

    #[test]
    fn add_edge_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 
        g.add_edge(3, &n3, &n1); 
    }

    #[test]
    fn reachable_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 
        g.add_edge(3, &n3, &n1); 
        let nodes = g.all_reachable(&n1);
        assert_eq!(nodes, HashSet::<String>::from_iter(vec!["hello".into(), "world".into(), "excel".into()]));
    }

    #[test]
    fn connectivity_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        assert!(g.connected(&n1, &n2));
        assert!(!g.connected(&n2, &n1));
        assert!(g.connected(&n1, &n3));
    }

    #[test]
    fn empty_test() {
        let mut g = AdjListGraph::new();
        assert!(g.is_empty());
        g.add_node("hello");
        assert!(!g.is_empty());
    }

    #[test]
    fn get_weight_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        assert_eq!(g.get_weight(&n1, &n2), Some(1));
        assert_eq!(g.get_weight(&n2, &n3), Some(2));
        assert_eq!(g.get_weight(&n2, &n1), None);
    }

    #[test]
    fn neighbors_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n1, &n3); 

        assert_eq!(g.neighbors(&n1), HashSet::<String>::from_iter(vec!["world".into(), "excel".into()]));
        assert_eq!(g.neighbors(&n2), HashSet::<String>::from_iter(vec![]));
        assert_eq!(g.neighbors(&n3), HashSet::<String>::from_iter(vec![]));
    }

    #[test]
    fn nodes_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        let vector = vec![("hello".into(), "world".into()), ("world".into(), "excel".into())];
        assert_eq!(g.edges(), HashSet::<(String, String)>::from_iter(vector));
    }

    #[test]
    fn remove_edge_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        assert!(g.connected(&n1, &n3));
        assert!(g.connected(&n1, &n2));
        assert!(g.connected(&n2, &n3));

        g.remove_edge(&n1, &n2);
        assert!(g.connected(&n2, &n3));
        assert!(!g.connected(&n1, &n2));
        assert!(!g.connected(&n1, &n3));

        let vector = vec![("world".into(), "excel".into())];
        assert_eq!(g.edges(), HashSet::<(String, String)>::from_iter(vector));
    }

    #[test]
    fn remove_node_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 
        g.add_edge(3, &n3, &n1); 
        
        assert!(g.connected(&n1, &n2));
        assert!(g.connected(&n1, &n3));
        assert!(g.connected(&n2, &n1));
        assert!(g.connected(&n2, &n3));
        assert!(g.connected(&n3, &n1));
        assert!(g.connected(&n3, &n2));

        g.remove_node(&n1);

        assert!(g.connected(&n2, &n3));
        let vector = vec!["world".into(), "excel".into()];
        assert_eq!(g.nodes(), HashSet::<String>::from_iter(vector));
        assert_eq!(g.neighbors(&n2), HashSet::<String>::from_iter(vec!["excel".into()]));
        let vector = vec![("world".into(), "excel".into())];
        assert_eq!(g.edges(), HashSet::<(String, String)>::from_iter(vector));
    }

    #[test]
    fn dijkstra_test() {
        let mut g: AdjListGraph = AdjListGraph::new();
        let a = g.add_node("a".into());
        let b = g.add_node("b".into());
        let c = g.add_node("c".into());
        let d = g.add_node("d".into());
        g.add_edge(3, &a, &c);
        g.add_edge(1, &a, &d);
        g.add_edge(2, &c, &d);
        g.add_edge(1, &d, &c);
        g.add_edge(1, &c, &b);
        g.add_edge(3, &d, &b);

        assert_eq!(g.dijkstra(&a, &b), vec!["a", "d", "c", "b"]);
    }
}
