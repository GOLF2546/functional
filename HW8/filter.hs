-- filter.hs

-- from partition.hs
partition :: (a -> Bool) -> [a] -> ([a], [a])
partition _ [] = ([], [])
partition p (x:xs)
  | p x       = (x:l, r)
  | otherwise = (l, x:r)
  where (l, r) = partition p xs

-- rewrite filter using partition
-- hint: see fst and snd functions

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p xs = fst (partition p xs)

-- fst will return the first array of pair
-- snd will return the second array of pair