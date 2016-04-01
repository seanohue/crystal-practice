
require "spec"

class Character
  def initialize(name)
    @name = name
    @alignment = "Neutral"
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
end

# spec

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


end
