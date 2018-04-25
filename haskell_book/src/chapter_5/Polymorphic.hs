-- Polymorphic.hs
module Polymorphic where
    -- https://stackoverflow.com/a/12904380/7092954
    constrained :: Num a => a -> a
    constrained a = a + 1

    parametric a = a + 1

    other a = a

    -- Only works with Strings, righ? NO!
    --      plusplus "Hello, " "World"
    --      plusplus [1, 2] [3, 4]
    plusplus a b = a ++ b
