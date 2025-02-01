-- eitherProve.hs

-- prove that the three monad laws hold for the Either monad
-- hint: prove by cases (Left vs Right)
-- instance Monad (Either e) where
--     Right m >>= k = k m
--     Left e  >>= _ = Left e

-- Monad laws 1
-- return a >>= k = k a
-- = (Right a) >>=  k
-- = k a
-- laws 1 hold

-- Monad laws 2
-- m >>= return = m
-- Left e >>= return = Left e
-- Right m >>= return
-- = return m
-- = Right m
-- laws 2 hold

-- Monad laws 3
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- Left e >>= (\x -> k x >> h)
-- Left e
-- Left e >>= h
-- (Left e >>= k) >>= h

-- Right m >>= (\x -> k x >>= h)
-- k m >>= h
-- (return m >>= k) >>= h
-- (Right m >>= k) >>= h
-- laws 3 hold