#[allow(dead_code)]
struct Character {
    name: String,
    alignment: String,
    armorclass: i32,
    hitpoints: i32,
}

impl Default for Character {
    fn default() -> Character {
        Character {
            name: "The Nameless One".to_string(),
            alignment: "neutral".to_string(),

            // Attributes & Abilities
            armorclass: 10,
            hitpoints: 5,
        }
    }
}

fn attack(attacker: &Character, Defender: &mut Character) {}

#[cfg(test)]
mod test {

    use Character;

    #[test]
    fn it_works() {}

    #[test]
    fn has_name() {
        let bob = Character {
            name: "Bob".to_string(),
            alignment: "good".to_string(),
            ..Default::default()
        };

        assert!(bob.name == "Bob");
    }

    #[test]
    fn can_change_name() {
        let mut sally = Character {
            name: "Francesca".to_string(),
            alignment: "good".to_string(),
            ..Default::default()
        };

        sally.name = "Sally".to_string();

        assert!(sally.name == "Sally");
    }

    #[test]
    fn has_alignment() {
        let surprise = Character { name: "Ciri".to_string(), ..Default::default() };

        assert!(surprise.alignment == "neutral");
    }

    #[test]
    fn can_change_alignment() {
        let mut ben = Character { name: "Ben Solo".to_string(), ..Default::default() };

        ben.name = "Kylo Ren".to_string();
        ben.alignment = "evil".to_string();

        assert!(ben.alignment == "evil");
    }

    #[test]
    fn has_default_hp() {
        let yoda: Character = Default::default();

        assert!(yoda.hitpoints == 5);
    }

    #[test]
    fn has_default_ac() {
        let gorgonzola: Character = Default::default();

        assert!(gorgonzola.armorclass == 10);
    }

    #[test]
    fn can_attack() {
        let mut remy: Character = Default::default();
        let mut lacroix: Character = Default::default();

        attack(&remy, &mut lacroix);

        assert!(lacroix.hitpoints == 4);
    }
}
