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

treefold :: (a -> b -> b -> b) -> b -> Tree a -> b
treefold _ acc Empty = acc
treefold f acc (Node l v r) =
    let acc' = treefold f acc l
        acc'' = treefold f acc r
    in f v acc' acc''

simpleTree :: Tree Integer
simpleTree = Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)

emptyTree :: Tree Integer
emptyTree = Empty

-- tree traversal with treefold

preorder' :: Tree a -> [a]
preorder' Empty = []
preorder' tree = treefold (\v al ar -> v : al ++ ar) [] tree

inorder' :: Tree a -> [a]
inorder' Empty = []
inorder' tree = treefold (\v al ar -> al ++ [v] ++ ar) [] tree

postorder' :: Tree a -> [a]
postorder' Empty = []
postorder' tree = treefold (\v al ar -> al ++ ar ++ [v]) [] tree

-- n-ary tree
data NAryTree a = EmptyTree | NAryNode a [NAryTree a]

nAryPreorder :: NAryTree a -> [a]
nAryPreorder EmptyTree = []
nAryPreorder (NAryNode v children) = [v] ++ concat (map nAryPreorder children)

nAryPostorder :: NAryTree a -> [a]
nAryPostorder EmptyTree = []
nAryPostorder (NAryNode v children) = concat (map nAryPostorder children) ++ [v]

nAryFold :: (a -> [b] -> b) -> b -> (NAryTree a) -> b
nAryFold _ acc EmptyTree = acc
nAryFold f acc (NAryNode v children) = f v $ map (nAryFold f acc) children

height :: Integral p => Tree a -> p
height Empty = 0
height (Node l _ r) = 1 + max (height l) (height r)

inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node l x r) = inorder l ++ [x] ++ inorder r

qsort :: (Eq a, Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [lt | lt <- xs , lt < x] ++ [x] ++ qsort [gt | gt <- xs, gt >= x]

isBST :: Ord a => Tree a -> Bool
isBST Empty = True
isBST tree = inorder tree == qsort (inorder tree)
