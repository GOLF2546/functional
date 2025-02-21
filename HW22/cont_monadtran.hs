-- cont_monadtran.hs
import Control.Monad.Trans.Class

newtype ConT r m a = ConT { runConT :: m (r -> a) }

instance MonadTrans (ConT r) where
    lift = ConT . fmap return

instance Functor m => Functor (ConT r m) where
    fmap f = ConT . fmap (fmap f) . runConT

instance Monad m => Applicative (ConT r m) where
    pure = lift . pure
    (ConT mf) <*> (ConT mx) = ConT $ do
        f <- mf
        x <- mx
        return $ f <*> x

instance Monad m => Monad (ConT r m) where
    mx >>= f = fmap f mx >>= id