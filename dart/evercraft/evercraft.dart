import "package:test/test.dart";

class Character {
  String name;

  Character(this.name);
}

void main() {

  group("Character", () {

    test("should have a name", (){
      var test = new Character('Kaim');
      expect(test.name, equals('Kaim'));
    });

  });
}
