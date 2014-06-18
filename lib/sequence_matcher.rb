require_relative 'sequence'
require_relative 'guess'

class SequenceMatcher
  attr_accessor :guess
  def initialize(guess, sequence)
    @guess = guess
    
    @guess_array = guess.code
    @sequence = sequence
    @color_counter
    @guess_result
    @position_counter
  end

  def full_match?
    @guess_array == @sequence
  end

  def correct_color
    @color_counter = 0
    user_guess = @guess_array.dup
    @sequence.each do |char|
      if user_guess.include?(char)
        @color_counter += 1
        index = user_guess.find_index(char)
        user_guess.delete_at(index)
      end
    end
    @color_counter
  end

  def correct_position
    @position_counter = 0
    @guess_array.length.times do |count|
      @position_counter += 1 if @guess_array[count] == @sequence[count]
    end
    @position_counter
  end

  def get_result
    correct_color
    correct_position
    @guess.results = {
      full_match: full_match?,
      correct_color: @color_counter,
      correct_position: @position_counter
    }
  end
end


if __FILE__ == $0
  guess = Guess.new(%w(r g y b))
  sequence = %w(g g g y)
  new_match = SequenceMatcher.new(guess, sequence).get_result
  guess
end
