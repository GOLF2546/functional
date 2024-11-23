-- fib.hs

-- Version that slide has given.
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Version for handle improper inputs
fib' :: Integral a => a -> a
fib' n
  | n == 0    = 0
  | n == 1    = 1
  | n > 0     = fib' (n-1) + fib' (n-2)
  | otherwise = error "negative number"

-- What's the type of your fib?
-- fib :: (Eq t, Num t, Num a) => t -> a
-- fib' :: Integral a => a -> a

-- How long does fib take to compute fib n?
-- O(2^(n-1)) because when you input is n the fib will recursive until find fib 0 or fib 1 and compute the value of fib n
-- for example fib 3 = fib 2 + fib 1 use 2 computation
-- then fib 2 = fib 1 + fib 0 use 2 computation
-- therefore it use 4 computation = 2^(3-1)

-- Are you satisfied with the running time?
-- No, I think it can improve by using memoization (Dynamic programming)
-- This will decrease fib to O(n) when n is the input number