class Board
	attr_accessor :boardcases

	def initialize
		@boardcases = %w(
										 X X X X X
										 X X X X X
										 X X X X X
										 X X X X X
										 X X X X X
										 X X X X X
										 X X X X X										 
										 X X X X X
										 )
		@random_combination = []
		5.times do |x| 
		@random_combination << rand(6)
		end
	binding.pry
	print_case_value
	end

	def boardcases_length
		@boardcases.length
	end

	def print_case_value
		puts "Voici la grille"
		puts
		i = 1
			@boardcases.each do |boardcase|
				print " # " + boardcase.to_s + " # "
				if i%5 == 0
					puts
				end
				break if @boardcases.length == i
				i += 1
			end
	end

	def change_boardcase_value(choice, i, t)
		@boardcases[(i + t)] = choice
	end

	def combination_checking(i, t)
		n = i+t
		n2 = i+t-4
		tour_combination = @boardcases.slice(n2..n)
		z = 0

		tour_combination.each do |x|
			if 	@random_combination.include?(x) && x == @random_combination[z]
				puts "#{x} is at the right position !"
			elsif @random_combination.include?(x)
				puts "#{x} is include in the secret combination but not at the right position"					
			else
				puts "#{x} is not included in the secret combination"
			end
			z += 1
		end
	end

end