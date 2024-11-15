--reverse.hs

join :: ([a], [a]) -> [a]
join (xs,[]) = xs
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev :: ([a]) -> [a]
rev ([]) = [] 
rev (x:xs) = join(rev(xs),[x]) 