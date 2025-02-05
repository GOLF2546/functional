-- guessing_number2.hs

checkCount :: Int -> IO Bool
checkCount count = 
    if count == 0
    then do
        putStrLn "Game over! No more guesses left."
        return False
    else return True

check :: Int -> Int -> Int -> IO ()
check guessing number count =
    if guessing == number
    then putStrLn "Correct!"
    else guess number (count - 1)

guess :: Int -> Int -> IO ()
guess number count = do
    shouldContinue <- checkCount count
    if shouldContinue
    then do
        putStr "Enter guessing number: "
        guessing <- getLine
        check (read guessing) number count
    else return ()

main :: IO ()
main = do
    putStr "Enter the number: "
    number <- getLine
    putStr "Enter the limit number of guesses: "
    count <- getLine
    guess (read number) (read count)