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

rolls = dice.each()
rolls.each { |die|
	puts "rolling d" + die.sides.to_s
	puts die.roll
	}


