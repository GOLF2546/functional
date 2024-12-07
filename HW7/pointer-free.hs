-- point-free.hs

-- write this function in point-free style:
-- contains1 = \x l -> any (x<) l
-- hint: any :: (a -> Bool) -> [a] -> Bool

-- Answer
-- contains1 = \x l -> any (x<) l
-- contains1 = \x -> any (x<)
-- contains1 = \x -> any . (<) $ x
-- contains1 = any . (<) 


-- write this function in point-free style:
-- contains2 = \l x -> any (x<) l
-- hint: use flip function

-- Answer
-- contains2 = \l x -> any (x<) l
-- contains2 = \l x -> contains1 x l
-- contains2 = \l x -> flip contains1 l x 
-- contains2 = \l   -> flip contains1 l
-- contains2 = flip contains1
-- contains2 = flip (any . (<))