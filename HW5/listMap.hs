-- listMap.hs

-- Simply version
listMap :: (a->b) -> [a] -> [b]
listMap _ [] = []
listMap f (x:xs) = f x : listMap f xs

-- what's the type of list_map?
-- listMap :: (a -> b) -> [a] -> [b]

-- From rev.hs file
join :: ([a], [a]) -> [a]
join (xs,[]) = xs
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)

rev :: ([a]) -> [a]
rev ([]) = [] 
rev (x:xs) = join(rev(xs),[x])  

-- Tail recursive version
list_Map :: (a -> b) -> [a] -> [b]
list_Map f xs = rev (list_Map_Aux xs [])
  where 
    list_Map_Aux [] res = res
    list_Map_Aux (y:ys) res = list_Map_Aux ys (f y : res)

-- Test case for list_Map
-- list_Map (*30) [1, 2, 3, 4]
-- [30,60,90,120]
-- list_Map not [True, False, True, False]
-- [False,True,False,True]
-- list_Map ( < 'd') "abcdefghij"
-- [True,True,True,False,False,False,False,False,False,False]