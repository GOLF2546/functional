-- zipper.hs

zipper :: [a] -> [b] -> [(a,b)] 
zipper [] _ = []
zipper _ [] = []
zipper (x:xs) (y:ys) = (x,y): zipper xs ys

-- From rev.hs file
join :: ([a], [a]) -> [a]
join (xs,[]) = xs
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev :: ([a]) -> [a]
rev ([]) = [] 
rev (x:xs) = join(rev(xs),[x]) 

-- zipper tail recursion version
zipper' :: [a] -> [b] -> [(a,b)]
zipper' xs ys = rev (zipper_aux xs ys [])
    where
        zipper_aux [] _ res = res
        zipper_aux _ [] res = res
        zipper_aux (z:zs) (h:hs) res = zipper_aux zs hs ((z,h) : res)
