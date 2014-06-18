require_relative 'game'
require_relative 'guess'

class GuessPrinter
  attr_reader :guess_result
  
  def initialize(guess)
    @guess = guess

    if @guess.results[:full_match]
      puts "You have a full match! Game over."
    else
      puts "You don't yet have a full match."
    end
    puts "You have #{@guess.results.fetch :correct_color} correct colors."
    puts "You have #{@guess.results[:correct_position]} correct positions."
  end
end
