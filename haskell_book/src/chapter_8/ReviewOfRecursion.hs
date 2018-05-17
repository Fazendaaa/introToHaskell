-- ReviewOfRecursion.hs
module ReviewOfRecursion where
    divideBy :: Integral a => a -> a -> (a,a)
    divideBy x y = go x y 0 where
        go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

    sumUpTilN :: (Eq a, Num a) => a -> a
    sumUpTilN 1 = 1
    sumUpTilN n = n + sumUpTilN (n-1)

    multplyRecursive :: Integral a => a -> a -> a
    multplyRecursive 0 _ = 0    
    multplyRecursive 1 n = n
    -- if-then-else would be too extensive
    multplyRecursive x y
        | x < 0 = negate (y + multplyRecursive ((negate x) - 1) y)
        | otherwise = y + multplyRecursive (x - 1) y
    
    newDivideBy :: Integral a => a -> a -> (a,a)
    newDivideBy x y = go x y 0 where
        go n d count
            | 0 == d = error "You should not divide by zero."
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1) 
