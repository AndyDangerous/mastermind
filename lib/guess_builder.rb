require_relative 'guess'

class GuessBuilder
  def build(input)
    code = input.downcase.chars
    guess = Guess.new(code)
    
    if guess.valid?
      guess
    else
      false
    end
  end
end
