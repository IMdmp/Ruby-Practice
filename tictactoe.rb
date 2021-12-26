class TicTacToe
  @board
  @curPlayer
  def initialize
    @player1 = Player.new('', '')
    @player2 = Player.new('', '')
    players = [@player1, @player2]
    @curPlayer = @player1
  end

  def cyclePlayer
    @curPlayer = if @curPlayer == @player1
                   @player2
                 else
      @player1
                 end
  end

  def self.PlayGame
    puts 'Welcome to TicTacToe.'
    if @curPlayer.name == ''
      puts 'Enter name for :'
      name = gets.chomp
      @curPlayer = Player.new(TicTacToe.GetCharInput, name)
    end

    puts "#{@curPlayer.name} You are #{@curPlayer.char}."
    cyclePlayer
    puts 'Enter name for Player2:'
    name = gets.chomp

    @curPlayer = Player.new(TicTacToe.GetCharInput, name)
    puts "#{@curPlayer.name} You are #{@curPlayer.char}."

    puts 'Player1: Here is the grid:'
    TicTacToe.DisplayBoard
    puts 'Select Grid to enter X. [1-9]'
    gets.chomp
  end

  def self.DisplayBoard
    board.PrintBoard
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
  @@matrix = Array.new(9)
  def self.PrintBoardSample
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
    puts '| | | |'
    puts '- - - -'
  end

  def self.PrintBoard
    @@matrix.each_with_index do |item, index|
      print "\n" if [3, 6].include?(index)
      puts '-   -   -   -' if index % 3 == 0
      print '| '
      item != nil ? print "#{item} " : print '  '
      print '|' if [2, 5, 8].include?(index)
    end

    puts "\n-   -   -   -"
  end

  def self.InsertItem(item, index)
    @@matrix[index - 1] = item
  end
end

class Player
  attr_accessor :char, :name

  def initialize(char, name)
    @char = char
    @name = name
  end
end

TicTacToe.PlayGame

# Board.InsertItem('X',1)
# Board.InsertItem('0',2)
# Board.InsertItem('0',8)
# Board.InsertItem('X',5)
# Board.InsertItem('X',9)

# Board.PrintBoard
