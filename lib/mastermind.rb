require_relative 'game'
require_relative 'guess'
require 'pry'

class Repl
  def self.run
    Repl.new.start
  end

  def initialize
    puts "Initializing"
    @input = ''
  end

  def start
    puts "Welcome to MASTERMIND \n Is your mind masterful?"
    unless @input == ('q' || 'quit')
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      input = gets.strip
      case input
      when 'p' then start_new_game
      when 'i' then instructions
      end
    end
    puts "cya, jerks"
  end

  def instructions
    puts "Mastermind is a game of wits. You must successfully guess the code the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots."
    return
  end
  
  def start_new_game
    puts "Alriiight, time for a new game. How smart do you think you are?"
    @game = Game.new
    play
  end
  
  def play
    while @input != 'q'
      system('clear')
      puts "This sequence consists  of: (r)ed, (g)reen, (b)lue, and (y)ellow. \n Use q to quit at any time to end the game. Guess a sequence of four colors."
      @input = gets.strip
      @game.new_guess(@input)
      puts "Guess number #{@game.turns}"
      @game.guess_printer
      # if @game.game_over?
      #   game_over
      # end
    end
  end
  
end

test = Repl.new.start
