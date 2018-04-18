-- BuildingFunctions.hs
module BuildingFunctions where
    curry1 :: String -> String
    curry1 input = (++) input "!"

    curry2 :: String -> String
    curry2 input = (input !! 4) : ""

    curry3 :: String -> String
    curry3 input = drop 9 input

    thirdLetter :: String -> Char
    thirdLetter input = input !! 2

    letterIndex :: Int -> Char
    letterIndex postion = input !! postion where
                          input = "Curry is awesome!"

    rvrs :: String -> String
    rvrs input = start ++ middle ++ end where
                 start :: String
                 start = drop 9 input
                 middle :: String
                 middle = (drop 5 (take 9 input))
                 end :: String
                 end = (take 5 input)
