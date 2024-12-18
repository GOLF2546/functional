--  filter.hs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs


-- filter function with foldl version
filterfoldl :: (a -> Bool) -> [a] -> [a]
filterfoldl f ys = reverse(foldl(\start y -> if f y then y : start else start) [] ys)

-- filter function with foldr version
filterfoldr :: (a -> Bool) -> [a] -> [a]
filterfoldr f ys = foldr(\y start  -> if f y then y : start else start) [] ys