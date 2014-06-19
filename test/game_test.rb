gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_begins_with_blank_guesses_array
    game = Game.new(4, %w(r g b y))
    assert_equal [], game.guess_history
  end

  def test_it_can_remember_guesses
  end

  def test_it_gets_a_sequence_array
    game = Game.new(4, %w(r g b y))
    assert game.sequence.class == Array
  end

  def test_it_gets_a_new_guess_with_validation
    game = Game.new(4, %w(r g b y))
    game.new_guess("rgby")
    assert_equal 1, game.guess_history.length
  end

  def test_it_collects_guesses
    game = Game.new(4, %w(r g b y))
    game.new_guess("rgby")
    game.new_guess("rrrr")
    game.new_guess("rrrb")

    assert_equal 3, game.guess_history.length
  end

  # def test_it_knows_game_length
  #   skip
  #   game = Game.new
  #   guess = Guess.new(%w(g r y b))
  #   guess.time = (2014-06-18 13:04:55 -0600)
  #   guess_history << guess
  #   guess2 = Guess.new(%w(g r y b))
  #   guess.time = 2014-06-18 13:09:15 -0600
  #   guess_history << guess
  #
  #   assert_equal game.time, 259.903358
  # end
  
  def test_it_knows_when_game_over
    game = Game.new(4, %w(r g b y))
    guess = Guess.new(%w(g r y b), 4)
    guess.results[:full_match] = true
    game.add_guess(guess)
    
    assert game.game_over?
  end
end
