-- equalityBTree.hs

-- how should we define equality for binary trees?
-- when are two binary trees equal?

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

isEqual :: Eq a => Tree a -> Tree a -> Bool
isEqual Empty Empty = True
isEqual _ Empty = False
isEqual Empty _ = False
isEqual (Node left a right) (Node left2 a2 right2)
    | a == a2 = (isEqual left left2) && (isEqual right right2)
    | otherwise = False

tree1 :: Tree Int
tree1 = Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)

tree2 :: Tree Int
tree2 = Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)

tree3 :: Tree Int
tree3 = Empty

tree4 :: Tree Int
tree4 = Node (Node (Node (Node Empty 2 Empty) 3 Empty) 4 (Node Empty 5 Empty)) 6 (Node (Node Empty 7 Empty) 8 Empty)

tree5 :: Tree Int
tree5 = Node (Node (Node (Node Empty 2 Empty) 3 Empty) 4 (Node Empty 5 Empty)) 6 (Node (Node Empty 7 Empty) 8 Empty)

-- First,  if both trees are empty, they are equal
-- Second, if one tree is empty and the other is not, they are not equal
-- Third,  if both trees are not empty, compare their root nodes and recursively compare the left and right subtrees
--         If root nodes are equal, check subtrees
--         If root nodes are not equal, the trees are not equal
