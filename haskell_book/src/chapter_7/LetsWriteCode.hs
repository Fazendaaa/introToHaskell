-- LetsWriteCode.hs
module LetsWriteCode where
    tensDigit :: Integral a => a -> a
    tensDigit x = snd (divMod x 10)
    -- I didn't understand what they mean to do in the 'c' part of this exercise

    foldBoolCase :: a -> a -> Bool -> a
    foldBoolCase a _ _ = a
    foldBoolCase _ b _ = b

    foldBoolGuard :: a -> a -> Bool -> a
    foldBoolGuard a b c = 
        | True  == c     = a
        | False == c     = b

    g :: (a -> b) -> (a, c) -> (b, c)
    g (\-> a -> b) (a, c) = (b, c)
