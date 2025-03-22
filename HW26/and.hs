-- and.hs

s x y z = x y (y z)
k x y = x
i x = x

and :: a -> (a -> b) -> b
and x f = k f x (k x f)
-- and x f = f x
-- f x
-- f (k x f)
-- k f x (k x f)