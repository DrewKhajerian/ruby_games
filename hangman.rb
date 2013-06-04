# The game master, our computer, generates a random word with every letter 
# replaced by an underscore.

# The player is prompted to guess their first letter.

# If that letter matches any of the letters in the word, remove underscore and 
# replace with said letter and the number of guesses doesn't change.

# If the letter is not in the word, the number of chances is reduced by 1 and 
# the game outputs (#{incorrect_chances}/8 FAILED GUESSES, and the incorrect guess 
# is added to a list of letters that are not in the word.

#To win the payer must guess all of the letters correctly before the 8th incorrect guess.


class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

  def initialize()
    @chances = 8
    @guesses = []
    @word    = LIST.sample
    @board   = Array.new(word.length, "_")
  end
  
  # populate incorrect guesses as an array to create a list for the player to see as they continue to play.
  def guesses
  	@guesses.to_s
  end

  # return true if word has letter
  def word_has?(letter)
    array = word.split("")
  	array.each do |x| 
  	  if x == letter
  	    true
  	  end
    end
  end


  # replace position of board with the actual letter
  # find where the letter is in the word
  def put_letter_on_board(letter)
    index_array = []
    @word.each_char do |x|
      if x == letter
        index_array << @word.index(letter)
      end
    end

    for i in 0..index_array.length-1
      board[index_array[i]] = letter
    end
    
  	
  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
  	array = word.split("")
  	array.each do |x| 
  	  if x != letter
  	    chances -= 1
  	  end
  	end
    @guesses << letter
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    if word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    # array = @board.select { |x| x == "_"}
    @board.inject(true) {|b, x| b && x != "_"}
    #   true
    # end
  end

  # return true if @chances is 0, otherwise return false
  def lost?
      if chances == 0
      	return true
      end
  end
  
end