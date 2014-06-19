require_relative 'guess'

class GuessBuilder
  def build(input, sequence_length)
    code = input.downcase.chars
    guess = Guess.new(code, sequence_length)
    
    if guess.valid?
      guess
    else
      false
    end
  end
end


if __FILE__ == $0
gb = GuessBuilder.new.build("rrrr")
end
