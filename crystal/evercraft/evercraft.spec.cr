require "./evercraft"
require "spec"

describe "Character" do

  # As a character I want to have a name so that I can be distinguished from other characters

  describe "#name" do
    it "correctly gets the name" do
      test_char = Character.new "Triss"
      test_char.name.should eq "Triss"
    end
    
    it "correctly sets the name" do
      test_char = Character.new "Bob"
      test_char.name "Frangelica"
      test_char.name.should eq "Frangelica" 
    end
  end

  # As a character I want to have an alignment so that I have something to guide my actions

  describe "#alignment" do
    it "correctly gets the alignment" do
      test_char = Character.new "Hodor"
      test_char.alignment.should eq "Neutral"
    end

    it "correctly sets the alignment" do
      test_char = Character.new "Beelzebub"
      test_char.alignment "evil"
      test_char.alignment.should eq "Evil"
    end

    it "only works for valid alignments" do
      test_char = Character.new "Burrito"
      test_char.alignment "taco bell"
      test_char.alignment.should eq "Neutral"
    end
  end

  # As a combatant I want to have an armor class and hit points so that I can resist attacks from my enemies

  describe "#hitpoints" do
    it "correctly sets the default HP to 10" do
      test_char = Character.new "Xena"
      test_char.hitpoints.should eq 10
    end
  end

  describe "#armorclass" do
    it "correctly sets default AC to 5" do
      test_char = Character.new "Hercules"
      test_char.armorclass.should eq 5
    end
  end

  # As a combatant I want to be able to attack other combatants so that I can survive to fight another day

  describe "#attack" do
    it "returns 1 if roll beats AC" do
      test_char = Character.new "Pidgeotto"
      hit = test_char.attack 15, 10
      hit.should eq 1
    end

    it "returns 0 if roll lower than AC" do
      test_char = Character.new "Magikarp"
      hit = test_char.attack 3, 10
      hit.should eq 0
    end
  end

  # As an attacker I want to be able to damage my enemies so that they will die and I will live

  describe "#damage" do
    it "does 1 damage by default to defender if attack hits" do
      attacker = Character.new "Lion"
      defender = Character.new "Zebra"
      hit = attacker.attack 10, defender.armorclass
      before_hp = defender.hitpoints

      if hit
        defender.damage
      end

      defender.hitpoints.should eq (before_hp - 1)
    end

    it "can do a specified amount of damage" do
      attacker = Character.new "Lion"
      defender = Character.new "Zebra"
      hit = attacker.attack 10, defender.armorclass
      before_hp = defender.hitpoints

      if hit
        defender.damage 5
      end

      defender.hitpoints.should eq (before_hp - 5)
    end

    it "does critical damage if attacker rolls a 20" do
      attacker = Character.new "Drizzt"
      defender = Character.new "kobold"
      hit = attacker.attack 20, defender.armorclass
      before_hp = defender.hitpoints

      if hit
        defender.damage (hit * 1)
      end
      defender.hitpoints.should eq (before_hp - 2)
    end
  end

# As a character I want to have several abilities so that I am not identical to other characters except in name


  describe "#abilities" do
    it "defaults to 10 for all abilities" do
      test_char = Character.new "Pantalones McGee"
      defaults = test_char.abilities
      defaults.each { |key, value| value.should eq 10 }
    end

    it "should be able to get a specific ability" do
      test_char = Character.new "Cooke"
      strength = test_char.get_ability "strength"
      strength.should eq 10
    end

    it "should be able to set or change abilities" do
      test_char = Character.new "Bruce Banner"
      test_char.set_ability("strength", 20)
      hulked = test_char.get_ability "strength"
      hulked.should eq 20
    end

    it "should have a modifier score" do
      test_char = Character.new "Average"
      str_mod = test_char.get_modifier "strength" 
      str_mod.should eq 0
    end

    it "should work for multiple modifiers" do
      wiz = Character.new "Merlin"
      wiz.set_ability("wisdom", 20)
      wiz_mod = wiz.get_modifier "wisdom"
      wiz_mod.should eq 5

      wimp = Character.new "Stanley"
      wimp.set_ability("constitution", 3)
      con_mod = wimp.get_modifier "constitution"
      con_mod.should eq -4

      rogue = Character.new "Beatrice"
      rogue.set_ability("dexterity", 16)
      dex_mod = rogue.get_modifier "dexterity"
      dex_mod.should eq 3

    end

    # As a character I want to apply my ability modifiers improve my capabilities in combat so that I can vanquish my enemy with extreme prejudice

    describe "ability bonuses" do

      it "should add dexterity bonus to armor class" do
        ninja = Character.new "Ninja"
        ninja.set_ability("dexterity", 20)
        ninja.armorclass.should eq 10
      end

      describe "strength bonuses" do
        tank = Character.new "Tank"
        tank.set_ability("strength", 18);
        mook = Character.new "Mook"

        it "should add strength bonus to damage dealt"
          # oh god i need to refactor all of the things
        end

      end
    end

  end
end
