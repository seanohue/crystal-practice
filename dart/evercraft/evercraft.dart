import "package:test/test.dart";

enum Alignment { good, neutral, evil }

class Character {
  String name;
  Alignment _alignment;
  int armorClass;
  int hitPoints;
  bool alive = true;

  set alignment(Alignment alignment) {
    if (Alignment.values.contains(alignment)) {
      _alignment = alignment;
    } else {
      throw new ArgumentError("New alignment is invalid.");
    }
  }

  Alignment get alignment => _alignment;

  // Guaranteed to be random
  bool hit(Character opponent, [int toHitRoll = 4]) {
    bool success = opponent.armorClass < toHitRoll;
    int amount = 1;

    if (toHitRoll == 20) {
      amount = amount * 2;
    }

    if (success) {
      opponent.damage(amount);
    }

    return success;
  }

  damage([int amount = 1]) {
    hitPoints -= amount;
  }

  Character(String name, {Alignment alignment, int armorClass, int hitPoints})
      : name = name,
        _alignment = alignment ?? Alignment.neutral,
        armorClass = armorClass ?? 10,
        hitPoints = hitPoints ?? 5;
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
        expect(testchar.alignment, equals(Alignment.neutral));
      });

      test("should be able to change alignment", () {
        var testchar = new Character('Cinder');
        testchar.alignment = Alignment.evil;
        expect(testchar.alignment, equals(Alignment.evil));
      });

      test("can be initialized with an alignment", () {
        var testchar = new Character('Yang', alignment: Alignment.good);
        expect(testchar.alignment, equals(Alignment.good));
      });

      test("should throw exception for invalid alignment", () {
        var testchar = new Character('Bean');
        expect(() => testchar.alignment = 'burrito', throwsArgumentError);
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

    group("Combat abilities", () {
      test("should be able to hit an opponent with a low armor class", () {
        var attacker = new Character("Sherlock");
        var defender = new Character("Watson", armorClass: 1);
        expect(attacker.hit(defender), equals(true));
      });

      test("should miss opponent with an armor class higher than tohit roll",
          () {
        var attacker = new Character("Shadow");
        var defender = new Character("Colossus", armorClass: 20);
        expect(attacker.hit(defender), equals(false));
      });

      test("should damage opponent by 1 if the attack hits", () {
        var attacker = new Character("Blake");
        var defender = new Character("Grimm", armorClass: 13);
        var init_hp = defender.hitPoints;

        attacker.hit(defender, 14);
        assert(defender.hitPoints == init_hp - 1);
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
