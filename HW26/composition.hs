-- composition.hs

s x y z = x y (y z)
k x y = x
i x = x

-- composition :: (b -> c) -> (a -> b) -> (a -> c)
-- composition = (s . k)

composition :: (b -> c) -> (a -> b) -> (a -> c)
-- composition f1 f2 a = f1 (f2 a)
composition = s . k

-- f1 (f2 a)
-- s f1 f2 a = f1 f2 (f2 a)
-- k f1 f2 = f1

-- s (k f1) f2 a -> s (k f1) f2 a
-- = k f1 f2 (f2 a)
-- = k f1 f2 (b)
-- = f1 b
-- = c
-- so composition f1 f2 a = (s . k) f1 f2 a
-- Hence composition = s . k