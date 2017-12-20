mod lib;
use lib::*;

use std::collections::HashSet;
use std::iter::FromIterator;

fn main() {
    // #[test]
    // fn node_eq() {
        let n01 = NodeType::new("node0");
        let n02 = NodeType::new("node0");
        let n11 = NodeType::new("node1");

        assert_eq!(n01, n02);
        assert_ne!(n01, n11);
    // }

    // #[test]
    // fn edge_eq() {
        let n01 = NodeType::new("node0");
        let n02 = NodeType::new("node0");
        let n11 = NodeType::new("node1");

        let e01 = ArcType::new(1, &n01, &n11);
        let e02 = ArcType::new(2, &n02, &n11);
        let e11 = ArcType::new(3, &n11, &n02);

        assert_eq!(e01, e02);
        assert_ne!(e01, e11);
    // }

    // #[test] 
    // fn add_node_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = NodeType::new("node");

        assert_eq!(g.get_value(&n1), Some("hello".into()));
        assert_eq!(g.get_value(&n2), Some("world".into()));
        assert_eq!(g.get_value(&n3), None);
        g.clear();
    // }

    // #[test]
    // fn get_node_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");

        assert_eq!(g.get_node("hello"), Some(n1));
        assert_eq!(g.get_node("world"), Some(n2));
        assert_eq!(g.get_node("abcde"), None);
        g.clear();
    // }

    // #[test]
    // fn add_edge_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 
        g.add_edge(3, &n3, &n1); 
        g.clear();
    // }

    // #[test]
    // fn reachable_test() {
        // let mut g = AdjListGraph::new();
        // let n1 = g.add_node("hello");
        // let n2 = g.add_node("world");
        // let n3 = g.add_node("excel");
        // g.add_edge(1, &n1, &n2);
        // g.add_edge(2, &n2, &n3); 
        // g.add_edge(3, &n3, &n1); 
        // let nodes = g.all_reachable(&n1);
        // assert_eq!(nodes, HashSet::<String>::from_iter(vec!["hello".into(), "world".into(), "excel".into()]));
        // g.clear();
    // }

    // #[test]
    // fn connectivity_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        assert!(g.connected(&n1, &n2));
        assert!(!g.connected(&n2, &n1));
        assert!(g.connected(&n1, &n3));
        g.clear();
    // }

    // #[test]
    // fn empty_test() {
        let mut g = AdjListGraph::new();
        assert!(g.is_empty());
        g.add_node("hello");
        assert!(!g.is_empty());
        g.clear();
    // }

    // #[test]
    // fn get_weight_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        assert_eq!(g.get_weight(&n1, &n2), Some(1));
        assert_eq!(g.get_weight(&n2, &n3), Some(2));
        assert_eq!(g.get_weight(&n2, &n1), None);
        g.clear();
    // }

    // #[test]
    // fn neighbors_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n1, &n3); 

        assert_eq!(g.neighbors(&n1), HashSet::<String>::from_iter(vec!["world".into(), "excel".into()]));
        assert_eq!(g.neighbors(&n2), HashSet::<String>::from_iter(vec![]));
        assert_eq!(g.neighbors(&n3), HashSet::<String>::from_iter(vec![]));
        g.clear();
    // }

    // #[test]
    // fn nodes_test() {
        let mut g = AdjListGraph::new();
        let n1 = g.add_node("hello");
        let n2 = g.add_node("world");
        let n3 = g.add_node("excel");
        g.add_edge(1, &n1, &n2);
        g.add_edge(2, &n2, &n3); 

        let vector = vec![("hello".into(), "world".into()), ("world".into(), "excel".into())];
        assert_eq!(g.edges(), HashSet::<(String, String)>::from_iter(vector));
        g.clear();
    // }

    // #[test]
    // fn remove_edge_test() {
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
        g.clear();
    // }

    // #[test]
    // fn remove_node_test() {
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
        g.clear();
    // }

    // #[test]
    // fn dijkstra_test() {
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
        g.clear();
    // }
}
