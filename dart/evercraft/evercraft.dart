import "package:test/test.dart";

class Character {
  String name;
  String _alignment;
  
  alignment([alignment]) {
    String name;
    String _alignment;
    
    if (alignment != null) {
      var acceptedAlignments = [
        "good", 
        "neutral", 
        "evil"
      ];      
      
      alignment = alignment.toLowerCase();

      if (acceptedAlignments.contains(alignment)) {
        this._alignment = alignment;
      } else {
        throw new ArgumentError('Invalid alignment. Valid choices are good, neutral, and evil.');
      }
    }

   return this._alignment;
  }

  Character(String name, [String alignment = 'neutral']) {
    this.name = name;
    this._alignment = alignment;
  }
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
      expect(testchar.alignment(), equals('neutral'));
    });

    test("should be able to change alignment", () {
      var testchar = new Character('Cinder');
      testchar.alignment("Evil");
      expect(testchar.alignment(), equals('evil'));
    });

    test("can be initialized with an alignment", () {
      var testchar = new Character('Yang', 'good');
      expect(testchar.alignment(), equals('good'));
    });

  });
}
