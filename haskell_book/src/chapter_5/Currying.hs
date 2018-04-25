-- Currying.hs
module Currying where
    nonsense :: Bool -> Integer
    nonsense True = 7
    nonsense False = 13

    curriedFunction :: Integer -> Bool -> Integer
    uncurriedFunction :: (Integer, Bool) -> Integer

    curriedFunction a b = a + (nonsense b)
    uncurriedFunction (a, b) = a + (nonsense b)

    anonymous :: Integer -> Bool -> Integer
    anonymous = \i b -> i + (nonsense b)

    anonNested :: Integer -> Bool -> Integer
    anonNested = \i -> \b -> i + (nonsense b)
