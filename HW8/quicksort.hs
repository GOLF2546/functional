-- quicksort.hs

-- from partition.hs
partition :: (a -> Bool) -> [a] -> ([a], [a])
partition _ [] = ([], [])
partition p (x:xs)
  | p x       = (x:l, r)
  | otherwise = (l, x:r)
  where (l, r) = partition p xs


-- rewrite quicksort without using list comprehension
-- hint: modify the version with where
-- hint: use partition

-- quicksort version with where
qsort :: Ord a => [a] -> [a]
qsort []      = []
qsort (hd:tl) = qsort l ++ [hd] ++ qsort r
  where l = [x | x <- tl, x < hd]
        r = [x | x <- tl, x >= hd]


quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (hd:tl) = quicksort l ++ [hd] ++ qsort r
    where l = fst(partition (<hd) tl)
          r = snd(partition (<hd) tl)