-- arrowBind.hs

arrowBind :: (r -> a) -> (a -> (r -> b)) -> (r -> b)
arrowBind f g r = g (f r) r