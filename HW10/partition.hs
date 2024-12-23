-- partition.hs

partition :: [a] -> (a -> Bool) -> ([a], [a])
partition xs p = (filter p xs, filter (not . p) xs)


-- partition function with foldl
partition' :: [a] -> (a -> Bool) -> ([a], [a])
partition' xs p = foldl (\(ts, fs) x -> if p x then (ts ++ [x], fs) else (ts, fs ++ [x])) ([], []) xs

-- partition function with foldr
partition'' :: [a] -> (a -> Bool) -> ([a], [a])
partition'' xs p = foldr (\x (ts, fs) -> if p x then (x:ts, fs) else (ts, x:fs)) ([], []) xs


-- be sure to think about efficiency by choosing the appropriate kind of fold
-- foldr is more efficient for building up lists in partition because operations like (++) are more expensive than (:)