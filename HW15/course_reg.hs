-- course_reg.hs

-- course registration code is wrong
-- find a bug (give a test case), and give a fix

type CourseID = Int

type Capacity = Int

type StudentID = Int

data CourseInfo = Course CourseID Capacity [StudentID] deriving (Show)

enroll' :: CourseInfo -> StudentID -> Either String CourseInfo
enroll' (Course cid cap rs) sid
  | sid `elem` rs =
      Left "student already registered"
  | length rs >= cap =
      Left "course full"
  | otherwise =
      Right $ Course cid cap (sid : rs)

register' :: [CourseInfo] -> CourseID -> StudentID -> Either String [CourseInfo]
register' [] _ _ = Left "no such course"
register' (c@(Course cid _ _) : cs) cid' sid
  | cid == cid' =
      case enroll' c sid of
        Left msg -> Left msg
        Right c' -> Right (c' : cs)
  | otherwise =
      case register' cs cid' sid of
        Left msg -> Left msg
        Right cs' -> Right (c : cs')

reg :: [CourseInfo]
reg = [Course 261216 100 [600610717], Course 261218 90 [600610738, 600610747], Course 261409 70 [600610754, 600610777, 600610783], Course 261406 2 [600610752, 600610764]]

-- | otherwise = register' cs cid' sid
-- Bug เนื่องจากหากลงทะเบียนวิชาที่ลำดับที่ n ในรายการวิชา แล้ววิชาที่ลำดับที่ n-1 ไม่มี จะทำให้เกิด Bug
-- Test Case จากโค้ดตอนแรก หากใช้
--  register' reg 261409 650610796
-- ผลลัพธ์ จะได้ Right [Course 261409 70[600610754, 600610777, 600610783, 650610796], Course 261406 2 [600610752, 600610764]]
-- Fix
-- | otherwise =
--  case register' cs cid' sid of
--     Left msg -> Left msg
--     Right cs' -> Right (c : cs')
-- หากลงทะเบียนไม่สำเร็จ ให้ส่ง message error เหมือนเดิมแต่ถ้าลงทะเบียนสำเร็จก็ควรจะคืนค่า course ก่อนหน้า course ที่จะลงทะเบียนลงไปด้วย