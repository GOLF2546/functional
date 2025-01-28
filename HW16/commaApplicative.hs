-- commaApplicative.hs

-- suppose we want to make (,) r an applicative functor
-- that means we need to implement
-- (<*>) :: (r, a -> b) -> (r, a) -> (r, b)
-- r could be any type, for representing labels
-- but now we have two pieces of data containing labels (i.e., (r,a->b) and (r,a)) 
-- how should we implement (<*>) so that the resulting data contain appropriate label?

-- รับ input เป็น pair ของ label และ function ( ที่ใช้สำหรับการแปลง a-> b ) และรับ pair ของ label และ a
-- เอา label ของทั้ง 2 pair มารวม 2 label เป็น label เดียว แล้วใช้ function รับ argument a แล้วค่อย return ออกมาเป็น pair ของ label ใหม่ และ b

-- how should we implement pure so that the initial label makes sense?
-- กำหนดค่า default ให้กับ label แล้วให้ return ค่าเป็น pair ของ label ที่กำหนดไว้และค่า a ที่รับเข้ามา