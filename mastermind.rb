COLOR_SET = %w[Red Blue Yellow Green Orange Violet]
NUMBER_OF_TURNS = 10

class Mastermind
  @game_color_set
  @user_selected_set

  def initialize
    @game_color_set = []
    @user_selected_set = []
  end

  def start_game
    puts 'Welcome. '
    game_won = false

    populate_game_set

    p @game_color_set

    NUMBER_OF_TURNS.times do |turns|
      puts "Turns remaining: #{NUMBER_OF_TURNS - turns}"
      reset_user_set
      enter_combination
      next unless compare_user_and_game_set

      puts 'Game end. Win!'
      game_won = true
      break
    end
    puts 'End of game. You lose' unless game_won
  end

  def reset_user_set
    @user_selected_set = []
  end

  def compare_user_and_game_set
    peg_color_set = []
    num_correct = 0
    @user_selected_set.each_with_index do |color, index|
      peg_color = ' '
      peg_color = 'White' if @game_color_set.include?(color)
      if @game_color_set[index] == color
        peg_color = 'Black'
        num_correct += 1
      end
      peg_color_set.push(peg_color)
    end
    puts 'Result:'
    p peg_color_set

    num_correct == 4
  end

  def populate_game_set
    4.times do
      color = random_select_color
      @game_color_set.push(color)
    end
  end

  def random_select_color
    COLOR_SET[rand(6)]
  end

  def enter_combination
    puts 'select color'

    4.times do
      COLOR_SET.each_with_index do |color, index|
        puts "[#{index}] - #{color}"
      end

      selected_color_index = gets.chomp
      @user_selected_set.push(COLOR_SET[selected_color_index.to_i])

      puts 'Currently selected: '
      p @user_selected_set
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
