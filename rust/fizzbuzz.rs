fn main(){
	let mut count = 0u32;
	
	loop{

		count += 1;
		if count % 3 == 0 {
			print!("Fizz");
		}
		if count % 5 == 0 {
			print!("Buzz");
		}
		if (count % 3 != 00 && count % 5 != 0) {
			print!("{}", count);
		}
		println!("");
		if (count == 100) {
			break;
		}
	}
}