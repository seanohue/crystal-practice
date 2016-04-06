

#[cfg(test)]
mod test {

    struct Character {
      name: String,
      alignment: String
    }

    #[test]
    fn it_works() {}

    #[test]
    fn has_name() {
      let bob = Character { 
        name:      "Bob" .to_string(),
        alignment: "good".to_string() 
      };

      assert!(bob.name == "Bob");
    }

    #[test]
    fn can_change_name() {
      let mut sally = Character { 
        name:      "Francesca".to_string(),
        alignment: "good"     .to_string() 
      };

      sally.name = "Sally".to_string();
      
      assert!(sally.name == "Sally");
    }

    #[test]
    fn has_alignment() {
      let surprise = Character {
        name:      "Ciri"   .to_string(), 
        alignment: "neutral".to_string()
      };

      assert!(surprise.alignment == "neutral");
    }

    #[test]
    fn can_change_alignment(){
      let mut ben = Character {
        name:      "Ben Solo".to_string(),
        alignment: "neutral" .to_string()
      };

      ben.name      = "Kylo Ren".to_string();
      ben.alignment = "evil"    .to_string();

      assert!(ben.alignment == "evil");
    }
}
