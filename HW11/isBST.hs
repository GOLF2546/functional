-- isBST.hs

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

leftValue :: Tree a -> Maybe a
leftValue Empty = Nothing
leftValue (Node _ Empty _) = Nothing
leftValue (Node _ (Node l _ _) _) = Just l

rightValue :: Tree a -> Maybe a
rightValue Empty = Nothing
rightValue (Node _ _ Empty) = Nothing
rightValue (Node _ _ (Node l _ _)) = Just l

isBST :: Ord a => Tree a -> Bool
isBST Empty = True
isBST (Node a left right) = (maybe True (<= a) (leftValue(Node a left right))) && 
                            (maybe True (>= a) (rightValue (Node a left right))) && 
                            isBST(left) && isBST(right)


tree = Node 10 (Node 5 (Node 2 Empty Empty) (Node 8 Empty Empty)) (Node 15 Empty (Node 20 Empty Empty))
tree2 = Node 1 (Node 5 (Node 2 Empty Empty) (Node 8 Empty Empty)) (Node 15 Empty (Node 20 Empty Empty))

test1 = isBST(tree) -- True
test2 = isBST(tree2) -- False

-- What's the type?
-- isBST :: Ord a => Tree a -> Bool