require_relative 'sequence'  # => true
require_relative 'guess'     # => true

class SequenceMatcher
  attr_accessor :guess             # => nil
  def initialize(guess, sequence)
    @guess = guess                 # => #<Guess:0x000001020866c0 @guess=["r", "g", "y", "b"], @time=2014-06-18 09:49:43 -0600, @results={}>
    
    @guess_array = guess.guess     # => ["r", "g", "y", "b"]
    @sequence = sequence           # => ["g", "g", "g", "y"]
    @color_counter                 # => nil
    @guess_result                  # => nil
    @position_counter              # => nil
  end

  def full_match?
    @guess_array == @sequence  # => false
  end

  def correct_color
    @color_counter = 0                       # => 0
    user_guess = @guess_array.dup            # => ["r", "g", "y", "b"]
    @sequence.each do |char|                 # => ["g", "g", "g", "y"]
      if user_guess.include?(char)           # => true, false, false, true
        @color_counter += 1                  # => 1, 2
        index = user_guess.find_index(char)  # => 1, 1
        user_guess.delete_at(index)          # => "g", "y"
      end                                    # => "g", nil, nil, "y"
    end                                      # => ["g", "g", "g", "y"]
    @color_counter                           # => 2
  end

  def correct_position
    @position_counter = 0                                                # => 0
    @guess_array.length.times do |count|                                 # => 4
      @position_counter += 1 if @guess_array[count] == @sequence[count]  # => nil, 1, nil, nil
    end                                                                  # => 4
    @position_counter                                                    # => 1
  end

  def get_result
    correct_color                          # => 2
    correct_position                       # => 1
    @guess.results = {                     # => #<Guess:0x000001020866c0 @guess=["r", "g", "y", "b"], @time=2014-06-18 09:49:43 -0600, @results={}>
      full_match: full_match?,             # => false
      correct_color: @color_counter,       # => 2
      correct_position: @position_counter  # => 1
    }                                      # => {:full_match=>false, :correct_color=>2, :correct_position=>1}
  end
end


if __FILE__ == $0                                              # => true
  guess = Guess.new(%w(r g y b))                               # => #<Guess:0x000001020866c0 @guess=["r", "g", "y", "b"], @time=2014-06-18 09:49:43 -0600, @results={}>
  sequence = %w(g g g y)                                       # => ["g", "g", "g", "y"]
  new_match = SequenceMatcher.new(guess, sequence).get_result  # => {:full_match=>false, :correct_color=>2, :correct_position=>1}
  guess                                                        # => #<Guess:0x000001020866c0 @guess=["r", "g", "y", "b"], @time=2014-06-18 09:49:43 -0600, @results={:full_match=>false, :correct_color=>2, :correct_position=>1}>
end                                                            # => #<Guess:0x000001020866c0 @guess=["r", "g", "y", "b"], @time=2014-06-18 09:49:43 -0600, @results={:full_match=>false, :correct_color=>2, :correct_position=>1}>
