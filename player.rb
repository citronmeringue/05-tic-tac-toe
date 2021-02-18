require_relative 'board.rb'

class Player
  attr_accessor :name, :marker

  def initialize(name, marker, board)
    @name = name
    @marker = marker
    @board = board
  end

  # ask user to chose coordinate to place on board
  def ask_coordinates
    puts "Choose your position between 1 & #{@board.size**2}"
    gets.chomp
  end

  # check if the user's coordinate are validate before being placed on board
  def get_coordinates
    player_coord = ask_coordinates
    if validate_coordinates(player_coord.to_i)
      @board.add_piece(player_coord.to_i, @marker)
    end
  end

  # check if position chosen is valid : within the surface of the board
  def validate_coordinates(coord)
    if coord > 0 && coord <= @board.size**2
      true
    else
      puts "Coordinates chosen not valid !"
    end
  end
end
