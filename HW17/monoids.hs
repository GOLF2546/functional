-- monoids.hs
data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show)

insert :: Ord a => a -> Tree a -> Tree a
insert x Empty = Node Empty x  Empty
insert x (Node l y r)
    | x < y     = Node (insert x l) y r
    | x > y     = Node l y (insert x r)
    | otherwise = Node l y r

instance Ord a => Semigroup (Tree a) where
    (<>) Empty t = t
    (<>) t Empty = t
    (<>) (Node l x r) t = insert x (l <> (r <> t))

instance Ord a => Monoid (Tree a) where
    mempty = Empty

{-
Semigroup Law:
Associativity: (a <> b) <> c = a <> (b <> c)

Monoid Laws:
1. Identity:
   - Left:  mempty <> t = t
   - Right: t <> mempty = t
   
2. Associativity: (inherited from Semigroup)
   All hold because insert maintains BST properties
   and the order of insertions leads to equivalent searchable trees
-}

newtype Composition a = Composition { getCompose :: a -> a}
instance Semigroup (Composition a) where
    Composition a <> Composition b = Composition (a . b)
instance Monoid (Composition a) where
    mempty = Composition id 

{-
Semigroup Law:
Associativity: (a <> b) <> c = a <> (b <> c)

Monoid Laws:
1. Identity:
   - Left:  mempty <> t = t
   - Right: t <> mempty = t
     
2. Associativity: (inherited from Semigroup)  
   All hold because composition function is inherently associative.
   The composition of functions is associative, meaning:
     (f . g) . h = f . (g . h)
   Therefore, the associativity law is satisfied for Composition as well.
-}

newtype Max a = Max { getMax :: a } deriving (Show)

instance Ord a => Semigroup (Max a) where
    Max a <> Max b = Max (max a b)

instance (Ord a, Bounded a) => Monoid (Max a) where
    mempty = Max (minBound :: a)
{- 
Semigroup Law:
Associativity: (a <> b) <> c = a <> (b <> c)

Monoid Laws:
1. Identity:
   - Left:  mempty <> t = t
   - Right: t <> mempty = t

2. Associativity: (inherited from Semigroup)
   All hold because the `max` function is inherently associative.
   The `max` function satisfies the associativity law, meaning:
     max (max a b) c = max a (max b c)
   Therefore, the associativity law is satisfied for `Max` as well.
-}