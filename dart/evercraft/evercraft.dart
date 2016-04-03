import "package:test/test.dart";

class Character {
  String name;

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

  });
}
