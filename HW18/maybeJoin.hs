-- maybeJoin.hs

maybeJoin :: Maybe (Maybe a) -> Maybe a
maybeJoin Nothing = Nothing
maybeJoin (Just Nothing) = Nothing
maybeJoin (Just (Just a)) = Just a 
