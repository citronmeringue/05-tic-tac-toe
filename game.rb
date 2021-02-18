require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize
    @board = Board.new()
    @player_X = Player.new("PlayerX", "X", @board)
    @player_O = Player.new("PlayerO", "O", @board)
    # choose randomly the first player
    @current_player = [@player_X, @player_O].sample
  end

  def play
    loop do
      @board.display_board
      @current_player.get_coordinates
      break if check_game

      switch_player
    end
  end

  def check_game
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
