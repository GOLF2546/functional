-- function_from_type.hs

-- (a -> b -> c) -> (a -> b) -> a -> c

newtype Void = Void Void
absurd :: Void -> a
absurd (Void x) = absurd x


function1 :: (a -> b -> c) -> (a -> b) -> a -> c
function1 f g x = f x (g x)

-- Proposition (a => b => c) => (a => b) => a => c
-- rewrite a => (b => c)
-- Since we have a => (b => c), a => b , a as assumptions.
-- use a in a => b to get b hence b holds.
-- use a in a => (b => c) tp get b => c hence b => c holds.
-- use b in b => c to get c holds.
-- hence (a => b => c) => (a => b) => a => c is hold.

function2 :: (a, b) -> Either a b
function2 (a, _) = Left a

-- Proposition a ^ b => a | b  
-- we know a ^ b that means we know a is hold and b is hold.
-- since we can a | _ is hold or _ | b is hold.
-- hence a ^ b => a | b is hold.

function3 :: (a -> b, a) -> b
function3 (f, x) = f x

-- Proposition (a => b) ^ a => b
-- we know (a => b), a as assumptions.
-- we use a in a => b that means b is hold.
-- hence (a => b, a) => b is hold.

function4 :: Either (a -> Void) b -> a -> b
function4 (Right b) _ = b
function4 (Left f) a = absurd (f a)

-- Proposition (a => Void) | b => a => b
-- we know (a => Void) | b and a as assumptions.
-- Void is falsity so we can rewrite to (a => False) | b and a as assumptions.
-- we use a in a => False to get False.
-- since False | b is true that means b is hold.
-- hence (a => Void) | b => a => b is hold.