# Peg_Solitaire_Game
A Haskell program that implements the Peg Solitaire game in which you begin with a board like this:
![Screenshot 2025-01-22 191632](https://github.com/user-attachments/assets/2e16c733-7467-4e58-8b5d-1f64aa42ea8a)

and there is one white peg generated in a random position at the start of the game. The rest of the pegs are black.

**Objective:** The player tries to flip all black pegs into white pegs.                            
A peg can be flipped into white if there is at least one white peg around it (up, down, left, right)
## Types
_Position_ represents the position of a peg on the board (column #, row #)
_Colour_ represents the colour of the pegs (WHite or Black)
_Peg_ represents the physical pegs on the board in the form: 'Peg (col, row) Colour'
_Move_ represents the moves the player wants to make; which peg they want to turn white
_Board_
_State_
