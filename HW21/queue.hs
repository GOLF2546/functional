-- queue.hs

newtype State s a = State { runState :: s -> (a, s) }

type Queue a = ([a], [a], Int)

size :: State (Queue a) Int
size = State $ \q@(_,_, sz) -> (sz, q)

isEmpty :: State (Queue a) Bool
isEmpty = State $ \q@(_,_, sz) -> 
    if sz == 0
    then (True, q)
    else (False, q)

enqueue :: a -> State (Queue a) ()
enqueue x = State $ \(hd, tl, sz) ->
    ((), (hd, x:tl, sz+1))

dequeue :: State (Queue a) a
dequeue = State $ \(hd, tl, sz) ->
    case hd of
        [] -> 
            case reverse tl of
                [] -> error "Queue is empty"
                (x : xs) -> (x, (xs, [], sz -1))
        x:xs ->
            (x, (xs, tl, sz-1))

mkQueue :: [a] -> State (Queue a) ()
mkQueue ls = State $ \_ -> ((), (ls, [], length ls))

empty :: State (Queue a) ()
empty = State $ \_ -> ((), ([], [], 0))