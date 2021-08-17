class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index {|secret_char, idx| matching_indices << idx if secret_char == char }
    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |idx| @guess_word[idx] = char }
  end
 
  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -= 1
      else
        indices = get_matching_indices(char.downcase)
        fill_indices(char.downcase, indices)
      end
      return true
    end

  end

  def ask_user_for_guess
    puts "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      false
    end
  end
end
