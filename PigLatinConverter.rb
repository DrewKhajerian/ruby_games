## Pseudo code ##
#receive string from user input.
#check if string starts with a vowel, if so add "ay" to the end of string.
#if string starts with consonant, move first letter to the end of the string 
#and then add "ay".
#return new pig latin string


class PigLatinConverter

  def self.convert(word)
  	array = word.split("")
    if array[0]== "o"||array[0]=="a"||array[0]=="e"||
      array[0]=="u"||array[0]=="i"
    	 puts word + "ay"
       return word + "ay" # for test
    else
    	array<<array[0].downcase
    	array.shift
    	array.each {|x| print "#{x}"}
    	print "ay\n"
      return array.join("") + "ay" # for test
    end
  end
end

puts "Want learn pig latin? Enter a word: "
input = gets.chomp
PigLatinConverter.convert("orange")