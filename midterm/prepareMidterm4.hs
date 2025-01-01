-- prepareMidterm4.hs

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)
-- Map Binary tree Function

treemap :: (a -> b) -> Tree a -> Tree b
treemap _ Empty = Empty
treemap f (Node l v r) = Node (treemap f l) (f v) (treemap f r)

-- Fold binary tree function
treefoldr :: ( a -> b -> b) -> b -> Tree a -> b
treefoldr _ acc Empty = acc
treefoldr f acc (Node l v r) =
    let acc' = treefoldr f acc l
        acc'' = treefoldr f acc' r
    in f v acc'' 

treefoldl :: (b -> a -> b) -> b -> Tree a -> b
treefoldl _ acc Empty = acc
treefoldl f acc (Node l v r) =
    let acc' = treefoldl f acc l
        acc'' = treefoldl f acc' r
    in f acc'' v

tree2 :: Tree Integer
tree2 = Node (Node (Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)) 4 (Node Empty 5 Empty)) 6 (Node (Node (Node Empty 7 (Node (Node Empty 8 Empty) 9 (Node Empty 10 Empty))) 11 (Node Empty 12 Empty)) 13 (Node (Node Empty 14 Empty) 15 (Node Empty 16 Empty)))