class Character
  def initialize(name)
    @name = name
    @alignment = "Neutral"
    @hitpoints = 10
    @armorclass = 5
    @abilities = {
      "constitution": 10,
      "strength":     10,
      "dexterity":    10,
      "wisdom":       10,
      "charisma":     10,
      "intelligence": 10,
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

  def hitpoints(amount)
    @hitpoints = amount
  end

  def heal(amount)
    @hitpoints += amount
  end

  def armorclass
    @armorclass + get_modifier("dexterity")
  end

  def armorclass(ac)
    if ac > -1
      @armorclass = ac
    end
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
    (@abilities[ability] / 2 - 5).to_i
  end

  def attack(tohit, defender)
    str_mod = get_modifier("strength")
    power = 1 + str_mod
    if power < 1
      power = 1
    end

    if tohit == 20
      defender.damage(power)
    end

    if (tohit + str_mod) >= defender.armorclass
      defender.damage(power)
      return true
    end

    return false
  end

  def damage
    @hitpoints -= 1
  end

  def damage(inflicted)
    @hitpoints -= inflicted
  end
end
