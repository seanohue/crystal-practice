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

