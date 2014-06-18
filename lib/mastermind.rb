require_relative 'game'
require_relative 'guess'
require 'pry'

class Repl
  def self.run
    Repl.new.start
  end

  def initialize
    puts "Initializing"
  end

  def wants_to_quit?(input)
    input == 'q' || input == 'quit'
  end

  def start
    puts "Welcome to MASTERMIND \n Is your mind masterful?"
    input = ''
    unless wants_to_quit?(input)
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
  end
  
  def start_new_game
    puts "Alriiight, time for a new game. How smart do you think you are?"
    @game = Game.new
    play
  end
  
  def play
    input = ''
    
    while !wants_to_quit?(input) && !@game.game_over?
      puts "This sequence consists  of: (r)ed, (g)reen, (b)lue, and (y)ellow."
      puts "Use q to quit at any time to end the game. Guess a sequence of four colors."
      input = gets.strip
      
      unless wants_to_quit?(input)
        @game.new_guess(input)
        puts "Guess number #{@game.turns}"
        @game.guess_printer
      end
    end
    
    puts "The game is over."
  end
  
end

test = Repl.new.start
