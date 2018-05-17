data Cord a= Nil | Leaf a | Branch (Cord a) (Cord a) deriving (Eq, Ord, Show)

insert :: [a] -> Cord a
insert [] Leaf= Nil

insert [x] Nil = Leaf x
insert (x:xs) Branch a b 
 |(x>a) = 
 | 

size :: Cord a -> Int
size Nil = 0
size (Leaf n) = 1
size (Branch x y) = size x + size y 