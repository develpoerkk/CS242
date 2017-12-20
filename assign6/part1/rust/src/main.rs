// use std::env;
use std::io;

fn main() {
	// pre-defined variables
	let secret = "Password1";
	let mut str = String::from(secret);
	str.push_str("\n");
	// read from command line
	// let args: Vec<_> = env::args().collect();
	// let max_guess: i32 = args[1].parse().unwrap();
	// start while loop
	let mut x = 1;
	// while x <= max_guess {
	while true {
		// read from console
		let mut input = String::new();
		io::stdin().read_line(&mut input);
		if input == str {
			println!("You guessed it!");
			break;
		} else {
			println!("Guesses: {}", x);
		}
		x = x + 1;
	}

}
