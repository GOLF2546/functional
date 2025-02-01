-- pairBind.hs

pairBind :: Monoid r => (r, a) -> (a -> (r, b)) -> (r, b)
pairBind (r1, x) f = (r1 <> r2, y)
    where (r2, y) = f x

-- what do we need to know about r?
-- type r ต้องเป็น Instance ของ Monoid (ระบุโดยข้อจำกัด Monoid r =>) ซึ่งหมายความว่า:

-- จะต้องมี associative binary operation (<>)
-- จะต้องมี identity element (mempty)
-- จะต้องเป็นไปตามกฎหมาย monoid:

    -- mempty <> x = x
    -- x <> mempty = x
    -- (x <> y) <> z = x <> (y <> z)

-- ฟังก์ชันนี้รวมค่า r สองค่า (r1 และ r2) โดยใช้การดำเนินการแบบ monoid <> โดยที่:
-- r1 มาจากคู่อินพุต
-- r2 มาจากการใช้ฟังก์ชัน f