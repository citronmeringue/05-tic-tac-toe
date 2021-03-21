require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize
    @board = Board.new()
    @player_X = Player.new(@name, "X", @board)
    @player_O = Player.new(@name, "O", @board)
    # choose randomly the first player
    @current_player = [@player_X, @player_O].sample
  end

  def play
    puts "The first player is randomly chosen ! "

    puts "What is the name of the first player ? (Will play with marker X)"
    @player_X.name = gets.chomp
    puts "What is the name of the second player ? (Will play with marker O)"
    @player_O.name = gets.chomp

    loop do
      @board.display_board
      puts "Player : #{@current_player.name}"
      @current_player.get_coordinates
      break if check_game

      switch_player
    end
  end

  def check_game
    @board.display_board
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combo?(@current_player.marker)
      puts "#{@current_player.name} Win ! "
      true
    else
      false
    end
  end

  def check_draw
    if @board.is_full?
      puts "Draw ! "
      true
    end
  end

  def switch_player
    @current_player = (@current_player == @player_X) ? @player_O : @player_X
  end
end
