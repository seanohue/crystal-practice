require "spec"

class Die
	def initialize(sides)
		@sides = sides
	end

	def sides
		@sides
	end

	def roll
		rand(@sides)
	end
end


d_twenty = Die.new 20
d_six = Die.new 6
dice = [d_twenty, d_six]

dice.each do |die|
	puts "rolling d" + die.sides.to_s
	(1..10).each do |result|
		puts result.to_s + ": " + die.roll.to_s
	end
end

describe "Dice" do
  describe "#sides" do
    it "correctly reports the number of sides of dice" do
      test_die = Die.new 20
      test_die.sides.should eq 20
    end
  end

  describe "#roll" do
    it "should not give results of less than 1" do
      test_die = Die.new 20
      (1..10).each do |attempt|
      	result = test_die.roll
        (result < 1).should be_false
      end
    end

    it "should not give results of greater than @sides" do
      test_die = Die.new 6
      (1..10).each do |attempt|
      	result = test_die.roll
        (result > 6).should be_false
      end
    end
  end
end


