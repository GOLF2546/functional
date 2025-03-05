-- pairBiMap.hs
-- show that (,) is a bifunctor by implementing
-- pairBimap :: (a -> c) -> (b -> d)
--                -> (a, b) -> (c, d)
-- prove that these bifunctor laws hold:
-- pairBimap id id = id
-- pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i

pairBiMap :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
pairBiMap f g (x, y) = (f x, g y)

-- prove
-- 1. pairBimap id id = id
--    pairBimap id id (x ,y) = (id x, id y)
--                           = (x, y)
--                           = id (x, y)
-- so pairBimap id id        = id 
-- first law is hold.

-- 2 pairBiMap (f . g) (h . i) = pairBiMap f h . pairBiMap g i
--   pairBiMap (f . g) (h . i) (x ,y) = ((f . g) x, (h . i) y)
--                                    =   (f (g x), h (i y))
--                                    =   pairBiMap f h (g x, i y)
--                                    =   pairBiMap f h (pairBiMap g i (x, y))
--                                    =   pairBiMap f h . pairBiMap g i (x, y)
-- so pairBiMap (f . g) (h . i)       = pairBiMap f h . pairBiMap g i
-- second law is hold.