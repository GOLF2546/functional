-- equalityPair.hs

-- how should we define equality for pairs?
-- when are two pairs equal?

isEqual :: (Eq a, Eq b) => (a,b) -> (a,b) -> Bool
isEqual (x1, y1) (x2, y2) = x1 == x2 && y1 == y2

-- Both of element is both pair should be equal