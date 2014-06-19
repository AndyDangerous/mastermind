begin; $SiB.number_of_captures = Float::INFINITY; $SiB.record_result(1, (require_relative 'game'))
$SiB.record_result(2, (require_relative 'guess'))

class GuessPrinter
  def initialize(guess_history)
    $SiB.record_result(6, (@guess_history = guess_history))
    $SiB.record_result(7, (@last_guess = guess_history.last))

    $SiB.record_result(17, (if $SiB.record_result(9, (@last_guess.results[:full_match]))
      $SiB.record_result(10, (print_guess_history))
    else
      $SiB.record_result(12, (system('clear')))
      $SiB.record_result(13, (print_guess_history))
      # puts "Last guess: #{@last_guess.code} "
      $SiB.record_result(15, (puts "You have #{@last_guess.results.fetch :correct_color} correct colors."))
      $SiB.record_result(16, (puts "You have #{@last_guess.results[:correct_position]} correct positions."))
    end))
  end

  def print_guess_history
    $SiB.record_result(23, ($SiB.record_result(21, (@guess_history)).each do |guess|
      $SiB.record_result(22, (puts "Guess #{guess}:" + guess.code.to_s))
    end));rescue Exception;line_number = $!.backtrace.grep(/#{__FILE__}/).first[/:\d+/][1..-1].to_i;$SiB.record_exception line_number, $!;$SiB.exitstatus = 1;$SiB.exitstatus = $!.status if $!.kind_of? SystemExit;end
  end
end
require_relative 'game'   # => false, true
require_relative 'guess'  # => false, false

class GuessPrinter
  def initialize(guess_history)
    @guess_history = guess_history
    @last_guess = guess_history.last

    if @last_guess.results[:full_match]
      print_guess_history
    else
      system('clear')
      print_guess_history
      # puts "Last guess: #{@last_guess.code} "
      puts "You have #{@last_guess.results.fetch :correct_color} correct colors."
      puts "You have #{@last_guess.results[:correct_position]} correct positions."
    end
  end

  def print_guess_history
    @guess_history.each do |guess|
      puts "Guess #{guess}:" + guess.code.to_s
    end
  end
end
