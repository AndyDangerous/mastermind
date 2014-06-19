gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  
  def setup
    game = Game.new(4, %w(r g b y))
  end
  
  def test_it_holds_a_guess
    guess = Guess.new(%w(r g b y), 4)

    assert_equal guess.code, ["r","g","b","y"]
  end
  
  def test_a_too_long_code_is_invalid
    guess = Guess.new(%w(r r r r r), 4)
    refute guess.valid?
  end
  
  def test_a_too_short_code_is_invalid
    guess = Guess.new(%w(b b b), 4)
    refute guess.valid?
  end
  
  def test_a_correct_length_and_correct_letters_code_is_valid
    guess = Guess.new(%w(r g b y), 4)
    assert guess.valid?
  end
  
  def test_a_code_with_wrong_letters_is_invalid
    guess = Guess.new(%w(r g b X), 4)
    refute guess.valid?
  end
  
  def test_it_works_with_a_medium_length_guess_with_correct_letters
    guess = Guess.new(%w(r g b y c m), 6)
    assert guess.valid?
  end
  
  def test_it_works_with_a_hard_length_guess_with_correct_letters
    guess = Guess.new(%w(r g b y c m w k), 8)
    assert guess.valid?
  end
  
  def test_a_too_long_medium_length_code_is_invalid
    guess = Guess.new(%w(r r r r r c m), 6)
    refute guess.valid?
  end
  
  def test_a_too_short_medium_length_code_is_invalid
    guess = Guess.new(%w(b b b c m), 6)
    refute guess.valid?
  end
  
  def test_a_too_long_hard_length_code_is_invalid
    guess = Guess.new(%w(r r r r r c m w k), 8)
    refute guess.valid?
  end
  
  def test_a_too_short_hard_length_code_is_invalid
    guess = Guess.new(%w(b b b c m w k), 8)
    refute guess.valid?
  end
end
