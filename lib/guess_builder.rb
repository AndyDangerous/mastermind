require_relative 'guess'

class GuessBuilder
  attr_reader :new_guess
  
  def initialize(input)
    @input = input.downcase.split(//)
    @valid_chars = ['r','g','b','y']
    @valid_length = 4
  end

  def validate_length?
    if @input.length > @valid_length
      false
      puts "that shit is too long. try again"
    elsif
      @input.length < @valid_length
      false
      puts "that shit is too short. read the directions and try again"
    else
      true
    end
  end

  def validate_chars?
    input_array = @input
    invalid_inputs = input_array - (input_array & @valid_chars)
    invalid_inputs.empty?
  end

  def new_guess
    unless (validate_length? && validate_chars?)
      @input = gets.chomp
    else
      @new_guess = Guess.new(@input)
    end
  end
end

if __FILE__ == $0
  guess = GuessBuilder.new("rgby")
  guess.new_guess
end
