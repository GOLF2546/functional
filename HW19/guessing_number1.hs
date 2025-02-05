-- guessing_number1.hs

check :: Int -> Int -> IO ()
check guessing number = 
    if guessing == number
    then putStrLn "Correct!"
    else guess number

guess :: Int -> IO ()
guess number = do  
    putStr "Enter guessing number: "
    guessing <- getLine
    check (read guessing) number

main :: IO ()
main = do
    putStr "Enter the number: "
    number <- getLine
    guess (read number)