require_relative 'sequence'

class SequenceGenerator
  
  def initialize(sequence_length=4, pool=%w(r g b y))
    @sequence_length = sequence_length
    @sequence_chars = pool
  end
  
  def generate
    sequence = (0...@sequence_length).collect { @sequence_chars.sample}
    Sequence.new(sequence)
  end
end

if __FILE__ == $0
blah = SequenceGenerator.new
blah.generate
end


if __FILE__ == $0       # => true
blah = SequenceMatcher.new         # => #<Game:0x000001020772d8 @guesses=[], @sequence=["b", "g", "r", "b"]>
          # => ["b", "g", "r", "b"]
blah.new_guess("rgby")
guess_history
end
