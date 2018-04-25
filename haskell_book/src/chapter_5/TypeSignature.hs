-- TypeSignature.hs
module TypeSignature where
    functionH :: [Char] -> Char
    functionH (x:_) = x

    functionC :: Ord a => a -> a -> Bool
    functionC x y = if (x > y) then True else False

    functionS :: (a, b) -> b 
    functionS (x, y) = y
