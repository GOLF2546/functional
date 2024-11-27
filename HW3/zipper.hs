-- zipper.hs

zipper::([a], [b]) -> [(a,b)] 
zipper([], _) = []
zipper(_,[]) = []
zipper(x:xs,y:ys) = (x,y):zipper(xs,ys)

-- zipper' curried version of zipper
zipper':: [a] -> [b] -> [(a,b)] 
zipper' [] _ = []
zipper' _ [] = []
zipper' (x:xs) (y:ys) = (x,y): zipper' xs ys

-- what's the type of zipper'?
-- zipper' :: [a] -> [b] -> [(a,b)]

-- what's the type of zipper' []?
-- zipper' [] :: [b] -> [(a, b)]
-- zipper' [] waiting for receive input [b] and output []
-- is there a simpler way to express the same thing?
-- apply [] to output when [a] = []