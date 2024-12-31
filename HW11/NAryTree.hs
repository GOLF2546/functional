-- NAryTree.hs

data NaryTree a = Empty | Node a [NaryTree a] deriving (Show, Eq)

preOrder :: Ord a => NaryTree a -> [a] -> [a]
preOrder Empty acc = acc
preOrder (Node x children) acc = x : foldr (\child acc' -> preOrder child acc') acc children

postOrder :: Ord a => NaryTree a -> [a] -> [a]
postOrder Empty acc = acc
postOrder (Node x children) acc = (foldl (\acc' child -> postOrder child acc') acc children) ++ [x]

exampleTree :: NaryTree Int
exampleTree = 
    Node 1 
        [ Node 2 
            [ Node 4 [] 
            , Node 5 [] 
            ] 
        , Node 3 
            [ Node 6 [] 
            , Node 7 [] 
            ] 
        ]

test1 = preOrder exampleTree []  -- True
test2 = postOrder exampleTree [] 
-- test2 = isBST(tree2) -- False