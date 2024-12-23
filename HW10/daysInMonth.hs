-- daysInMonth.hs

data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving (Show)
 
daysInMonth :: Month -> Int
daysInMonth January     = 31
daysInMonth February    = 28
daysInMonth March       = 31
daysInMonth April       = 30
daysInMonth May         = 31
daysInMonth June        = 30
daysInMonth July        = 31
daysInMonth August      = 31
daysInMonth September   = 30
daysInMonth October     = 31
daysInMonth November    = 30
daysInMonth December    = 31

nextMonth :: Month -> Month
nextMonth January     = February
nextMonth February    = March
nextMonth March       = April
nextMonth April       = May
nextMonth May         = June
nextMonth June        = July
nextMonth July        = August
nextMonth August      = September
nextMonth September   = October
nextMonth October     = November
nextMonth November    = December
nextMonth December    = January

nextDay :: Integer -> Month -> (Integer, Month)
nextDay d m = if d < toInteger (daysInMonth m) then (d + 1, m) else (1, nextMonth m)