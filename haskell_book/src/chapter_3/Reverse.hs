-- Reverse.hs
module Reverse where
    rvrs :: String -> String
    rvrs input = start ++ middle ++ end where
                 start :: String
                 start = drop 9 input
                 middle :: String
                 middle = (drop 5 (take 9 input))
                 end :: String
                 end = (take 5 input)

    main :: IO()
    main = print $ rvrs "Curry is awesome"
