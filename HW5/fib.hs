-- fib.hs

-- challenge: define fibs, the list of Fibonacci numbers, in the same way as facs

facs = 1 : zipWith (*) [1..] facs

-- hint: use function tail

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)