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