# Layout the game board
# Input numbers in each empty box
# Player 1 chooses a square
# That square's number changes to corresponding x/o
# Alternate for each player until.. 
# player wins 
# it's a tie

class TicTacToe
	attr_accessor :board_array, :total_moves, :player

	def initialize 
		@board_array = ["1","2","3","4","5","6","7","8","9"]
		@total_moves = 0
		@player = "Player1"
		@move = nil
	end

	def setup_board
		for i in (0..@board_array.length)
			if i < 2
			  print "#{@board_array[i]}|"
			elsif i == 2
			  print "#{@board_array[i]}\n-----\n"
			elsif i < 5
			  print "#{@board_array[i]}|"
			elsif i == 5
			  print "#{@board_array[i]}\n-----\n"
			elsif i < 8
			  print "#{@board_array[i]}|"
			else
			  print "#{@board_array[i]}\n"
			end
		end
		print ""
	end

	def valid_move?
		if @move != [123456789]
			puts "invalid move!"
	end

  # method called when each player choses (choice argument) a square.
  # will have a for loop with counter i which alternates players1 (odd numbers)
  # and player2 (even numbers)
	def move(choice)

		if @total_moves % 2 == 0
			@board_array[choice-1] = "x"
			@player = "Player2"
		else
			@board_array[choice-1] = "o"
			@player = "Player1"
		end
		@total_moves += 1
	end

	def tie?
		total_moves == 9
	end

	def win?
	 if (@board_array[0] == "x" && @board_array[1] == "x" && @board_array[2] == "x") ||
			(@board_array[3] == "x" && @board_array[4] == "x" && @board_array[5] == "x") ||
			(@board_array[6] == "x" && @board_array[7] == "x" && @board_array[8] == "x") ||
			(@board_array[0] == "x" && @board_array[3] == "x" && @board_array[6] == "x") ||
			(@board_array[1] == "x" && @board_array[4] == "x" && @board_array[7] == "x") ||
			(@board_array[2] == "x" && @board_array[5] == "x" && @board_array[8] == "x") ||
			(@board_array[0] == "x" && @board_array[4] == "x" && @board_array[8] == "x") ||
			(@board_array[2] == "x" && @board_array[4] == "x" && @board_array[6] == "x")
				puts "Player1 wins!"
				return true
		elsif (@board_array[0] == "o" && @board_array[1] == "o" && @board_array[2] == "o") ||
			(@board_array[3] == "o" && @board_array[4] == "o" && @board_array[5] == "o") ||
			(@board_array[6] == "o" && @board_array[7] == "o" && @board_array[8] == "o") ||
			(@board_array[0] == "o" && @board_array[3] == "o" && @board_array[6] == "o") ||
			(@board_array[1] == "o" && @board_array[4] == "o" && @board_array[7] == "o") ||
			(@board_array[2] == "o" && @board_array[5] == "o" && @board_array[8] == "o") ||
			(@board_array[0] == "o" && @board_array[4] == "o" && @board_array[8] == "o") ||
			(@board_array[2] == "o" && @board_array[4] == "o" && @board_array[6] == "o")
				puts "Player2 wins!"
				return true
		end
	end
end

game = TicTacToe.new()