-- arrowRApplicative.hs

-- prove that the four applicative functor laws hold for (->) r applicative functor
-- hint: apply each side of the equality to an argument (of type r), and check that both sides are indeed equal
-- instance Applicative ((->) r) where
-- 	pure = const
-- 	(<*>) f g x = f x (g x)

-- 1. pure id <*> v = v

-- pure id <*> v $ x = const id <*> v $ x
--                   = (const id) x (v x)
--                   = id (v x)
--                   = v x

-- 2. pure (.) <*> u <*> v <*> w = u <*> (v <*> w)

-- pure (.) <*> u <*> v <*> w $ x = const (.) <*> u <*> v <*> w $ x
--                                = (const (.)) x (u x (v <*> w $ x))
--                                = (.) (u x) (v <*> w $ x)
--                                = (.) (u x) (v x (w x))
--                                = u x (v x (w x))
--                                = u x ((v <*> w) $x)
--                                = u <*> (v <*> w) $ x


-- 3. pure f <*> pure x = pure (f x)

-- pure f <*> pure x $ y = const f <*> const x $ y
--                       = (const f y) (const x y)
--                       = f x
--                       = const (f x) y
--                       = pure (f x) $ y

-- 4. u <*> pure y = pure ($ y) <*> u

-- u <*> pure y $ x = u x (pure y x)
--                  = u x (const y x)
--                  = u x $ y
--                  = ($ y) (u x)
--                  = (const ($y) x) (u x)
--                  = pure ($ y) <*> u $ x