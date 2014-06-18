require_relative 'guess'  # => true

class GuessBuilder
  def build(input)
    code = input.downcase.chars  # => ["r", "r", "r", "r"]
    guess = Guess.new(code)      # => #<Guess:0x0000010188eff8 @code=["r", "r", "r", "r"], @time=2014-06-18 16:18:17 -0600, @results={}>
    
    if guess.valid?              # => true
      guess                      # => #<Guess:0x0000010188eff8 @code=["r", "r", "r", "r"], @time=2014-06-18 16:18:17 -0600, @results={}>
    else
      false
    end                          # => #<Guess:0x0000010188eff8 @code=["r", "r", "r", "r"], @time=2014-06-18 16:18:17 -0600, @results={}>
  end
end


if __FILE__ == $0                    # => true
gb = GuessBuilder.new.build("rrrr")  # => #<Guess:0x0000010188eff8 @code=["r", "r", "r", "r"], @time=2014-06-18 16:18:17 -0600, @results={}>
end                                  # => #<Guess:0x0000010188eff8 @code=["r", "r", "r", "r"], @time=2014-06-18 16:18:17 -0600, @results={}>
