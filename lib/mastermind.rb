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
      when 'p' then choose_level
      when 'i' then instructions
      end
    end
    puts "cya, jerks"
  end

  def instructions
    puts "Mastermind is a game of wits. You must successfully guess the code the secret code. On each guess, you will learn the number of correct colors guessed as well as the number placed in the correct slots."
  end
  
  def choose_level
    system('clear')
    puts "What kind of game would you like?"
    puts "Choose e for easy, m for medium, and h hard."
    input = gets.strip
    case input
    when 'e' then @game = Game.new(4, %w(r g b y))
    when 'm' then @game = Game.new(6, %w(r g b y c m))
    when 'h' then @game = Game.new(4, %w(r g b y c m k w))
    else puts "choose e, m, or h"
    end
    puts "Alriiiiight, time for a new game. How smart do you think you are?"
    play
  end
  
  # def start_new_game
  #   puts "Alriiight, time for a new game. How smart do you think you are?"
  #   @game = Game.new
  #   play
  # end
  
  def play
    input = ''
    
    while !wants_to_quit?(input) && !@game.game_over?
      puts "This sequence consists  of: (r)ed, (g)reen, (b)lue, and (y)ellow."
      puts "Use q to quit at any time to end the game. Guess a sequence of four colors."
      puts "Guess number #{@game.turns + 1}:"
      input = gets.strip
      unless wants_to_quit?(input)
        if @game.new_guess(input)
          @game.guess_printer
        else
          puts "Sorry, #{input} is not a valid guess."
        end
      end
    end
    #new game choice (y/n)
    input = ''
    until (input == 'y') || (input == 'n')
      input = gets.strip
      if input == 'y'
        start_new_game
      elsif input == 'n'
      else
        puts "Invalid entry, bro. Press either the y or n key"
      end
    end
  end
  
end

test = Repl.new.start
