-- take_while.hs

take_while :: (a -> Bool) -> [a] -> [a]
take_while _ [] = []
take_while predicate (x:xs)
    | predicate x = x : take_while predicate xs
    | otherwise = []

-- what's the type of take_while?
-- take_while :: (a -> Bool) -> [a] -> [a]

--  rewrite (\l -> length l < 3) without using lambda expressions
--  what's the type of your answer?
--  hint: use composition
--  Answer: ((<3) . length)