-- prepareMidterm5.hs

data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

-- height function
height :: (Integral p, Eq p, Ord p) => Tree a -> p
height Empty = 0
height (Node l _ r) = 1 + max (height l) (height r)

-- Rebalance function
rebalance :: Ord a => Tree a -> Tree a
rebalance Empty = Empty
rebalance t@(Node tl y tr) =
    if height tl - height tr > 1
    then let Node ll x lr = tl in
        if height ll >= height lr then
            Node ll x (Node lr y tr)
        else
            let Node ml xy mr = lr in
            Node (Node ll x ml) xy (Node mr y tr)
    else if height tr - height tl > 1
    then let Node rl x rr = tr in
        if height rl > height rr then
            let Node ml yx mr = rl in
            Node (Node tl y ml) yx (Node mr x rr)
        else
            Node (Node tl y rl) x rr
    else
        t

avlInsert :: Ord a => Tree a -> a -> Tree a
avlInsert Empty x = Node Empty x Empty
avlInsert (Node l v r) x
    | x < v = rebalance $ Node (avlInsert l x) v r
    | otherwise = rebalance $ Node l v (avlInsert r x)

delMin :: Ord a => Tree a -> (a, Tree a)
delMin Empty = error "delMin called on an empty tree"
delMin (Node Empty v r) = (v, r)
delMin (Node l v r) = (m, Node l' v r)
    where
        (m, l') = delMin l

avlDelete :: Ord a => Tree a -> a -> Tree a
avlDelete Empty _ = Empty
avlDelete (Node l v r) x
    | x == v = case (l, r) of
        (Empty, Empty) -> Empty
        (Empty, _) -> r
        (_, Empty) -> l
        _ -> rebalance $ Node l m r'
            where (m, r') = delMin r
    | x < v = rebalance $ Node (avlDelete l x) v r
    | otherwise = rebalance $ Node l v (avlDelete r x)


