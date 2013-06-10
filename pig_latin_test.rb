require "test/unit"
require_relative "PigLatinConverter"

class TestContact < Test::Unit::TestCase

	def test_convert_method_for_word_starts_with_vowel
		assert_equal "orangeay", 	PigLatinConverter.convert("orange")
	end

	def test_convert_method_for_word_starts_with_consonent
		assert_equal "rucktay", 	PigLatinConverter.convert("truck")
	end

end