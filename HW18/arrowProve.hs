-- arrowProve.hs

-- prove that the three monad laws hold for the arrow monad
-- hint: unlock each side of the equality with a value of type r, and check that both sides are indeed equal
-- instance Monad ((->) r) where
-- 	f >>= k = \ r -> k (f r) r

-- Monad laws 1
-- return a >>= k = k a
-- id a >>= k
-- k a
-- laws 1 hold

-- Monad laws 2
-- m >>= return = m
-- m >>= id
-- id m
-- m
-- laws 2 hold

-- Monad laws 3
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- m >>= (\x -> k x >>= h)
-- \r -> (\x -> k x >>= h) (m r) r
-- \r -> (k (m r) >>= h) r
-- \r -> h (k (m r) r) r
-- (\r -> k (m r) r) >>= h
-- (m >>= k) >>= h
-- laws 3 hold