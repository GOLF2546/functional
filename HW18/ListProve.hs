-- ListProve.hs

-- prove that the three monad laws hold for the list monad
-- instance Monad []  where
-- 	xs >>= f = [y | x <- xs, y <- f x]

-- Monad laws 1
-- return a >>= k = k a
-- [a] >>= k
-- [y | x <- [a], y <- k x]
-- k a
-- laws 1 hold

-- Monad laws 2
-- m >>= return = m
-- [y | x <- m, y <- [x]]
-- [x | x <- m]
-- m
-- laws 2 hold

-- Monad laws 3
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h

-- Left side
-- [z | x <- m, z <- (k x >>= h)]
-- [z | x <- m, z <- [y | w <- k x, y <- h w]]
-- [z | x <- m, w <- k x, z <- h w]

-- Right side
-- [y | x <- m, y <- k x] >>= h
-- [z | w <- [y | x <- m, y <- k x], z <- h w]
-- [z | x <- m, w <- k x, z <- h w] 
-- laws 3 hold