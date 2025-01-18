-- midterm.hs

-- Question 1
take2 :: Int -> [a] -> [a]
take2 _ [] = []
take2 n (x:xs)
    | n <= 0 = []
    | otherwise = x : take2 (n-1) xs

drop2 :: Int -> [a] -> [a]
drop2 _ [] = []
drop2 n (y:ys)
    | n <= 0 = (y:ys)
    | otherwise = drop2 (n-1) ys

createList :: Int -> [a] -> [[a]]
createList 0 _ = []
createList _ [] = []
createList n xs = take2 n xs : createList n (drop2 n xs)

createListII :: [a] -> [[a]]
createListII [] = []
createListII xs = list_aux 1 xs
    where 
        list_aux _ [] = []
        list_aux n ys = take2 n ys : list_aux (n + 1) (drop2 n ys)

-- End Question 1
length' :: [[Int]] -> Int;
length' [] = 0
length' (_:xs) = 1 + length'(xs);

access_list :: [[Int]] -> (Int , Int) -> Int
access_list list (a , b) = (list !! a) !! b

index :: [[Int]] -> Int -> Int -> [(Int , Int)]
index list i j = [(i,j) , (i, (length' list) - 1 - j) , ((length' list) - 1 - i, j), ((length' list) - 1 - i, (length' list) - 1 - j)]

fourValue :: [[Int]] -> [(Int,Int)] -> [Int];
fourValue _ [] = []
fourValue list1 (l:lx) = access_list list1 l : fourValue list1 lx

max' :: [Int] -> Int
max' [] = 0
max' (x:xs) = max_aux xs x
    where 
        max_aux [] acc = acc
        max_aux (y:ys) acc = if y > acc then max_aux ys y else max_aux ys acc

flippingMatrix :: [[Int]] -> Int
flippingMatrix list = sum_Aux 0 0
    where
        n = length' list `div` 2
        sum_Aux i acc
            | i >= n = acc
            | otherwise = sum_Aux (i + 1) (acc + rowSum i 0 0)
        rowSum i j acc
            | j >= n = acc
            | otherwise = 
                let vals = fourValue list (index list i j)
                    maxVal = max' vals
                in rowSum i (j + 1) (acc + maxVal)

testlist1 :: [[Int]]
testlist1 = [[112,42,89,119],[56,125,56,49],[15,78,101,43],[62,98,114,108]] --414

testlist2 :: [[Int]]
testlist2 = [[10, 20, 30, 40], [50, 60, 70, 80], [90, 100, 110, 120], [130, 140, 150, 160]] --540   

testlist3 :: [[Int]]
testlist3 = [[100, 99, 98, 97], [96, 95, 94, 93], [92, 91, 90, 89], [88, 87, 86, 85]] --390

testlist4 :: [[Int]]
testlist4 = 
    [[36, 35, 34, 33, 32, 31],
     [30, 29, 28, 27, 26, 25],
     [24, 23, 22, 21, 20, 19],
     [18, 17, 16, 15, 14, 13],
     [12, 11, 10, 9, 8, 7],
     [6, 5, 4, 3, 2, 1]] --261

testlist5 :: [[Int]]
testlist5 = 
    [[5, 10, 15, 20, 25, 30],
     [35, 40, 45, 50, 55, 60],
     [65, 70, 75, 80, 85, 90],
     [95, 100, 105, 110, 115, 120],
     [125, 130, 135, 140, 145, 150],
     [155, 160, 165, 170, 175, 180]] --1305

-- End Question 2

-- Question 3
sum1_to_n :: Int -> Int
sum1_to_n n = sum_aux n 0
    where
        sum_aux 0 acc = acc
        sum_aux m acc = sum_aux (m-1) (acc + m)

sumdigit :: [String] -> Int
sumdigit list1 = sum_aux list1 0
    where
        sum_aux [] acc = acc
        sum_aux (x:xs) acc = sum_aux (xs) ((read x::Int)+acc)

digit_to_sum :: Int -> Int
digit_to_sum n = sumdigit (map (:[]) (show (sum1_to_n n)))

-- End Question 3
-- Question 4
prime :: [Int]
prime = [2,3,5,7,11,13,17,19]

arePrime :: Int -> [Int] -> Bool
arePrime n primes = arePrime_aux n primes True
    where 
        arePrime_aux _ [] acc = acc
        arePrime_aux m (x:xs) acc = if(m `mod` x == 0 && m /= x || m == 1) then False && acc else arePrime_aux m xs True 

allPrime :: Int -> Int -> [Int]
allPrime n m = reverse $ allPrime_aux n m []
    where
        allPrime_aux 0 0 [] = []
        allPrime_aux init' end acc = if init' <= end then (if (arePrime init' prime) then allPrime_aux (init' + 1) end (init':acc) else allPrime_aux (init'+ 1) end acc) else acc
-- End Question 4