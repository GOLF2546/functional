data Either' a b = Left' a | Right' b

instance (Eq a, Eq b) => Eq (Either' a b) where
    Left' x /= Left' y = not (x == y)
    Right' x /= Right' y = not (x == y)
    _ /= _ = True