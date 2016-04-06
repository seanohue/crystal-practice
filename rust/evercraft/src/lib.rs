

#[cfg(test)]
mod test {

    struct Character {
      name: String
    }

    #[test]
    fn it_works() {
    }
    
    #[test]
    fn can_name() {
      let bob = Character { name: "Bob" };
      assert!(bob.name == "Bob");
    }
}
