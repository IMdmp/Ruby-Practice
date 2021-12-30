#word 
#display word



class Hangman
@selected_word
@guessed_characters

  def initialize
    @selected_word = "test"
    @guessed_characters = []
  end

  def display_word
    @selected_word.to_s.each_char do |character|
      if @guessed_characters.include?(character)
        print " #{character} " 
      else
      print " _ "
      end
    end
  end

  def character_guess_is_in_word(character)
    if @selected_word.include?(character.to_s)
      @guessed_characters.push(character)
    end
  end 


end

hangman = Hangman.new

hangman.character_guess_is_in_word('t')
hangman.display_word
