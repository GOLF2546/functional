-- either_monadtran.hs

import Control.Monad.Trans.Class

newtype EitherT a m b = EitherT { runEitherT :: m (Either a b) }

instance MonadTrans (EitherT a) where
    lift = EitherT . fmap return

instance Functor m => Functor (EitherT a m) where
    fmap f = EitherT . fmap (fmap f) . runEitherT

instance Monad m => Applicative (EitherT a m) where
    pure = lift . pure
    (EitherT mf) <*> (EitherT mx) = EitherT $ do
        f <- mf
        x <- mx
        return $ f <*> x 

instance (Monad m) => Monad (EitherT a m) where
    EitherT ma >>= f = EitherT $ do
        either_value <- ma
        case either_value of
            Left l -> return (Left l)
            Right r -> runEitherT (f r)