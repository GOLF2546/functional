-- dblNeg.hs
newtype Void = Void Void

absurd :: Void -> a
absurd (Void x) = absurd x

dblNeg :: Either a (a -> Void) -> ((a -> Void) -> Void) -> a
dblNeg (Left x) _ = x
dblNeg (Right f) g = absurd (g (f))