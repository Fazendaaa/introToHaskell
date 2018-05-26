-- Fold.hs
module Fold where
    import Data.List
    import Data.Char

    asInt_fold :: String -> Int
    asInt_fold ('-':xs) = negate (asInt_fold xs)
    asInt_fold xs = foldl' (\a b -> (+) ((*) a 10) (digitToInt b)) 0 xs

    -- I had a little bit of an issue thinking in how to do it the other ones, checked up other people answers and them
    -- realized that would be copying and pasting doing it "my version" of it. Maybe try it later after learn more things

    myConcat :: [[a]] -> [a]
    myConcat xs = foldr (++) [] xs

    -- myGroupBy (==) [1, 2, 3, 3, 4, 5] == [[1],[2],[3,3],[4],[5,5]]
    myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
    myGroupBy func xs = foldr comp [] xs where
        comp a b = if null (filter (\x -> func a x) decapitated) then (:) [a] b else equals where
            decapitated = if null b then ((:) a []) else head b
            tailed = if null b then [] else tail b
            newHead = (:) a decapitated
            equals = (:) newHead tailed

    --------------------------------------------------------------------------------------------------------------------

    myAny :: (a -> Bool) -> [a] -> Bool
    myAny func xs = foldl' comp False xs where
        comp a b = if (==) False a then func b else a

    myCycle :: [a] -> [a]
    myCycle xs = (++) (foldr (:) [] xs) (myCycle xs)

    mySplitStringBy :: (Char -> Bool) -> String -> [String]
    mySplitStringBy func xs = foldr comp [""] xs where
        comp a b = if func a then (:) ((:) a (head b)) (tail b) else "" : b

    myWords :: String -> [String]
    myWords xs = mySplitStringBy (\x-> (/= ' ') x) xs

    -- Could be better? Yes, but I gave it a try.
    myLines :: String -> [String]
    myLines xs = filter (\x -> (/=) "" x) $ mySplitStringBy (\x-> (/= '\n') x) xs

    myUnlines :: [String] -> String
    myUnlines xs = foldr join "" xs where
        join a b = (++) ((++) a "\n") b
