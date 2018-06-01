require 'pry'
require_relative 'board'
require_relative 'boardcase'
require_relative 'player'

class Game

	def initialize
		puts "Let's playe Mastermind!"
		puts "Please enter your name"
		player_name = gets.chomp
		@player = Player.new(player_name)
		@board = Board.new
		play
	end

	def play
		i = @board.boardcases_length
		t = -6
		8.times do |turn|
			puts "#{@player.name} enter 5 times one figure to guess the combination"
			5.times do |chomp| 
				choice = gets.chomp.to_i
				i += 1
				@board.change_boardcase_value(choice, i, t)
			end
			@board.combination_checking(i, t)
			t -= 10
			@board.print_case_value
		end
	end

end

Game.new