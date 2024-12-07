-- rewrite.hs

-- rewrite
-- [(x,y) | x <- [2,3,5], y <- [1,2,4], even $ x+y]
-- without using list comprehension
-- be careful with ordering
-- hint: (,) is a (curried) function that constructs a pair
-- (,) :: a -> b -> (a, b)
-- hint: use map and flip wisely

-- Answer
-- [(x,y) | x <- [2,3,5], y <- [1,2,4], even $ x+y]
-- filter (even . uncurry (+)) [(x,y) | x <- [2,3,5], y <- [1,2,4]]
-- filter (even . uncurry (+)) $ concat ((flip map (map (,) [2,3,5])) (flip map [1,2,4]))
