-- maybeBind.hs

maybeBind :: Maybe a -> (a -> Maybe b) -> Maybe b
maybeBind Nothing _ = Nothing
maybeBind (Just a) f = f a
