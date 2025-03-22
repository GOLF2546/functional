-- flip.hs

s x y z = x y (y z)
k x y = x
i x = x

flip :: (a -> b -> c) -> b -> a -> c
flip f b a = s (k k) (k s) f a (k (f a))(k k f b) a

-- flip f b a = f a b
--            = f a k (b a)
--            = f a (k k f b a)
--            = k (f a) b (k k f b a)
--            = s (k (f a)) (k k f b) a
--            = k s f (k (f a)) (k k f b) a
--            = k (k s f) a (k (f a)) (k k f b) a
--            = k k f (k s f) a (k (f a))(k k f b) a
--            = s (k k) (k s) f a (k (f a))(k k f b) a