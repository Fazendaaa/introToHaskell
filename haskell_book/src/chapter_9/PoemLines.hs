-- PoemLines.hs
module PoemLines where
    firstSen = "Tyger Tyger, burning bright\n"
    secondSen = "Int the forests of the night\n"
    thirdSen = "What immortal hand or eye\n"
    fourthSen = "could frame thy fearful symmeytry?"
    sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

    myLines :: String -> [String]
    myLines "" = []
    myLines input = (:) phrase $ recursion where
        recursion = myLines $ drop 1 $ dropWhile (/= '\n') input
        wihtOutNewLine = takeWhile (/= '\n') input
        -- This could seen a little bit tricky, but try it on paper.
        phrase = if [] == recursion then wihtOutNewLine else wihtOutNewLine ++ "\n"

    newMyLines :: String -> Char -> [String]
    newMyLines "" _ = []
    newMyLines input split = (:) phrase $ recursion where
        recursion = myLines $ drop 1 $ dropWhile (/= split) input
        wihtOutNewLine = takeWhile (/= split) input
        phrase = if [] == recursion then wihtOutNewLine else wihtOutNewLine ++ (split : [])

    shouldEqual = 
        ["Tyger Tyger, burning bright\n",
        "Int the forests of the night\n",
        "What immortal hand or eye\n",
        "could frame thy fearful symmeytry?"]

    main :: IO()
    main = print $ "Are they equal? " ++ show ((myLines sentences) == shouldEqual)
    -- main = print $ "Are they equal? " ++ show ((newMyLines sentences '\n') == shouldEqual)
