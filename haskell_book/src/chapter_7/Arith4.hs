-- Arith4.hs
module Arith4 where
    roundTrip :: (Show a, Read a) => a -> a
    roundTrip = read . show

    anotherRoundTrip :: (Show a, Read b) => a -> b
    anotherRoundTrip = read . show

    main :: IO()
    main = do
        print (id 4)
        print (roundTrip 4)
        print (anotherRoundTrip 4 :: Int)
