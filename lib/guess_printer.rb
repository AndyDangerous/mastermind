require_relative 'game'
require_relative 'guess'

class GuessPrinter
  def initialize(guess_history)
    @guess_history = guess_history
    @last_guess = guess_history.last

    if @last_guess.results[:full_match]
      print_guess_history
    else
      system('clear')
      print_guess_history
      # puts "Last guess: #{@last_guess.code} "
      puts "You have #{@last_guess.results.fetch :correct_color} correct colors."
      puts "You have #{@last_guess.results[:correct_position]} correct positions."
    end
  end

    def color(letter)
    case letter
    when "r" then ("r ").red
    when 'g' then ("g ").green
    when 'b' then ("b ").blue
    when 'y' then ("y ").yellow
    when 'c' then ("c ").cyan
    when 'm' then ("m ").magenta
    when 'k' then ("k ").black
    when 'w' then ("w ").white
    end
  end

    def print_guess_history
    @guess_history.each do |guess|
      puts "Guess:" + color(guess.code[0]) +" "+ color(guess.code[1]) +" "+ color(guess.code[2]) +" "+ color(guess.code[3]) +"    "+ "(#{guess.results.fetch :correct_color} correct colors, and #{guess.results[:correct_position]} correct positions.)"
    end
  end
end
