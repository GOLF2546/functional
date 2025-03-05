-- natural_tranformation.hs

-- write the following natural transformations
-- Maybe → list
maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]
-- true or false, and why: for any f :: a -> b,
-- fmap f . maybeToList = maybeToList . fmap f
-- fmap f . maybeToList x = maybeToList . fmap f x
-- prove by cases
-- 1. x = Nothing
--    fmap f . maybeToList x = fmap f . maybeToList Nothing
--                           = fmap f []
--                           = []
--                           = maybeToList Nothing
--                           = maybeToList . fmap f Nothing
--                           = maybeToList . fmap f x
-- x = Nothing, fmap f . maybeToList = fmap f . maybeToList holds
-- 2. x = Just y
--    fmap f . maybeToList x = fmap f . maybeToList (Just y)
--                          = fmap f [y]
--                          = [f y]
--                          = maybeToList (Just (f y))
--                          = maybeToList . fmap f (Just y)
--                          = maybeToList . fmap f x
-- x = Just y, fmap f . maybeToList = fmap f . maybeToList holds
-- so, for any f :: a -> b, fmap f . maybeToList = maybeToList . fmap f

-- list → Maybe
listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe [x] = Just x
listToMaybe (x : _) = Just x
-- true or false, and why: for any f :: a -> b,
-- fmap f . listToMaybe = listToMaybe . fmap f
-- prove by cases
-- 1. x = []
--    fmap f . listToMaybe x = fmap f . listToMaybe []
--                           = fmap f Nothing
--                           = Nothing
--                           = listToMaybe []
--                           = listToMaybe . fmap f []
--                           = listToMaybe . fmap f x
-- so, for x = [], fmap f . listToMaybe = listToMaybe . fmap f holds
-- 2. x = [y]
--    fmap f . listToMaybe x = fmap f . listToMaybe [y]
--                           = fmap f (Just y)
--                           = Just (f y)
--                           = listToMaybe [f y]
--                           = listToMaybe . fmap f [y]
--                           = listToMaybe . fmap f x
-- so, for x = [y], fmap f . listToMaybe = listToMaybe . fmap f holds
-- 3. x = y : _
--    fmap f . listToMaybe x = fmap f . listToMaybe (y : _)
--                           = fmap f (Just y)
--                           = Just (f y)
--                           = listToMaybe (f y : _)
--                           = listToMaybe . fmap f (y : _)
--                           = listToMaybe . fmap f x
-- so, for x = y : _, fmap f . listToMaybe = listToMaybe . fmap f holds
-- so, for any f :: a -> b, fmap f . listToMaybe = listToMaybe . fmap f