# As a character I want to have a name so that I can be distinguished from other characters
require "spec"

class Character
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name(name)
    @name = name
  end
end

describe "Character" do

  describe "#getName" do
    it "correctly gets the name" do
      test_char = Character.new "Triss"
      test_char.name.should eq "Triss"
    end
  end

  describe "#setName" do
    it "correctly sets the name" do
      test_char = Character.new "Bob"
      test_char.name "Frangelica"
      test_char.name.should eq "Frangelica" 
    end
  end

end
