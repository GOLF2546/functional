-- equalityMaybe.hs

-- how should we define equality for Maybe?
-- when are two Maybe's equal?

isEqual :: Eq a => Maybe a -> Maybe a -> Bool
isEqual Nothing Nothing = True
isEqual _ Nothing = False
isEqual Nothing _ = False
isEqual (Just a1) (Just a2) = a1 == a2

-- Both Maybe should be true if both are Nothing
-- if one Maybe is Nothing and another is not both Maybe should not equal
-- if both is not Nothing should compare they element are equal or not? 
