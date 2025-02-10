-- guessing_NumberV3.hs

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

runGame :: Int -> Int -> Int -> (Int -> Bool) -> IO ()
runGame num lim count cont = do
    guess <- readNumber "Guess"
    let v = verdict num guess
    case v of
        Right m -> do
            putStrLn m
        Left m -> do
            putStrLn m
            if cont count
                then runGame num lim (count+1) cont
                else putStrLn "Game over"

randomGame :: IO ()
randomGame = do
    gen <- newStdGen
    let target = fst $ uniform gen
    putStrLn $ "I've picked a number. Try to guess it! " ++ show target
    lim <- readNumber "Guess limit"
    runGame target lim 0 (<(lim-1))