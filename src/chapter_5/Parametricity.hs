-- Parametricity.hs
module Parametricity where
    first :: a -> a
    -- HS compiler won't allow it:
    -- first input = input + 1
    first = undefined

    hypothetical1 :: a -> a -> a
    hypothetical1 a = \a -> a

    hypothetical2 :: a -> a -> a
    hypothetical2 a b = a

    implement :: a -> b -> b
    implement = undefined
    -- implement a = \b -> b
    -- implement a b = b
