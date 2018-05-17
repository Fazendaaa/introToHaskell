-- WordNumber.hs
module WordNumber where
    -- The book's example is using intersperse but IDK why. I've changed it to intercalate.
    import Data.List (intercalate)

    digitToWord :: Int -> String
    digitToWord n = names !! n where
        names = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    digits :: Int -> [Int]
    digits n = if (div n 10) > 0 then digits (div n 10) ++ [mod n 10] else [n]

    wordNumber :: Int -> String
    wordNumber n = intercalate "-" $ map digitToWord $ digits n 
