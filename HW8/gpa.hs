-- gpa.hs

{-|
Maps a letter grade to its grade-point value. 

Valid grades are:

- "A" : 4.0
- "B+": 3.5
- "B" : 3.0
- "C+": 2.5
- "C" : 2.0
- "D+": 1.5
- "D" : 1.0
- "F" : 0.0
- "W" : 0.0

Invalid grades also return 0.0.
-}
gradeToDouble :: String -> Float
gradeToDouble "A"  = 4.0
gradeToDouble "B+" = 3.5
gradeToDouble "B"  = 3.0
gradeToDouble "C+" = 2.5
gradeToDouble "C"  = 2.0
gradeToDouble "D+" = 1.5
gradeToDouble "D"  = 1.0
gradeToDouble "F"  = 0.0
gradeToDouble "W"  = 0.0
gradeToDouble  _   = 0.0

{-|
Summation grades point from list of letter to float value. 

Example:
>>> sumGrade ["A", "B+", "B", "C+", "C", "D+", "D", "F", "W"]
>>> 17.5
-}
sumGrade :: [String] -> Float
sumGrade [] = 0.0
sumGrade (x:xs) = (gradeToDouble x + sumGrade xs) 

{-|
Summation grades credit from list of letter if it is valid grade will add 1.0 else 0. 

Example:
>>> sumGrade ["A", "B+", "B", "C+", "C", "D+", "D", "F", "W"]
>>> 8.0
-}
gradeToCredit :: [String] -> Float
gradeToCredit [] = 0.0
gradeToCredit (y:ys) = sum [1.0 | x <- (y:ys), x == "A" || x == "B+" || x == "B" || x == "C+" || x == "C" || x == "D+" || x == "D" || x == "F"]

{-|
GPA from list of letter.

Example:
>>> gpa ["A", "B+", "B", "C+", "C", "D+", "D", "F", "W"]
>>> 2.1875
-}
gpa :: [String] -> Float
gpa []   = 0.0
gpa (x:xs) = sumGrade (x:xs) /gradeToCredit(x:xs)