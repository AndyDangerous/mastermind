gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_it_holds_a_guess
    guess = Guess.new(%w(r g b y))

    assert_equal guess.guess, ["r","g","b","y"]
  end
end
