-- how should we define equality for binary trees?
-- when are two binary trees equal?

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

isEqual :: Ord a => Tree a -> Tree a -> Bool
isEqual Empty Empty = True
