-- ChapterExercises.hs
module ChapterExercises where
    -- I've choose to not return tuples since it's more easy to see returing strings.

    stops :: String
    stops = "pbtdkg"
    vowels :: String
    vowels = "aeiou"

    -- https://rosettacode.org/wiki/Combinations#Haskell
    comb :: Int -> [a] -> [[a]]
    comb 0 _      = [[]]
    comb _ []     = []
    comb m (x:xs) = (++) (map (x:) (comb (m-1) xs)) (comb m xs)

    combination :: String -> String -> [[Char]]
    combination first second = comb 3 ((++) first ((++) second first))

    filteredCombination :: String -> String -> [[Char]]
    filteredCombination first second = filter (\str -> (==) "ap" (take 2 str)) $ combination first second

    stopVowlStop :: [[Char]]
    stopVowlStop = combination stops vowels

    stopVowlStopFiltered :: [[Char]]
    stopVowlStopFiltered = filteredCombination stops vowels

    nouns :: [String]
    nouns = ["cat", "sock", "ship", "hero"]

    verbs :: [String]
    verbs = ["ask", "be", "become", "begin"]

    nounVerbCombination :: [String] -> [String] -> [[String]]
    nounVerbCombination first second = comb 3 ((++) first ((++) second first))

    nounVerb :: [[String]]
    nounVerb = nounVerbCombination nouns verbs

    seekritFunc :: Fractional a => String -> a
    seekritFunc x = (/) added size where
        each = words x
        added = fromIntegral $ sum $ map length each
        size = fromIntegral $ length each
