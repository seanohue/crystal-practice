import "package:test/test.dart";

class Character {
  String name;
  String alignment = "Neutral";

  Character(this.name);
}

void main() {
  group("Character", () {

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
      expect(testchar.alignment, equals('Neutral'));
    });

    test("should be able to change alignment", () {
      var testchar = new Character('Cinder');
      testchar.alignment = "Evil";
      expect(testchar.alignment, equals('Evil'));
    });

  });
}
