newtype And = And {getAnd :: Bool} deriving (Show)

instance Semigroup And where
    (And a) <> (And b) = And (a && b)

instance Monoid And where
    mempty = And True

newtype Or = Or {getOr :: Bool} deriving (Show)

instance Semigroup Or where
    (Or a) <> (Or b) = Or (a || b)

instance Monoid Or where
    mempty = Or False
