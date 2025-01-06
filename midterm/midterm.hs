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

-- End Question2