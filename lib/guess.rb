class Guess
  attr_reader   :code, :time
  attr_accessor :results

  def initialize(input)
    @code = input
    @time = Time.new
    @results = {}
  end
  
  def expected_length
    4
  end
  
  def expected_characters
    %w(r g b y)
  end

  def valid?
    valid_length? && valid_characters?
  end

  def valid_length?
    code.length == expected_length
  end

  def valid_characters?
    code.all?{|letter| expected_characters.include?(letter) }
  end
end


if __FILE__ == $0
guess = Guess.new(%w(r g b y))
end
