-- proveSt.hs

-- prove that state monad satisfies functor laws
-- hint: for composition law, work from right to left

-- newtype State s a = State { runState :: s -> (a, s) }

-- instance Functor (State s) where
--     fmap :: (a -> b) -> State s a -> State s b
--     fmap f (State g) = State $ \s ->
--         let (x, s') = g s
--         in (f x, s')

-- the first functor law:
-- Identity Law: fmap id = id
-- fmap id st = id st

-- fmap id (State g) = State (\s -> let (x, s') = g s in (id x, s'))
--                   = State (\s -> let (a, s') = g s in (x, s'))
--                   = State g
--                   = id (State g)
-- Identity Law hold.

-- the second functor law:
-- composition law: fmap (h . g) = fmap h . fmap g

-- left handside
-- fmap (h . g) (State f) = State (\s -> let (x, s') = f s in ((h . g) x, s'))
--                        = State (\s -> let (x, s') = f s in (h (g x), s'))

-- right handside
-- fmap h (fmap g (State f)) = fmap h (State (\s -> let (x, s') = f s in (g x), s'))
--                           = State (\s -> let (x', s') = (\s -> let (x, s') = f s in (g x, s')) s in (h x', s'))
--                           = State (\s -> let (x, s') = f s in (h (g x), s'))

-- left handside = right handside.
-- composition law hold.