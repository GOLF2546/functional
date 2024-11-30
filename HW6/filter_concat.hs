-- filter_concat.hs

filter_concat :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat _ [] = []
filter_concat predicate  (x:xs)
    | predicate  x = x ++ filter_concat predicate  xs
    | otherwise = filter_concat predicate  xs

-- what's the type of filter_concat?
-- filter_concat :: ([a] -> Bool) -> [[a]] -> [a]


-- can you avoid recursion in your definition? (feel free to use functions from the Prelude)
filter_concat' :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat' predicate = concat . filter predicate
