data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Eq)

foldlTree :: (b -> a -> b) -> b -> Tree a -> b
foldlTree _ acc Empty = acc
foldlTree f acc (Node x left right) = foldlTree f (f (foldlTree f acc left) x) right

foldrTree :: (a -> b -> b) -> Tree a -> b -> b
foldrTree _ Empty acc = acc
foldrTree f (Node x left right) acc = foldrTree f left (f x (foldrTree f right acc))

testTree1 = Empty
testTree2 = Node 1 Empty Empty
testTree3 = Node 2 (Node 1 Empty Empty) (Node 3 Empty Empty)
testTree4 = Node 4 (Node 3 (Node 2 (Node 1 Empty Empty) Empty) Empty) Empty
testTree5 = Node 1 Empty (Node 2 Empty (Node 3 Empty (Node 4 Empty Empty)))

test1 = foldlTree (\acc x -> x : acc) [] testTree1
test2 = foldlTree (\acc x -> x : acc) [] testTree2
test3 = foldlTree (\acc x -> x : acc) [] testTree3
test4 = foldlTree (\acc x -> x : acc) [] testTree4
test5 = foldlTree (\acc x -> x : acc) [] testTree5

test6  = foldrTree (\x acc -> x : acc) testTree1 []
test7  = foldrTree (\x acc -> x : acc) testTree2 []
test8  = foldrTree (\x acc -> x : acc) testTree3 []
test9  = foldrTree (\x acc -> x : acc) testTree4 []
test10 = foldrTree (\x acc -> x : acc) testTree5 []
