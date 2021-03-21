BASIC RUBY PROJECT

PROJECT 5 : Tic Tac Toe

Assignment

Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

    Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
    Build your game, taking care to not share information between classes any more than you have to.
    Post your solution below, then check out the example solution provided.

--- 
Remarks : I had a really hard time to begin with. So the organisation of the code is heavily inspired by the pseudo code I looked upon on the Viking Code website.

How is it organised ?
There are 4 ruby files :
main.rb ==> the main file where the code is executed by the usual command.
game.rb ==> where the methods related to the game itself are written : swtiching players, checking win or draw results  etc.
board.rb ==> where the methods related to the board are written : display the board, the size of the board, are the cell available to place the piece, are the piece identical in lines (vertical, horizontal, diagonal) for the win check ? etc.
player.rb ==> where the methods related to the players are written : ask the user for the position to place their marker, are the position given by the user valid ? 

