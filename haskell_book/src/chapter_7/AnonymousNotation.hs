-- AnonymousNotation.hs
module AnonymousNotation where
    addOneIfOdd :: Integer -> Integer
    addOneIfOdd n = case odd n of
        True -> f n
        False -> n
        where f = (\x -> x + 1)

    addFive :: Integer -> Integer -> Integer
    addFive = \x -> \y -> ((+) (if x > y then y else x) 5)

    mflip f x y = f x y -- Recursion?
