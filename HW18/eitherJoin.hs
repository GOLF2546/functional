-- eitherJoin.hs

eitherJoin :: Either r (Either r a) -> Either r a
eitherJoin (Left r) = Left r
eitherJoin (Right (Left r)) = Left r
eitherJoin (Right (Right a)) = Right a