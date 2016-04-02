
require "spec"

class Character
  def initialize(name)
    @name = name
    @alignment = "Neutral"
    @hitpoints = 10
    @armorclass = 5
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
    if ["Good", "Evil", "Neutral"].includes? al.capitalize
      @alignment = al.capitalize
    end
  end

  def hitpoints
    @hitpoints
  end

  def armorclass
    @armorclass
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

