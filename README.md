# Peg_Solitaire_Game
A Haskell program that implements the Peg Solitaire game in which you begin with a board like this:
![Screenshot 2025-01-22 191632](https://github.com/user-attachments/assets/2e16c733-7467-4e58-8b5d-1f64aa42ea8a)

and there is one white peg generated in a random position at the start of the game. The rest of the pegs are black.

**Objective:** The player tries to flip all black pegs into white pegs.                            
A peg can be flipped into white if there is at least one white peg around it (up, down, left, right)
## Types
- **_Position_** represents the position of a peg on the board (column #, row #)
- **_Colour_** represents the colour of the pegs (White or Black)
- **_Peg_** represents the physical pegs on the board in the form: 'Peg (col, row) Colour'
- **_Move_** represents the moves the player wants to make; which peg they want to turn white in the form: 'M (col, row)'
- **_Board_** represents the board on which the pegs are in the form of a list of Pegs
- **_State_** represents the state of the board after a successful move is made in the form of a successful move and the board after it got updated

## Functions
  - **createBoard** which takes the position of the first white peg and returns a board populated with black pegs and the white peg in the position given
    an ERROR occurs if the position does not exist on the board
  - **isValidMove** which takes a move and a board as inputs and returns _true_ if the move is valid and _false_ if not
  - **isGoal** which checks if the player won the game or not; checks if all the pegs have been flipped to white
  - **showPossibleNextStates** which takes a board and returns all possible unique states that can be reached from the current state of the board; the states that are reachable are those that result from a valid move
    an ERROR occurs if the board is already in a winning state
