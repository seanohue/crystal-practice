import "package:test/test.dart";

class Character {
  String name;
  String _alignment;
  int armorClass;
  int hitPoints;
  bool alive = true;
  
  alignment([alignment]) {

    if (alignment != null) {
      final acceptedAlignments = [
        "good", 
        "neutral", 
        "evil"
      ];

      alignment = alignment.toLowerCase();

      if (acceptedAlignments.contains(alignment)) {
        this._alignment = alignment;
      } else {
        throw new ArgumentError(
          'Invalid alignment. Valid choices are good, neutral, and evil.');
      }
    }

   return this._alignment;
  }
                        // Guaranteed to be random
  bool hit(Character opponent, [int toHitRoll = 4]){
    bool success = opponent.armorClass < toHitRoll;
    int amount = 1;

    if (toHitRoll == 20){
      amount = amount * 2;
    }
    
    if (success){
      opponent.damage(amount);
    }

    return success;
  }

  damage([int amount = 1]) {
    this.hitPoints = this.hitPoints - amount;
  }

  Character( String  name, 
           { String  alignment:   "neutral",
             int  armorClass: 10,
             int  hitPoints:  5 }) 
  {
    this.name       = name;
    this._alignment = alignment;
    this.armorClass = armorClass;
    this.hitPoints  = hitPoints;
  }
}

void main() {
  group("Character", () {

    group("Name and alignment", () {

      test("should have a name", () {
        var testchar = new Character('Kaim');
        expect(testchar.name, equals('Kaim'));
      });

      test("should be able to change name", () {
        var testchar = new Character('Seth');
        testchar.name = 'Jansen';
        expect(testchar.name, equals('Jansen'));
      });

      test("should have an alignment", () {
        var testchar = new Character('Frodo');
        expect(testchar.alignment(), equals('neutral'));
      });

      test("should be able to change alignment", () {
        var testchar = new Character('Cinder');
        testchar.alignment("Evil");
        expect(testchar.alignment(), equals('evil'));
      });

      test("can be initialized with an alignment", () {
        var testchar = new Character('Yang', alignment: 'good');
        expect(testchar.alignment(), equals('good'));
      });

      test("should throw exception for invalid alignment", () {
        var testchar = new Character('Bean');
        expect( () => testchar.alignment('burrito'), throwsArgumentError);
      });

      test("should have armor class, default 10", () {
        var testchar = new Character('Broomhilda');
        expect(testchar.armorClass, equals(10));
      });

      test("should have hitpoints, default 5", () {
        var testchar = new Character('Django');
        expect(testchar.hitPoints, equals(5));
      });

    });

    group("Combat abilities", (){

      test("should be able to hit an opponent with a low armor class", () {
        var attacker = new Character("Sherlock");
        var defender = new Character("Watson", armorClass: 1);
        expect(attacker.hit(defender), equals(true));
      });

      test("should miss opponent with an armor class higher than tohit roll", () {
        var attacker = new Character("Shadow");
        var defender = new Character("Colossus", armorClass: 20);
        expect(attacker.hit(defender), equals(false));
      });

      test("should damage opponent by 1 if the attack hits", () {
        var attacker = new Character("Blake");
        var defender = new Character("Grimm", armorClass: 13);
        var init_hp = defender.hitPoints;

        attacker.hit(defender, 14);
        assert(defender.hitPoints == init_hp -1);
      });

      test("should damage opponent by 2 if the attack is a crit", () {
        var attacker = new Character("Drizzt");
        var defender = new Character("kobold", armorClass: 2);
        var init_hp = defender.hitPoints;

        attacker.hit(defender, 20);
        assert(defender.hitPoints == init_hp - 2); 
      });

    });

  });
}
