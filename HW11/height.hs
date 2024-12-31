-- height.hs

data Tree a = Empty | Node a (Tree a) (Tree a)

height :: Ord a => Tree a -> Int
height Empty = 0
height (Node _ l r) = 1 + max (height l) (height r)

-- Example Tree
exampleTree1 :: Tree Int
exampleTree1 = Node 10 (Node 3 (Node 1 Empty Empty) (Node 4 Empty (Node 5 Empty (Node 6 Empty Empty)))) (Node 12 Empty Empty)

-- Test1
test1 = height exampleTree1

