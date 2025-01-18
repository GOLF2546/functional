-- map.hs

-- Map for Maybe type.

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing = Nothing
mapMaybe f (Just x) = Just (f x)

-- Map for pair

mapPair :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
mapPair f1 f2 (x, y) = (f1 x, f2 y)