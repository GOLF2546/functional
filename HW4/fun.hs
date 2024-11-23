-- fun.hs

curry :: ((a, b) -> c) -> a -> b -> c
curry f = \x y -> f (x, y)
-- curry f x y = f (x, y)
-- curry = \f x y -> f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry g = \(x, y) -> g x y
-- uncurry g (x, y) = g x y
-- uncurry = \g (x, y) -> g x y

-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- g . f = \x -> g (f x)
