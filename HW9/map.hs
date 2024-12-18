--  map.hs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- map with foldl version
mapfoldl :: (a -> b) -> [a] -> [b]
mapfoldl f ys = reverse(foldl (\start x -> f x : start) [] ys)

-- map with foldr version
mapfoldr :: (a -> b) -> [a] -> [b]
mapfoldr f ys = foldr (\y start -> f y : start) [] ys