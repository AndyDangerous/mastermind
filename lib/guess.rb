class Guess
  attr_reader   :guess, :time
  attr_accessor :results

  def initialize(guess)
    @guess = guess
    @time = Time.new
    @results = {}
  end

end


if __FILE__ == $0
guess = Guess.new(%w(r g b y))
end
