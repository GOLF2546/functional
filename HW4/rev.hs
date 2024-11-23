--reverse.hs

join :: ([a], [a]) -> [a]
join (xs,[]) = xs
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev :: ([a]) -> [a]
rev ([]) = [] 
rev (x:xs) = join(rev(xs),[x]) 

-- How long does join take?
-- O(n) ; When n is number of elements

-- How long does rev take to compute the reverse of a list?
-- O(n^2) ; When n is number of elements because join use O(n) and rev use join it will be O(n^2)

-- Are you satisfied with the running time?
-- No, I think it can improve by join only the second list to first list it will decrese join to O(m) when m is number of elements of second list.
-- and if we reverse the list by swap the head and tail from head to middle it will be decrease to O(n/2) when n is number of elements of list that want to reverse. 