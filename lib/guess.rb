require_relative 'game'
require_relative 'sequence'
require 'pry'

class Guess
  attr_reader   :code, :time
  attr_accessor :results

  def initialize(input, sequence_length)
    @code = input
    @time = Time.new
    @results = {}
    @sequence_length = sequence_length
  end

  def expected_length
    @sequence_length
  end
  
  def expected_characters
    %w(r g b y c m k w).take(@sequence_length)
  end

  def valid?
    valid_length? && valid_characters?
  end

  def valid_length?
    code.length == @sequence_length
  end

  def valid_characters?
    code.all?{|letter| expected_characters.include?(letter) }
  end
end


if __FILE__ == $0
guess = Guess.new(%w(r g b y))
end
