
require "spec"

class Character
  def initialize(name)
    @name       = name
    @alignment  = "Neutral"
    @hitpoints  = 10
    @armorclass = 5
    @abilities  = {
      "constitution": 10,
      "strength":     10,
      "dexterity":    10,
      "wisdom":       10,
      "charisma":     10,
      "intelligence": 10
    }
    @modifiers =  {
      1 => -5,
      2 => -4,
      3 => -4,
      4 => -3,
      5 => -3,
      6 => -2,
      7 => -2,
      8 => -1,
      9 => -1,
      10 => 0,
      11 => 0,
      12 => 1,
      13 => 1,
      14 => 2,
      15 => 2,
      16 => 3,
      17 => 3,
      18 => 4,
      19 => 4,
      20 => 5
    }
  end

  def name
    @name
  end

  def name(name)
    @name = name
  end

  def alignment
    @alignment
  end

  def alignment(al)
    al = al.capitalize
    if ["Good", "Evil", "Neutral"].includes? al
      @alignment = al
    end
  end

  def hitpoints
    @hitpoints
  end

  def armorclass
    @armorclass
  end

  def abilities
    @abilities
  end

  def get_ability(ability)
    @abilities[ability]
  end

  def set_ability(ability, score)
    if score < 0 
      score = 0
    elsif score > 20
      score = 20
    end

    @abilities[ability] = score
  end

  def get_modifier(ability)
    @modifiers[@abilities[ability]]
  end

  def attack(tohit, ac)
    if tohit < ac
      return 0
    end

    if tohit == 20
      return 2
    end

    return 1
  end

  def damage
    @hitpoints -= 1
  end

  def damage(inflicted)
    @hitpoints -= inflicted
  end

end

# maybe could be done with a formula where you divide by 2 and subtract 5, rounding down?


