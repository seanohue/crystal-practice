

#[cfg(test)]
mod test {

    struct Character {
      name: String,
      alignment: String
    }

    #[test]
    fn it_works() {
    }
    
    #[test]
    fn can_name() {
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
}
