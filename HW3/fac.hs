-- fac.hs

-- fac 0 = 1
-- fac n = n * fac (n-1)

-- what's the type of fac?
-- fac :: (Eq t, Num t) => t -> t

-- is your implementation of fac safe?
-- if not, when is it not safe, and what should you do to make it safer?
-- Not safe because when the input is fractional number and negative number, the fac function will calculate but it will crash with *** Exception: stack overflow.
-- Do safer by using Integer type instead and use if-else condition like fac'.

fac' :: Integer -> Integer
fac' 0 = 1
fac' n = if n > 0
        then n * fac (n-1)
        else error "negative number"

fac :: Integral p => p -> p
fac n
  | n == 0    = 1
  | n > 0     = n * fac (n-1)
  | otherwise = error "Negative number"


facs = 1 : zipWith (*) [1..] facs -- Definition of facs