class Board
  attr_accessor :board, :size

  def initialize
    @size = size_board.to_i
    @board = Array.new(@size**2);
  end

  # ask user to choose the size of the board
  def size_board
    puts "Choose the size A of your board : "
    print "Size A : "
    gets.chomp
  end

  # display the board
  def display_board
    puts "BOARD :\n"
    puts "----" * @size
    @board.each_slice(@size) do |sub_array|
      sub_array.each do |element|
        print element.nil? ? "| - " : "| #{element} "
      end
      puts "|"
      puts "----" * @size
    end
    puts "\n"
  end

  # add marker to the cell depending of the validity of the chosen position
  def add_piece(coord, marker)
    if position_valid?(coord)
      @board[coord - 1] = marker
    else
      false
    end
  end

  # check if the coordinate chosen is within the area of the board
  # if yes => check if the coordinate chosen is free of use
  def position_valid?(coord)
    array_index = coord - 1
    if array_index.between?(0, @size**2 - 1)
      position_free?(array_index)
    else
      puts "Position chosen is not valid !"
    end
  end

  # check if a cell is free (=nil) or already taken
  def position_free?(coord)
    if @board[coord].nil?
      true
    else
      puts "there's already a piece here ! "
    end
  end

  # check if there's any winning
  def winning_combo?(marker)
    horirontal_winning?(marker) || vertical_winning?(marker) || diagonal_winning?(marker)
  end

  # method to split the 1D array into a multidimensional array with the size of @size
  def split_array
    @board.each_slice(@size).to_a
  end

  # check if there's a horizontal win
  def horirontal_winning?(marker)
    split_array.any? do |sub_array|
      sub_array.all? { |element| element == marker }
    end
  end

  # check if there's a vertical win
  def vertical_winning?(marker)
    split_array.transpose.any? do |sub_array|
      sub_array.all? { |element| element == marker }
    end
  end

  # creation array taking the two diagonal lines
  def diagonal_lines
    diag = []
    @size.times do |i|
      diag.push(split_array[i][@size - 1 - i]).unshift(split_array[@size - 1 - i][@size - 1 - i])
    end
    diag.each_slice(@size).to_a
  end

  # check if there's a diagonal win
  def diagonal_winning?(marker)
    diagonal_lines.any? do |sub_array|
      sub_array.all? { |element| element == marker }
    end
  end

  # is the board full ?
  def is_full?
    split_array.all? do |sub_array|
      sub_array.none? { |element| element.nil? }
    end
  end
end
