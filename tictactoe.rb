# frozen_string_literal: true

class Player
  attr_accessor :char, :name
  attr_reader :def_name

  def initialize(char, name, def_name)
    @def_name = def_name
    @char = char
    @name = name
  end
end

class TicTacToe
  @board
  @cur_player
  @game_not_finished
  def initialize
    @player1 = Player.new('', '', 'Player 1')
    @player2 = Player.new('', '', 'Player 2')
    @cur_player = @player1
    @board = Board.new
    @game_not_finished = true
  end

  def cycle_player
    @cur_player = if @cur_player == @player1
                    @player2
                  else
                    @player1
                  end
  end

  def display_board
    @board.print_board
  end

  def check_game_finished_tie
    !@board.game_finished_tie
  end

  def play_game
    puts 'Welcome to TicTacToe.'
    @cur_player = check_player_data(@cur_player)
    cycle_player
    @cur_player = check_player_data(@cur_player)

    puts 'Done.'
    cycle_player

    while true
      puts "#{@cur_player.name}: Here is the grid:"
      display_board
      puts "Select Grid to enter #{@cur_player.char} [1-9]"
      selected_input = gets.chomp
      @board.insert_item(@cur_player.char, selected_input.to_i)
      display_board
      if @board.has_winning_combination(@cur_player.char)
        puts "Game finished! #{@cur_player.name} Wins!"
        break
      end

      if !check_game_finished_tie
        puts 'Its a tie!'
        break
      end
      cycle_player
    end

    puts 'Game Finished. Board:'
    display_board
  end

  def check_player_data(player)
    if player.name == ''
      puts "Enter name for #{player.def_name}:"
      name = gets.chomp
      char_selected = TicTacToe.get_char_input
      player.name = name
      player.char = char_selected
    end
    player
  end

  def self.get_char_input
    captured_char = ''

    while captured_char != 'X' && captured_char != 'O'
      puts 'What will you be? Enter [X] or [O]'
      captured_char = gets.chomp
    end

    captured_char
  end
end

class Board
  @matrix
  @counter
  def initialize
    @matrix = Array.new(9)
    @counter = 0
  end

  def self.print_boardSample
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
  end

  def print_board
    @matrix.each_with_index do |item, index|
      print "\n" if [3, 6].include?(index)
      puts '-   -   -   -' if (index % 3).zero?
      print '| '
      if !item.nil?
        print "#{item} "
      else
        print '  '
      end
      print '|' if [2, 5, 8].include?(index)
    end

    puts "\n-   -   -   -"
  end

  def insert_item(item, index)
    @matrix[index - 1] = item
    @counter += 1
  end

  def has_winning_combination(char_to_compare)
    check_horizontal_patterns(char_to_compare) || check_vertical_patterns(char_to_compare) || check_diagonal_patterns(char_to_compare)
  end

  def check_horizontal_patterns(char_to_compare)
    @matrix[0] == char_to_compare && @matrix[1] == char_to_compare && @matrix[2] == char_to_compare ||
      @matrix[3] == char_to_compare && @matrix[4] == char_to_compare && @matrix[5] == char_to_compare ||
      @matrix[6] == char_to_compare && @matrix[7] == char_to_compare && @matrix[8] == char_to_compare
  end

  def check_vertical_patterns(char_to_compare)
    @matrix[0] == char_to_compare && @matrix[3] == char_to_compare && @matrix[6] == char_to_compare ||
      @matrix[1] == char_to_compare && @matrix[4] == char_to_compare && @matrix[7] == char_to_compare ||
      @matrix[2] == char_to_compare && @matrix[5] == char_to_compare && @matrix[8] == char_to_compare
  end

  def check_diagonal_patterns(char_to_compare)
    puts "Diagonal Check: #{char_to_compare}"
    p @matrix
    @matrix[0] == char_to_compare && @matrix[4] == char_to_compare && @matrix[8] == char_to_compare ||
      @matrix[6] == char_to_compare && @matrix[4] == char_to_compare && @matrix[2] == char_to_compare
  end

  def game_finished_tie
    @counter >= 9
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.play_game
