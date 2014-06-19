gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_builder'

class GuessBuilderTest < Minitest::Test
  attr_reader :gb
  
  def setup
    @gb = GuessBuilder.new
    Game.new(4, %w(r g b y))
  end

  def test_it_builds_a_valid_guess
    assert gb.build('rrrr', 4)
  end
  
  def test_it_downcases_an_uppercase_input
    expected = %w(r r r r)
    assert_equal expected, gb.build('RRRR', 4).code
  end
  
  def test_it_does_not_build_an_invalid_input
    refute gb.build('XXXXX', 4)
  end
  
  def test_it_builds_with_an_input_with_medium_difficulty
    assert gb.build('rgbycm', 6)
  end
  
  def test_it_builds_with_an_input_with_hard_difficulty
    assert gb.build('rgbycmwk', 8)
  end
  
  def test_it_does_not_build_an_easy_guess_with_letters_from_hard
    refute gb.build('cmwk', 4)
  end
end
