-- partition.hs

partition :: (a -> Bool) -> [a] -> ([a], [a])
partition _ [] = ([], [])
partition p (x:xs)
  | p x       = (x:l, r)
  | otherwise = (l, x:r)
  where (l, r) = partition p xs

-- what's the type of partition?
-- partition :: (a -> Bool) -> [a] -> ([a], [a])


-- what does partition do?
-- Separate the array list if that element matches the condition it will be in the left list if not it will be in the right list and return it in pairs of arrays.
-- example partition even [1,2,3,4,5,6]
-- result ([2,4,6], [1,3,5])
