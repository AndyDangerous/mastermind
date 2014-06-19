gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_matcher'
require './lib/guess'

class SequenceMatcherTest < Minitest::Test


  def test_it_knows_a_full_match
    guess = Guess.new(%w(r g b y), 4)
    match = SequenceMatcher.new(guess, ['r','g','b','y'])

    assert match.full_match?

    match = SequenceMatcher.new(guess, ['r','g','g','y'])
    refute match.full_match?
  end

  def test_it_knows_correct_color
    guess = Guess.new(%w(g r y b), 4)
    match = SequenceMatcher.new(guess, ['r','g','b','y'])
    assert_equal match.correct_color, 4
  end
  
  def test_it_knows_correct_color2
    guess = Guess.new(%w(y y y y), 4)
    match = SequenceMatcher.new(guess, ['r','g','b','y'])
    assert_equal match.correct_color, 1
  end
  def test_it_knows_correct_color3
    guess = Guess.new(%w(r g r g), 4)
    match = SequenceMatcher.new(guess, ['r','g','b','y'])
    assert_equal match.correct_color, 2
  end
  def test_it_knows_correct_color4
    guess = Guess.new(%w(r g b y), 4)
    match = SequenceMatcher.new(guess, ['g','g','b','b'])
    assert_equal match.correct_color, 2
  end
  def test_it_knows_correct_color5
    guess = Guess.new(%w(r g b g), 4)
    match = SequenceMatcher.new(guess, ['g','g','g','g'])
    assert_equal match.correct_color, 2
  end
  def test_it_knows_correct_color6
    guess = Guess.new(%w(r r r r), 4)
    match = SequenceMatcher.new(guess, ['r','g','b','y'])
    assert_equal match.correct_color, 1
  end

  def test_it_knows_correct_position_with_medium_difficulty
    guess = Guess.new(%w(r g y b c m), 6)
  
    match = SequenceMatcher.new(guess, ['r','g','b','y','r','y'])

    assert_equal match.correct_position, 2
  end
  
  def test_it_knows_a_full_match_with_medium_difficulty
    guess = Guess.new(%w(r g b y c m), 6)
    match = SequenceMatcher.new(guess, ['r','g','b','y','c','m'])

    assert match.full_match?

    match = SequenceMatcher.new(guess, ['r','g','g','y','c','m'])
    refute match.full_match?
  end

  def test_it_knows_correct_color_with_medium_difficulty
    guess = Guess.new(%w(g r y b c m), 6)
    match = SequenceMatcher.new(guess, ['r','g','b','y','m','c'])
    assert_equal match.correct_color, 6
  end
  
  def test_it_knows_correct_position_with_hard_difficulty
    guess = Guess.new(%w(r g y b c m k w), 8)
  
    match = SequenceMatcher.new(guess, ['r','g','b','y','r','y','k','w'])

    assert_equal match.correct_position, 4
  end
  
  def test_it_knows_a_full_match_with_hard_difficulty
    guess = Guess.new(%w(r g b y c m k w), 8)
    match = SequenceMatcher.new(guess, ['r','g','b','y','c','m','k','w'])

    assert match.full_match?

    match = SequenceMatcher.new(guess, ['r','g','g','y','c','m','k','w'])
    refute match.full_match?
  end

  def test_it_knows_correct_color_with_hard_difficulty
    guess = Guess.new(%w(g r y b c m k w), 8)
    match = SequenceMatcher.new(guess, ['r','g','b','y','m','c','g','g'])
    assert_equal match.correct_color, 6
  end
end
