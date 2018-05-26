-- Safe.hs
module Safe where
    safeHead :: [a] -> Maybe a
    safeHead [] = Nothing
    safeHead (x:_) = Just x
    
    safeTail :: [a] -> Maybe [a]
    safeTail [] = Nothing
    safeTail (_:xs) = Just xs

    safeLast :: [a] -> Maybe a
    safeLast [] = Nothing
    safeLast (x:[]) = Just x
    safeLast (_:xs) = safeLast xs

    safeInit :: [a] -> Maybe [a]
    safeInit [] = Nothing
    safeInit (_:[]) = Just []
    safeInit (x:xs) = maybe Nothing (Just . (x:)) (safeInit xs)

    splitWith :: (a -> Bool) -> [a] -> [[a]]
    splitWith _ [] = []
    splitWith func xs = splited where
        broken = break func xs
        first = fst broken
        second = snd broken
        secondTailed = if not (null second) then tail second else []
        splited = first : splitWith func secondTailed
