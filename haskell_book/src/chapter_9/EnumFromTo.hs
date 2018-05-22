-- EnumFromTo.hs
module EnumFromTo where
    -- enumFromTo = eft
    eftDefault :: (Ord a, Eq a, Enum a) => a -> a -> [a]
    eftDefault start end
        | start < end = (++) (start : []) $ eftDefault (succ start) end
        | start == end = end : []
        | otherwise = []

    eftBool :: Bool -> Bool -> [Bool]
    eftBool start end = eftDefault start end

    eftOrd :: Ordering -> Ordering -> [Ordering]
    eftOrd start end = eftDefault start end

    eftInt :: Int -> Int -> [Int]
    eftInt start end = eftDefault start end

    eftChar :: Char -> Char -> [Char]
    eftChar start end = eftDefault start end
