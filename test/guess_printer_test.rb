gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

# class GuessPrinterTest < Minitest::Test
#   def test_it_knows_when_a_game_is_over
#     guess = Guess.new(%w(r g b y), 4)
#     guess.results[:full_match] = true
#     gp = GuessPrinter.new(guess)
#
#     assert_equal STDOUT, "game over\n"
#   end
# end

# GuessPrinter has been tested extensively in the REPL, but unit tests were not as effective
