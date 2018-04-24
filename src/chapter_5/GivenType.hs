-- GivenType.hs
module GivenType where
    i :: a -> a
    i a = a

    c :: a -> b -> a
    c a b = a

    -- C and C'' are aplha equivalence.
    c'' :: b -> a -> b
    c'' a b = a

    c' :: a -> b -> b
    c' a b = b

    r :: [a] -> [a]
    r a = a
    r a = take 2 a
    r a = drop 3 a

    co :: (b -> c) -> (a -> b) -> a -> c
    co bToC aToB a = (bToC (aToB a))

    a :: (a -> c) -> a -> a
    a aToC a = a

    a' :: (a -> b) -> a -> b
    a' aToB a = aToB a
