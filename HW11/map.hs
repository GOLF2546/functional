-- map.hs

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

tmap :: Ord a => Tree a -> (a -> b) -> Tree b
tmap Empty _ = Empty
tmap (Node x l r) f = Node (f x) (tmap l f) (tmap r f)

-- Example Tree
exampleTree1 :: Tree Int
exampleTree1 = Node 5 (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 8 Empty Empty)

exampleTree2 :: Tree String
exampleTree2 = Node "root" (Node "left" Empty Empty) (Node "right" Empty Empty)

-- Test1
test1 = tmap exampleTree1 (>=3)

-- Test2
test2 = tmap exampleTree2 length

-- what's the type?
-- tmap :: Ord a => Tree a -> (a -> b) -> Tree b