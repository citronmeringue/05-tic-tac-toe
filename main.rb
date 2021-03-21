require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'

puts "Welcome to the Tic Tac Toe Game ! "

puts "Rules : It's a win if one of the player places their mark in a diagonal, horizontal or vertical line !"
puts "The board is divided as such that the position of each cell is read from left to right, top to bottom"
puts "Let's begin !"
puts ""
Game.new.play
