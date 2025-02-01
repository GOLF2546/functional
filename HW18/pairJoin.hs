-- pairJoin.hs

pairJoin :: Monoid r => (r, (r, a)) -> (r, a)
pairJoin (r1, (r2, a)) = (r1 <> r2, a)