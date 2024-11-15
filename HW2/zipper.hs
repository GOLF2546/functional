-- zipper.hs

zipper::([a], [b]) -> [(a,b)] 
zipper([], _) = []
zipper(_,[]) = []
zipper(x:xs,y:ys) = (x,y):zipper(xs,ys)