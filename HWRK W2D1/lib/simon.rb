class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    print "Get ready..."
    sleep(2)
    system("clear")
    take_turn until game_over == true
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message if game_over == false
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      print color
      sleep(0.75)
      system("clear")
      sleep(0.5)
    end
  end

  def require_sequence
    puts "Enter the first letter of each color on a separate line."
    @seq.each do |color|
      input = gets.chomp
      unless color[0] == input.downcase
        @game_over = true
        break
      end
    end
    sleep(0.5)
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    print "Nice job! Here is the next sequence: "
    sleep(2)
    system("clear")
  end

  def game_over_message
    puts "Game over! You made it #{@sequence_length - 1} rounds."
    puts "The sequence was #{@seq.join(", ")}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
