-- reverse.hs

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]


-- Reverse with foldl
reversed :: [a] -> [a]
reversed [] = []
reversed ys = foldl (\start y -> y : start) [] ys


-- Reverse with foldr
reversed' :: [a] -> [a]
reversed' [] = []
reversed' ys = foldr (\y start -> start ++ [y]) [] ys


-- Compare reversed with fold
-- reverse with foldl
-- reversed "hello"
-- reversed l = foldl (\start y -> y : start) [] l
-- "h": [] -> ["h"]
-- "e": ["h"] -> ["e", "h"]
-- "l": ["e", "h"] -> ["l", "e", "h"]
-- "l": ["l", "e", "h"] -> ["l", "l", "e", "h"]
-- "o": ["l", "l", "e", "h"] -> ["o", "l", "l", "e", "h"]
-- ["o", "l", "l", "e", "h"]

-- reverse with foldr
-- reversed "hello"
-- reversed' ys = foldr (\y start -> start ++ [y]) [] ys
-- [] ++ "o" -> ["o"]
-- ["o"] ++ "l" -> ["o", "l"]
-- ["o", "l"] ++ "l" -> ["o", "l", "l"]
-- ["o", "l", "l"] ++ "e" -> ["o", "l", "l", "e"]
-- ["o", "l", "l", "e"] ++ "h" -> ["o", "l", "l", "e", "h"]
-- ["o", "l", "l", "e", "h"]

-- which version is more efficient, and why?
-- The foldl version is more efficient because the : operator (cons) is faster than the ++ operator (list concatenation).
-- : adds a single element to the front of a list in 𝑂(1) (constant time).
-- ++ appends two lists, which requires traversing the entire first list, making it 𝑂(𝑛) where 𝑛 is the length of the first list.
-- example
-- : (cons) operation
-- "l": ["e", "h"]   -> ["l", "e", "h"]

-- ++ operation
-- ["o", "l"] ++ "l" -> ["o"] ++ ["l", "l"]
--                   -> ["o", "l", "l"]

