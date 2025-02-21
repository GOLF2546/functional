import Data.Char (isUpper, isLower)
newtype EitherT a m b = EitherT { runEitherT :: m (Either a b) }

instance Functor m => Functor (EitherT a m) where
  fmap f (EitherT x) = EitherT (fmap (fmap f) x)

instance Applicative m => Applicative (EitherT a m) where
  pure x = EitherT (pure (Right x))
  EitherT f <*> EitherT x = EitherT ((<*>) <$> f <*> x)

instance Monad m => Monad (EitherT a m) where
  return = pure
  EitherT x >>= f = EitherT $ do
    v <- x
    case v of
      Left l -> return (Left l)
      Right r -> runEitherT (f r)

readEmail :: IO (Either String String)
readEmail = do
  putStrLn "Please enter your email!"
  str <- getLine
  if '@' `elem` str && '.' `elem` str
    then return $ Right str
    else return $ Left "Invalid Email format"

readPassword :: IO (Either String String)
readPassword = do
  putStrLn "Please enter your Password!"
  str <- getLine
  if length str < 8 || null (filter isUpper str)
      || null (filter isLower str)
    then return $ Left "Invalid Password format"
    else return $ Right str

readEmail' :: EitherT String IO String
readEmail' = EitherT readEmail

readPassword' :: EitherT String IO String
readPassword' = EitherT readPassword

signup' :: EitherT String IO (String, String)
signup' = do
  email <- readEmail'
  password <- readPassword'
  password2 <- readPassword'
  if password == password2
  then EitherT . return $ Right (email, password)
  else EitherT . return $ Left "Password don't match"

main :: IO ()
main = do
  signupRes <- runEitherT signup'
  case signupRes of
    Left e -> putStrLn $ "Signup failed " ++ e
    Right _ -> putStrLn "Signup success"
