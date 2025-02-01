-- listBind.hs

listBind :: [a] -> (a -> [b]) -> [b]
listBind [] _ = []
listBind xs f = concatMap f xs
