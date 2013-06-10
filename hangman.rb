class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

  class InvalidGuessException < Exception 
    # empty because it inherents from Exception class
  end

  def initialize()
    @chances = 8
    @guesses = []
    @word    = LIST.sample
    @board   = draw_board(@word)
  end
  
  # return @guesses as a string
  def guesses
  	@guesses
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    # raise an execption
    # raise will 'break' the method if valid_guess? == false
    raise InvalidGuessException.new("Invalid guess!") unless valid_guess?(letter)
    if word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    !@board.include? '_'
  end

  # return true if @chances is 0, otherwise return false
  def lost?
    @chances == 0
  end

  private

  def valid_guess?(letter)
    letter.length==1
  end

  # return a string of underscores equal to length of the given word
  def draw_board(word)
    "_" * @word.length
  end
  
  # return true if word has letter
  def word_has?(letter)
    @word.include?(letter)
  end
  
  # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  def put_letter_on_board(letter)
    for i in (0..@word.length)
      if @word[i] == letter
        @board[i] = letter
      end
    end
  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
    @guesses<<letter
    @chances -= 1
  end

end




