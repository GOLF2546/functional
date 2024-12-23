-- foldl_foldr.hs

-- foldl version foldr
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc xs = foldr (\x g -> \a -> g (f a x)) id xs acc