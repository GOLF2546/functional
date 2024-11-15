-- join.sh

join :: ([a], [a]) -> [a]
join (xs,[]) = xs
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)
