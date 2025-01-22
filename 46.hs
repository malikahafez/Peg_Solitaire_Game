
type Position = (Int,Int)
data Color = W | B deriving (Eq, Show)
data Peg = Peg Position Color deriving (Eq, Show)
data Move = M Position deriving (Eq, Show)
type Board = [Peg]
data State = S Move Board deriving (Eq, Show)

--createBoard pos
createBoard:: Position -> Board
createBoard (x,y) 	| ((elem x [-3,-2,2,3]) && (elem y [3,2,-2,-3]))  = error "The position is not valid."
					| otherwise = insertWhite (fillBoard) x y 
--fillBoard  
--fills the board with Black pegs
--[(Peg (a,b) B )| a<-[-3], b<-[1,0,1]] ++ [(Peg (a,b) B )| a<-[-2], b<-[1,0,1]] ++ [(Peg (a,b) B )| a<-[-1], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[0], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[1], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[2], b<-[1,0,1]] ++ [(Peg (a,b) B )| a<-[3], b<-[1,0,1]]
fillBoard:: Board
fillBoard =	[(Peg (a,b) B )| a<-[-3], b<-[-1,0,1]] ++ [(Peg (a,b) B )| a<-[-2], b<-[-1,0,1]] ++ [(Peg (a,b) B )| a<-[-1], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[0], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[1], b<-[-3,-2,-1,0,1,2,3]] ++ [(Peg (a,b) B )| a<-[2], b<-[-1,0,1]] ++ [(Peg (a,b) B )| a<-[3], b<-[-1,0,1]]

--insertWhite b x y 
--b is the board with Black pegs, x and y are coordinates of White peg
--insertWhite changes the peg at coordinates (x,y) to White
insertWhite :: Board -> Int-> Int -> Board
insertWhite [] _ _ = []
insertWhite (h:t) x y	| h== (Peg (x,y) B) = ((Peg (x,y) W): t)
						| otherwise = h:(insertWhite t x y)

--isValidMove move board
isValidMove:: Move -> Board -> Bool
isValidMove (M (x,y)) (b:bs) 	|((elem x [-3,-2,2,3]) && (elem y [3,2,-2,-3])) = False
								| isWhite (x,y) (b:bs)  = False
								| not (isWhite (x,y) (b:bs) ) = isWhite (x, (y-1)) (b:bs)  || isWhite (x, (y+1)) (b:bs)  || isWhite ((x+1), y) (b:bs)  || isWhite ((x-1),y) (b:bs)  
								| otherwise = isValidMove (M (x,y)) bs

--isWhite pos board 
--checks if peg at given position is white
isWhite:: Position -> Board -> Bool
isWhite _ [] = False
isWhite (x,y) (h:t) | h==(Peg (x,y) W) = True
					| otherwise = isWhite (x,y) t
--isGoal board
isGoal:: Board -> Bool
isGoal []= True
isGoal ((Peg (x,y) c:t)) 	|c==B = False
							|c==W = isGoal t

--showPossibleNextStates board
showPossibleNextStates:: Board -> [State]
showPossibleNextStates [] = []
showPossibleNextStates b 	| isGoal b = error "No Possible States Exist."	
							| otherwise = help [M (x,y)|x<-[-3,-2,-1,0,1,2,3], y<-[-3,-2,-1,0,1,2,3]] b

--help moves board
help:: [Move]-> Board-> [State]
help [] b = []
help ((M (x,y)):ms) b     |( isValidMove (M (x,y)) b )= (S (M (x,y)) (insertWhite b x y)):(help ms b)
					      | otherwise = help ms b 
						  




						
					