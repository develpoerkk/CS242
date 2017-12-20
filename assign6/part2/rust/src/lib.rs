use std::ptr;
use std::rc::Rc;

pub fn add_n(v: Vec<i32>, n: i32) -> Vec<i32> {
	let mut x: Vec<i32> = Vec::new();
	for i in &v {
		x.push(i + n);
	}
	return x;
}

pub fn add_n_inplace(v: &mut Vec<i32>, n: i32) {
	for i in 0..v.len() {
		v[i] = v[i] + n;	
	}
}

pub fn reverse_clone<T: Clone>(v: &mut Vec<T>) {
    let n = v.len();
    for i in 0..n/2 {
        let x: T = v[i].clone();
        v[i] = v[n-i-1].clone();
        v[n-i-1] = x;
    }
}

pub fn reverse<T>(v: &mut Vec<T>) {
    /* Why doesn't this work, to just take out the .clone()?
     * It's up to you to fix the solution.
     * Also, remember that you are not allowed to use Vec's builtin
     * reverse method.
      */
    // let n = v.len();
    // for i in 0..n/2 {
    //     let x: T = v[i];
    //     v[i] = v[n-i-1];
    //     v[n-i-1] = x;
    // }

    let n = v.len();
    for i in 0..n/2 {
		unsafe {
			ptr::swap(&mut v[i], &mut v[n - i - 1]);
		}
    }
}

// pub enum Tree<T> {
//     Node(Box<Tree<T>>, T, Box<Tree<T>>),
//     Leaf
// }

// pub fn wrap<T>(t: Tree<T>) -> Box<Tree<T>> {
//     Box::new(t)
// }

pub enum Tree<T> {
    Node(Rc<Tree<T>>, T, Rc<Tree<T>>),
    Leaf
}

pub fn wrap<T>(t: Tree<T>) -> Rc<Tree<T>> {
    Rc::new(t)
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn add_one_test() {
        let v = vec![1, 2, 3, 4];
        let v2 = add_n(v, 3);
        assert_eq!(&v2, &[4, 5, 6, 7]);

        let mut v = vec![1, 2, 3, 4];
        add_n_inplace(&mut v, 2);
        assert_eq!(&v, &[3, 4, 5, 6]);
    }

	#[test]
	fn reverse_test() {
		let mut v1 = vec![1, 2, 3, 4];
		reverse(&mut v1);
		assert_eq!(&v1, &[4, 3, 2, 1]);

		let mut v2 = vec!["a", "b", "c", "d"];
		reverse(&mut v2);
		assert_eq!(&v2, &["d", "c", "b", "a"]);
	}

	#[test]
	fn tree_test() {
		let t1 = wrap(Tree::Node(
			wrap(Tree::Leaf),
			100,
			wrap(Tree::Leaf)));
		let t2 = Tree::Node(wrap(Tree::Leaf), 30, t1.clone());
		let _t3 = Tree::Node(wrap(t2), 40, t1.clone());

        // Produces the tree:
		//    40
		//   /  \
		//  30   \
		//   \   /
        //    100          
	}
}
