gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_builder'

class GuessBuilderTest < Minitest::Test

  def test_it_validates_guess_length_four
    guess = GuessBuilder.new("rrrr")
    assert_equal guess.validate_length?, true

    guess = GuessBuilder.new("rrr")
    refute_equal guess.validate_length?, true

    guess = GuessBuilder.new("rrrrr")
    refute_equal guess.validate_length?, true
  end

  def test_it_validates_guess_chars

    guess = GuessBuilder.new("rgby")
    assert guess.validate_chars?

    guess = GuessBuilder.new("rgbz")
    refute guess.validate_chars?
  end

end
