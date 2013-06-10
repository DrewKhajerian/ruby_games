require "test/unit"
require_relative "hangman"

class TestContact < Test::Unit::TestCase

	@@hangman = Hangman.new

	def test_initialize_variables
		# hangman = Hangman.new()
		assert_equal 8, @@hangman.chances
		assert_equal [], @@hangman.guesses
		#can't test @word since it selects random word from array
		# assert_equal "_____", @@hangman.draw_board("japan") -> private method
	end

	def test_if_win_methdod_is_false
		assert_equal false, @@hangman.win?
	end

	def test_if_lose_method_starts_false
		assert_equal false, @@hangman.lost?
	end

	def test_lost_method_is_true_when_chances_0
		@@hangman.chances = 0
		assert_equal true, @@hangman.lost?
	end

end