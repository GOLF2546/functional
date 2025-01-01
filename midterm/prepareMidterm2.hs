-- PrepareMindterm2.hs

-- contain1 = \x l -> any (x<) l
-- contain1 = \x -> any (x<)
-- contain1 = \x -> any ((<) $ x)
-- contain1 = \x -> (any . (<)) x
-- contain1 = any . (<)

-- contain2 = \l x -> any (x<) l
-- contain2 = \l x -> contain1 x l
-- contain2 = \l x -> flip contain1 l x
-- contain2 = \l -> flip contain1 l
-- contain2 = flip contain1
-- contain2 = flip (any . (<))

-- Len_Comp function
len_comp :: Integral p => [a] -> p
len_comp list = sum [1 | _ <- list]

-- Find pair that x + y is even
-- even_pair function
-- [(x,y) | x <- [2,3,5], y <- [1,2,4], even $ x+y]
-- filter (even . uncurry (+)) [(x,y) | x <- [2,3,5], y <- [1,2,4]]
even_pair :: Integral a => [a] -> [a] -> [(a,  a)]
even_pair list1 list2 = filter (even . uncurry (+)) [(x,y) | x <- list1 , y <- list2]

even_pair' :: Integral a => [a] -> [a] -> [(a , a)]
even_pair' list1 list2 = filter (even . uncurry (+)) $ cartesian list1 list2

-- Cartesian function
cartesian :: [a] -> [a] -> [(a, a)]
cartesian xs ys = concat $ map (\f ->map f ys) $ map (,) xs 

-- Quick sort function
qsort :: (Eq a, Integral a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [lt | lt <- xs , lt < x] ++ [x] ++ qsort [gt | gt <- xs, gt >= x]

qsort' :: (Eq a, Integral a) => [a] -> [a]
qsort' [] = []
qsort' (hd:tl) = qsort' l ++ [hd] ++ qsort' r
    where
        l = [x | x <- tl , x < hd]
        r = [x | x <- tl , x >= hd]

-- Partition function
partition :: (a -> Bool) -> [a] -> ([a] , [a])
partition _ [] = ([] , [])
partition p (x:xs)
    | p x = (x:l, r)
    | otherwise = (l, x:r)
    where (l, r) = partition p xs

-- Filter from partition function
filter' :: (a -> Bool) -> [a] -> [a]
filter' = ((fst .) . partition)

-- Quick sort without list comprehension
qsort'' :: Ord a => [a] -> [a]
qsort'' [] = []
qsort'' (hd:tl) = qsort'' l ++ [hd] ++ qsort'' r
    where
        l = filter' (< hd) tl
        r = filter' (>= hd) tl

-- Reverse with fold function
rev :: [a] -> [a]
rev [] = []
rev ys = foldl (\start y -> y : start ) [] ys

rev' :: [a] -> [a]
rev' [] = []
rev' ys = foldr (\y start -> start ++ [y]) [] ys

-- Map using fold function
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f xs = rev (foldl (\start x -> f x : start ) [] xs)

map'' :: (a -> b) -> [a] -> [b]
map'' _ [] = []
map'' f ys = foldr (\x start -> f x : start) [] ys

-- Filter using fold function
filter'' :: (a -> Bool) -> [a] -> [a]
filter'' _ [] = []
filter'' f xs = reverse(foldl (\start x -> if f x then x : start else start ) [] xs)

filter''' :: (a -> Bool) -> [a] -> [a]
filter''' _ [] = []
filter''' f ys = foldr (\y start -> if f y then y : start else start) [] ys