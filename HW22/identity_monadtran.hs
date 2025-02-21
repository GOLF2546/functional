-- identity_monadtran.hs

import Control.Monad.Trans.Class

newtype IdentityT m a = IdentityT { runIdentityT :: m a}

instance MonadTrans IdentityT where
    lift = IdentityT

instance Functor m => Functor (IdentityT m) where
    fmap f = IdentityT . fmap f . runIdentityT

instance Monad m => Applicative (IdentityT m) where
    pure = lift . pure
    (IdentityT mf) <*> (IdentityT mx) = IdentityT $ mf <*> mx

instance Monad m => Monad (IdentityT m) where
    (IdentityT mx) >>= f = IdentityT $ mx >>= runIdentityT . f