-- len_comp.hs

len_comp :: Integral b => [a] -> b
len_comp list = sum [1 | l <- list ]