-- prepareMidterm.hs

-- Length function
len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len (xs)

-- Join function
join :: [a] -> [a] -> [a]
join xs [] = xs
join [] ys = ys
join (x:xs) ys = x: join xs ys

-- Zipper function
zipper :: [a] -> [a] -> [(a, a)]
zipper [] [] = []
zipper _ [] = []
zipper [] _ = []
zipper (x:xs) (y:ys) = (x, y): zipper xs ys

-- Reverse function
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

-- Factorial function
fac :: Int -> Int
fac 0 = 1
fac n
    | n <= 0 = 1
    | otherwise = n * fac (n-1)

facs :: [Integer]
facs = 1 :  zipWith (*) [1 ..] facs

-- Reverse function
rev' :: [a] -> [a]
rev' [] = []
rev' (x:xs) = join (rev' xs) [x]

-- Fibonacci function
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- Reverse with tail recursion function
rev'' :: [a] -> [a]
rev'' l = rev_aux l []
    where
        rev_aux [] res = res
        rev_aux (x:xs) res = rev_aux xs (x:res)

-- Sumation with tail recursion functoin
sum :: (Num p) => [p] -> p
sum l = sum_aux l 0
    where
        sum_aux [] res = res
        sum_aux (x:xs) res = sum_aux xs (x + res)

-- Factorial with tail recursion
fac' :: Integral p => p -> p
fac' n
    | n >= 0 = fac_aux n 1
    | otherwise = error "Negative number"

fac_aux :: Integral p => p -> p -> p
fac_aux 0 res = res
fac_aux n res = fac_aux (n - 1) (n * res)

-- Fibonacci with tail reursion
fib' :: (Eq p, Num t, Num p) => p -> t
fib' n = fib_aux 0 0 1
    where
        fib_aux i res res'
            | i == n = res
            | otherwise = fib_aux (i+1) res' (res+res')

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
-- [0, 1, fib 2, ...]
-- [1, fib 2, ...]

-- List mapping
list_Map :: (a -> b) -> [a] -> [b]
list_Map _ [] = []
list_Map f (x:xs) = f x : list_Map f xs

-- Zipepr with tail recursion
zipper' :: [a] -> [b] -> [(a, b)]
zipper' xs ys = (rev''. zipper_aux xs ys) []
    where 
        zipper_aux [] [] res = res
        zipper_aux _ [] res = res 
        zipper_aux [] _ res = res
        zipper_aux (z:zs) (h:hs) res = zipper_aux zs hs ((z,h):res)

-- Filter Function
filter' :: ( a -> Bool ) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

-- Filter function with tail recursion
filter'' :: ( a -> Bool ) -> [a] -> [a]
filter'' p xs = reverse (filter_aux p xs [])
    where
        filter_aux _ [] res = res
        filter_aux f (z:zs) res = if (f z) then filter_aux f zs (z:res) else filter_aux f zs res

-- Filter concat function
filter_concat :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat _ [] = []
filter_concat f  (x:xs)
    | f x = x ++ filter_concat f xs
    | otherwise = filter_concat f xs

filter_concat' :: ([a] -> Bool) -> [[a]] -> [a]
filter_concat' predicate = (((.) concat). filter) predicate

-- Take while function
take_while :: ( a -> Bool ) -> [a] -> [a]
take_while _ [] = []
take_while predicate (x:xs)
    | predicate x = x : take_while predicate xs
    | otherwise = []