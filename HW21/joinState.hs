-- joinState.hs

newtype State s a = State { runState :: s -> (a, s) }

joinState :: State s (State s a) -> State s a
joinState st = State $ \s ->
  let (innerSt, s') = runState st s
  in runState innerSt s'