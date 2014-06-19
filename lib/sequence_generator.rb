require_relative 'sequence_matcher'

class SequenceGenerator
  
  def initialize(sequence_length, sequence_chars)
    @sequence_length = sequence_length
    @sequence_chars = sequence_chars
    
  end
  
  def generate
    sequence = (0...@sequence_length).collect { @sequence_chars.sample}
    Sequence.new(sequence)
  end
end

if __FILE__ == $0
blah = SequenceGenerator.new(4, %w(r g b y))
blah.generate
end
