require_relative 'sequence_generator'
require_relative 'sequence'
require_relative 'guess_builder'
require_relative 'sequence_matcher'
require_relative 'guess'
require_relative 'guess_printer'
require 'pry'

class Game
  attr_reader :guess_history, :sequence, :turns, :game_over, :guess_builder
  def initialize(code_length, colors)
    cl = code_length
    @colors = colors
    @guess_history = []
    @game_over = false
    @sequence ||= SequenceGenerator.new(cl, colors).generate.sequence
    @guess_builder = GuessBuilder.new
    # binding.pry
  end

  def turns
    @guess_history.length
  end

  def time
    time = -(@guess_history[0].time - @guess_history[-1].time)
  end
  
  def new_guess(input)
    sequence_length = @sequence.length
    guess = @guess_builder.build(input, sequence_length)
    if guess
      guess.results = SequenceMatcher.new(guess, @sequence).get_result
      add_guess(guess)
      guess
    else
      false
    end
  end

  def guess_printer
    GuessPrinter.new(@guess_history.last)
    # if !game_over?
      # GuessPrinter.new(@guess_history.last)
    # end
  end

  def add_guess(guess)
    @guess_history << guess
    if guess.results.fetch :full_match
      game_over
      @game_over = true
    end
  end

  def game_over
    system('clear')
    puts "Excellent work! You guessed my secret code in #{turns} turns."
    puts "That shit took you #{time/60} minutes and #{(time - (time/60)) % 60} seconds."
    @game_over = true
    puts "Play again? (y/n)"
  end
  
  def game_over?
    @game_over
  end

end

if __FILE__ == $0
blah = Game.new
blah.sequence
blah.new_guess("rgby")
# raise blah.guess_history.inspect  # ~> RuntimeError: [#<Guess:0x0000010114a800 @guess=["r", "g", "b", "y"], @time=2014-06-18 13:21:49 -0600, @results={:full_match=>false, :correct_color=>3, :correct_position=>1}>]
end
