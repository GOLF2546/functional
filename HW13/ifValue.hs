-- ifValue.hs

data Tree a = Empty | Node (Tree a) a (Tree a)


class IfValue a where
    boolVal :: a -> Bool
    
instance IfValue Int where
    boolVal 0 = False
    boolVal _ = True

instance IfValue Bool where
    boolVal False = False
    boolVal True = True

instance IfValue Double where
    boolVal 0 = False
    boolVal _ = True

instance IfValue Integer where
    boolVal 0 = False
    boolVal _ = True
    
instance IfValue Float where
    boolVal 0 = False
    boolVal _ = True

instance IfValue (Maybe a) where
    boolVal Nothing = False
    boolVal (Just _)  = True

instance IfValue [a] where
    boolVal [] = False
    boolVal _ = True

instance IfValue (a, b) where
    boolVal _ = True

instance IfValue (Tree a) where
    boolVal Empty = False
    boolVal _   = True