-- calcThaiIdChecksum.hs

-- let result = zipWith (*) list1 list2

calcThaiIdChecksum :: Integral a => [a] -> a
calcThaiIdChecksum personalID = 11 - (sum (zipWith (*) [13,12..2] personalID)) `mod` 11

calcThaiIdChecksum' :: Integral a => [a] -> a
-- calcThaiIdChecksum personalID = 11 - (sum (zipWith (*) [13,12..2] personalID)) `mod` 11
-- calcThaiIdChecksum personalID = 11 - (`mod` 11) . (sum (zipWith (*) [13,12,..2] personalID))
-- calcThaiIdChecksum personalID = (11 -) . (`mod` 11) . sum . (zipWith (*)) [13,12,..2] personalID
calcThaiIdChecksum' = (11 -) . (`mod` 11) . sum . (zipWith (*)) [13,12..2]