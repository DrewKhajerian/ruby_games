require_relative "tic_tac_toe.rb"

class TicTacToeRunner

  def self.run
	@game = TicTacToe.new()
  i = 0
	while true
	  	
    # game runs here!
    puts ""
		puts "\n#{@game.setup_board}"
		puts "#{@game.player} enter move"
		choice = gets.chomp
		puts ""
		@game.move(choice.to_i)
		if @game.tie?
			puts "It's a tie!"
			break
		elsif @game.win?
			break
		end
	end

	end
end

TicTacToeRunner.run