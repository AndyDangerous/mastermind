gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_holds_a_guess
    guess = Guess.new(%w(r g b y))

    assert_equal guess.code, ["r","g","b","y"]
  end
  
  def test_a_too_long_code_is_invalid
    guess = Guess.new(%w(r r r r r))
    refute guess.valid?
  end
  
  def test_a_too_short_code_is_invalid
    guess = Guess.new(%w(b b b))
    refute guess.valid?
  end
  
  def test_a_correct_length_and_correct_letters_code_is_valid
    guess = Guess.new(%w(r g b y))
    assert guess.valid?
  end
  
  def test_a_code_with_wrong_letters_is_invalid
    guess = Guess.new(%w(r g b X))
    refute guess.valid?
  end
end
