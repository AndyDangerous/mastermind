require_relative 'game'
require_relative 'guess'

class GuessPrinter
  def initialize(guess)
    @guess = guess

    if @guess.results[:full_match]
      puts "game over"
    else
      system('clear')
      puts "Last guess: #{@guess.code} "
      puts "You have #{@guess.results.fetch :correct_color} correct colors."
      puts "You have #{@guess.results[:correct_position]} correct positions."
    end
    end
end
