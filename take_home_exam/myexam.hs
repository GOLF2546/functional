data Shape a = Circle { r :: a } | Rect { w :: a , h :: a } | EquiTri {r :: a} deriving (Show, Eq)

-- instance Functor Shape where
--     fmap f (Circle r) = Circle (f r)
--     fmap f (Rect w h) = Rect (f w) (f h)
--     fmap f (EquiTri r) = EquiTri (f r)

-- instance Applicative Shape where
--     pure a = Circle a
--     Circle f <*> Circle x = Circle (f x)
--     Rect f g <*> Rect x y = Rect (f x) (g y)
--     EquiTri f <*> EquiTri x = EquiTri (f x)
--     Circle f <*> Rect x y = Rect (f x) (f y)
--     Circle f <*> EquiTri x = EquiTri (f x)
--     Rect f g <*> Circle x = Rect (f x) (g x)
--     Rect f _ <*> EquiTri x = EquiTri (f x)
--     EquiTri f <*> Circle x = Circle (f x)
--     EquiTri f <*> Rect x y = Rect (f x) (f y)

-- instance Monad Shape where
--     Circle x >>= f = Circle (r (f x))
--     Rect x y >>= f = Rect (w (f x)) (h (f y))
--     EquiTri x >>= f = EquiTri (r (f x))

instance (Num a, Ord a) => Semigroup (Shape a) where
    Circle r1 <> Circle r2 = Circle (r1 + r2)
    Circle r <> Rect w h = Rect (w + r) h
    Circle r <> EquiTri r' = EquiTri (r + r')
    Rect w1 h1 <> Rect w2 h2 = Rect (w1 + w2) (h1 + h2)
    Rect w h <> Circle r = Circle (r + max w h)
    Rect w h <> EquiTri r = Circle (r + max w h)
    EquiTri r1 <> EquiTri r2 = EquiTri (r1 + r2)
    EquiTri r <> Circle r' = Circle (r + r')
    EquiTri r <> Rect w h = Circle (r + max w h)

instance (Num a, Ord a) => Monoid (Shape a) where
    mempty = Circle 0