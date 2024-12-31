-- equalityList.hs

-- how should we define equality for lists?
-- when are two lists equal?

isEqual :: Eq a => [a] -> [a] -> Bool
isEqual [] [] = True
isEqual _ [] = False
isEqual [] _ = False
isEqual (x:xs) (y:ys)
    | x == y = isEqual xs ys
    | otherwise = False

-- First,  if both list is empty, they will be equal
-- Second, if one list is empty and other it not, trey are not equal
-- Thrid,  if both list is not empty check all element in list
--         If current element is eqaul, check next element
--         if current element is not equal, return False