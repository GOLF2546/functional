-- guessing_NumberV4.hs

import Text.Read
import System.Random

verdict :: Int -> Int -> Either String String
verdict target guess = do
    case compare guess target of
        EQ -> Right "You win!"
        LT -> Left "Too low"
        GT -> Left "Too high"

readTarget :: IO Int
readTarget = do
    readNumber "Target number"

readNumber :: String -> IO Int
readNumber msg = do
    putStr $ msg ++ ": "
    line <- getLine
    case readEither line :: Either String Int of
        Left e -> do
            putStrLn e
            readNumber msg
        Right n -> return n

rangeForGuess :: Int -> Int -> (Int, Int)
rangeForGuess minVal maxVal = (minVal, maxVal)

isInRange :: Int -> (Int, Int) -> Bool
isInRange guess (minVal, maxVal) = guess > minVal && guess < maxVal

runGame :: Int -> Int -> Int -> (Int -> Bool) -> (Int, Int) -> IO ()
runGame num lim count cont range = do
    putStrLn $ "Guess in this range " ++ show (fst range) ++ " to " ++ show (snd range) ++ " and now you have " ++ show (lim - count) ++ " chance."
    guess <- readNumber "Guess"
    if not (isInRange guess range)
        then do
            putStrLn $ "Not in range! Please guess between " ++ show (fst range) ++ " and " ++ show (snd range)
            runGame num lim count cont range
        else do
            let v = verdict num guess
            case v of
                Right m -> do
                    putStrLn m
                Left m -> do
                    putStrLn m
                    let newRange = case m of
                            "Too high" -> rangeForGuess (fst range) guess
                            "Too low" -> rangeForGuess guess (snd range)
                            _ -> range
                    if cont count
                        then runGame num lim (count+1) cont newRange
                        else putStrLn "Game over"

random_withRangeGame :: IO ()
random_withRangeGame = do
    gen <- newStdGen
    let target = fst $ uniform gen
        initialRange = rangeForGuess minBound maxBound
    putStrLn $ "I've picked a number. Try to guess it! " ++ show target
    lim <- readNumber "Guess limit"
    runGame target lim 0 (<(lim-1)) initialRange