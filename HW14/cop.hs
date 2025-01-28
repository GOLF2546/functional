-- cop.hs

data COp a = CVal Int a deriving (Show)

instance Functor COp where
  fmap :: (a -> b) -> COp a -> COp b
  fmap f (CVal c v) = CVal (c + 1) (f v)

-- is this an appropriate definition of a functor for COp?
-- inappropriate because when f is an id the value is not transfrom but the count value increase by 1.

-- define a functor for (->) r:
-- instance Functor ((->) r) where
-- fmap f rToa = \r -> f (rToa r)
--             = \r -> (f . rToa) r
-- fmap f rToa = (f . rToa)
-- fmap f rToa = (f .) rToa
-- fmap f = (f .)
-- fmap f = (.) f
-- fmap = (.)