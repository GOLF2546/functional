data Rect a = Rect { w :: a, h :: a }

instance Functor Rect where
    fmap f (Rect w h) = Rect (f w) (f h)

instance Applicative Rect where 
    pure a = Rect a a 
    Rect f g <*> Rect x y = Rect (f x) (g y) 

instance Monad Rect where 
    Rect x y >>= f = Rect (w (f x)) (h (f y))

join :: Ord a => Rect (Rect a) -> Rect a
join (Rect (Rect x1 y1) (Rect x2 y2)) = Rect (max x1 x2) (max y1 y2)

fish :: Ord c => (a -> Rect b) -> (b -> Rect c) -> a -> Rect c
fish f g x = join $ fmap g (f x)