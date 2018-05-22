-- ThyFearfulSymmetry.hs
module ThyFearfulSymmetry where
    -- Discusting? "I know" -- SOLO, Han
    myWords :: String -> [String]
    myWords "" = []
    myWords xs = (:) (takeWhile (/= ' ') xs) $ myWords $ drop 1 $ dropWhile (/= ' ') xs

    newMyWords :: String -> Char -> [String]
    newMyWords "" _ = []
    newMyWords xs split = (:) phrase recursion where
        phrase = (takeWhile (/= split) xs)
        recursion = newMyWords (drop 1 $ dropWhile (/= split) xs) split
