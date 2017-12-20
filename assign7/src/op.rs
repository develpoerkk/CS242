use std::sync::Arc;
use std::fmt;

#[derive(Clone)]
pub enum Op {
    Map(Arc<Fn(f64) -> f64 + Send + Sync>),
    Filter(Arc<Fn(&f64) -> bool + Send + Sync>),
    GroupBy(
        Arc<Fn(f64) -> i64 + Send + Sync>,
        Arc<Fn(&Vec<f64>) -> f64 + Send + Sync>
    ),
}

impl fmt::Debug for Op {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            &Op::Map(_) => write!(f, "Map"),
            &Op::Filter(_) => write!(f, "Filter"),
            &Op::GroupBy(_, _) => write!(f, "GroupBy"),
        }
    }
}
