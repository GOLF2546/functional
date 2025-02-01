-- eitherBind.hs

eitherBind :: Either r a -> (a -> Either r b) -> Either r b
eitherBind (Left r) _ = Left r
eitherBind (Right a) f = f a