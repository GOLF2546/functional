-- PrepareMidterm3.hs

-- Maximum function
maximum' :: Ord a => [a] -> Maybe a
maximum' [] = Nothing
maximum' (x:xs) = case maximum' xs of
    Nothing -> Just x
    Just m  -> Just $ max m x

maximum'' :: Ord a => [a] -> Maybe a
maximum'' [] = Nothing
maximum'' (x:xs) = maybeGT (maximum'' xs) x

maximum''' :: Ord a => [a] -> Maybe a
maximum''' l = foldl maybeGT Nothing l

maybeGT :: Ord a => Maybe a -> a -> Maybe a
maybeGT Nothing x = Just x
maybeGT (Just m) x = Just $ max m x

-- Elem function

elem' :: (Integral a) => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs)
    | n == x = True
    | otherwise = elem' n xs

-- Elem with fold
elemfold :: (Integral a) => a -> [a] -> Bool
elemfold _ [] = False
elemfold n xs = foldl (\start hd -> start || hd == n) False xs

-- Partition function with fold
partition' :: (a -> Bool) -> [a] -> ([a], [a])
partition' p = foldr select ([] , [])
    where
        select x (l, r)
            | p x = (x:l, r)
            | otherwise = (l , x:r)

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node l x r) = [x] ++ preorder l ++ preorder r

inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node l x r) = inorder l ++ [x] ++ inorder r

postorder :: Tree a -> [a]
postorder Empty = []
postorder (Node l x r) = postorder l ++ postorder r ++ [x]

tree1 :: Tree Integer
tree1 = Node (Node (Node Empty 5 Empty) 4 (Node Empty 1 Empty)) 9 (Node (Node Empty 6 Empty) 7 (Node Empty 0 Empty))

tree2 :: Tree Integer
tree2 = Node (Node (Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)) 4 (Node Empty 5 Empty)) 6 (Node (Node (Node Empty 7 (Node (Node Empty 8 Empty) 9 (Node Empty 10 Empty))) 11 (Node Empty 12 Empty)) 13 (Node (Node Empty 14 Empty) 15 (Node Empty 16 Empty)))

insert :: Ord a => Tree a -> a -> Tree a
insert Empty x = Node Empty x Empty
insert (Node l v r) x 
    | x < v = Node (insert l x) v r
    | otherwise = Node l v (insert r x)

contains :: Ord a => Tree a -> a -> Bool
contains Empty _ = False
contains (Node l v r) x
    | x == v = True
    | x < v = contains l x
    | x > v = contains r x
    | otherwise = False

delete :: Ord a => Tree a -> a -> Tree a
delete Empty _ = Empty
delete (Node l v r) x
    | x < v = Node (delete l x) v r
    | x > v = Node l v (delete r x)
    | otherwise = case (l, r) of
        (_, Empty) -> l
        (Empty, _) -> r
        _ -> Node l m r'
            where 
                (m, r') = delMin r

delMin :: Ord a => Tree a -> (a, Tree a)
delMin Empty = error "delMin called on an empty tree"
delMin (Node Empty v r) = (v, r)
delMin (Node l v r) = (m, Node l' v r)
    where
        (m, l') = delMin l

tree3 :: Tree Integer
tree3 = delete tree2 6