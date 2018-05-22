-- Filtering.hs
module Filtering where
    divisibleByThree :: [Integer]
    divisibleByThree = filter (\x -> (0 :: Integer) == mod x 3) [1..30]

    howManyDivisibleByThree :: Int
    howManyDivisibleByThree = length $ filter (\x -> (0 :: Integer) == mod x 3) [1..30]

    myFilter :: String -> [String]
    myFilter x = filter (\x -> not $ elem x ["the", "a", "an"] ) $ words x
