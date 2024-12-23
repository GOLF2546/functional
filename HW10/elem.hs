-- elem.hs

elem'' :: Eq a => a -> [a] -> Bool
elem'' _ [] = False
elem'' x (y:ys) = x == y || elem'' x ys

-- Type of elem' is Eq a => a -> [a] -> Bool

-- fold version
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x ys = foldl (||) False (map (==x) ys)