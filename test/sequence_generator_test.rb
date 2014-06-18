gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_it_exists
    assert SequenceGenerator.new(4, %w(r g b y))
  end

  def test_it_generates_a_new_sequence
    sequence = SequenceGenerator.new
    sequence.generate

    assert sequence.generate
  end

  def test_it_makes_random_sequences
    s1 = SequenceGenerator.new
    s2 = SequenceGenerator.new
    s1_ary = []
    s2_ary = []
    s1_ary = s1.generate
    s2_ary = s2.generate
    refute s1_ary.sequence == s2_ary.sequence
  end
end
