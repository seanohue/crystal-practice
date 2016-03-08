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
	(1..10).each do |time|
		puts time.to_s + ": " + die.roll.to_s
	end
end


