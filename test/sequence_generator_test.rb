gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_it_exists
    assert SequenceGenerator.new(4, %w(r g b y))
  end

  def test_it_generates_a_new_sequence
    sequence = SequenceGenerator.new(4, %w(r g b y))
    sequence.generate

    assert sequence.generate
  end

  def test_it_makes_random_sequences
    s1 = SequenceGenerator.new(4, %w(r g b y))
    s2 = SequenceGenerator.new(4, %w(r g b y))
    s1_ary = []
    s2_ary = []
    s1_ary = s1.generate
    s2_ary = s2.generate
    refute s1_ary.sequence == s2_ary.sequence
  end
  
  def test_it_can_make_a_medium_difficulty_sequence
    sequence = SequenceGenerator.new(6, %w(r g b y c m))
    sequence.generate

    assert sequence.generate
  end
  
  def test_it_makes_random_medium_difficulty_sequences
    s1 = SequenceGenerator.new(6, %w(r g b y c m))
    s2 = SequenceGenerator.new(6, %w(r g b y c m))
    s1_ary = []
    s2_ary = []
    s1_ary = s1.generate
    s2_ary = s2.generate
    refute s1_ary.sequence == s2_ary.sequence
  end
  
  def test_it_can_make_a_hard_difficulty_sequence
    sequence = SequenceGenerator.new(8, %w(r g b y c m w k))
    sequence.generate

    assert sequence.generate
  end
  
  def test_it_makes_random_hard_difficulty_sequences
    s1 = SequenceGenerator.new(8, %w(r g b y c m w k))
    s2 = SequenceGenerator.new(8, %w(r g b y c m w k))
    s1_ary = []
    s2_ary = []
    s1_ary = s1.generate
    s2_ary = s2.generate
    refute s1_ary.sequence == s2_ary.sequence
  end
end
