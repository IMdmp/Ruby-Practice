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
  @curPlayer
  @game_not_finished
  def initialize
    @player1 = Player.new('', '', 'Player 1')
    @player2 = Player.new('', '', 'Player 2')
    players = [@player1, @player2]
    @curPlayer = @player1
    @board = Board.new
    @game_not_finished = true
  end

  def cyclePlayer
    @curPlayer = if @curPlayer == @player1
                   @player2
                 else
                   @player1
                 end
  end

  def display_board
    @board.PrintBoard
  end

  def PlayGame
    puts 'Welcome to TicTacToe.'

    @curPlayer = check_player_data(@curPlayer)
    cyclePlayer
    @curPlayer = check_player_data(@curPlayer)

    puts "Done."
    cyclePlayer

    while @game_not_finished
    puts "#{@curPlayer.name}: Here is the grid:"
    display_board
    puts "Select Grid to enter #{@curPlayer.char} [1-9]"
    selected_input = gets.chomp
    @board.insert_item(@curPlayer.char, selected_input.to_i)
    display_board
    cyclePlayer
    end
  end

  def check_player_data(player)
    if player.name == ''
      puts "Enter name for #{player.def_name}:"
      name = gets.chomp
      char_selected = TicTacToe.GetCharInput
      player.name = name
      player.char = char_selected
    end
    player
  end

  def self.GetCharInput
    capturedChar = ''

    while capturedChar != 'X' && capturedChar != 'O'
      puts 'What will you be? Enter [X] or [O]'
      capturedChar = gets.chomp
    end

    capturedChar
  end
end

class Board
  @matrix 

  def initialize
    @matrix = Array.new(9)
  end

  def self.PrintBoardSample
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
  end

  def PrintBoard
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
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.PlayGame

# Board.insert_it('X', 1)
# Board.insert_it('0', 2)
# Board.insert_it('0', 8)
# Board.insert_it('X', 5)
# Board.insert_it('X', 9)

# Board.PrintBoard
