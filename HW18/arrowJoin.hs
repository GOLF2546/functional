-- arrowJoin.hs

arrowJoin :: (r -> (r -> a)) -> (r -> a)
arrowJoin f r = f r r
