import Text.Read
import System.Random
import Control.Monad.Reader
import Control.Monad.Writer()

type GameConfig = (Int, Int, Int)
type GuessHistory = [Int]
type GameState = (GameConfig, (Int, Int))

data GameResult = Victory | TooHigh | TooLow | OutOfRange | GameOver
    deriving (Show, Eq)

isInRange :: Int -> (Int, Int) -> Bool
isInRange guess (minVal, maxVal) = guess >= minVal && guess <= maxVal

evaluateGuess :: Int -> Reader GameState GameResult
evaluateGuess guess = do
    ((target, limit, count), (minVal, maxVal)) <- ask
    return $ if not (isInRange guess (minVal, maxVal))
        then OutOfRange
        else if count == limit 
            then case compare guess target of
                EQ -> Victory
                _ -> GameOver
            else case compare guess target of
                EQ -> Victory
                GT -> TooHigh
                LT -> TooLow

updateRange :: Int -> GameResult -> (Int, Int) -> (Int, Int)
updateRange guess result (minVal, maxVal) = case result of
    TooHigh -> (minVal, guess)
    TooLow -> (guess, maxVal)
    _ -> (minVal, maxVal)

processGuess :: Int -> Reader GameState (GameResult, (Int, Int))
processGuess guess = do
    state@((_, _, _), range) <- ask
    let result = runReader (evaluateGuess guess) state
        newRange = updateRange guess result range
    return (result, newRange)

readGuess :: String -> IO Int
readGuess msg = do
    putStr $ msg ++ ": "
    line <- getLine
    case readEither line :: Either String Int of
        Left e -> do
            putStrLn e
            readGuess msg
        Right n -> return n

playGame :: GameState -> IO GuessHistory
playGame gameState@((target, limit, count), range) = do
    let (minVal, maxVal) = range
    putStrLn $ "Guess in range " ++ show minVal ++ " to " ++ show maxVal ++ " And count is: " ++ show (count) 
        ++ " (" ++ show (limit - count + 1) ++ " chances left)"
    
    guess <- readGuess "Guess"
    let (result, newRange) = runReader (processGuess guess) gameState
    
    case result of
        Victory -> do
            putStrLn "You win!"
            return [guess]
        GameOver -> do
            putStrLn "Game over!"
            return [guess]
        OutOfRange -> do
            putStrLn $ "Not in range! Please guess between " ++ show minVal ++ " and " ++ show maxVal
            restGuesses <- playGame gameState
            return (guess : restGuesses)
        TooHigh -> do
            putStrLn "Too high"
            restGuesses <- playGame ((target, limit, count + 1), newRange)
            return (guess : restGuesses)
        TooLow -> do
            putStrLn "Too low"
            restGuesses <- playGame ((target, limit, count + 1), newRange)
            return (guess : restGuesses)

main :: IO ()
main = do
    gen <- newStdGen
    let target = fst $ randomR (1, 100) gen
        initialRange = (0, 101)
    putStrLn $ "I've picked a number. Try to guess it!"
    limit <- readGuess "Guess limit"
    guesses <- playGame ((target, limit, 1), initialRange)
    putStrLn $ "Game over! Your guesses were: " ++ show (guesses) ++ " And the result was: " ++ show (target)