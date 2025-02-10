-- nRamdomRs.hs

import System.Random (RandomGen, UniformRange, randomR, Random)

nRandomRs :: (RandomGen g, UniformRange a, Random a, Integral n) => (a, a) -> n -> g -> ([a], g)
nRandomRs range n gen = go range n gen []
  where
    go _ 0 gen' acc = (reverse acc, gen')
    go range' n' gen' acc =
        let (val, newGen) = randomR range' gen'
        in go range (n'-1) newGen (val:acc)