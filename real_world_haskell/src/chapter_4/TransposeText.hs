-- The following link helped me a lot to understand what I was supposed to do, unfortunatelly also had the answer
-- https://www.beyondtechnicallycorrect.com/2012/03/21/beautiful-haskell-transposing-a-list/
tranpose :: String -> String
tranpose = (unlines . extremes . lines) where
    extremes :: [String] -> [String]
    extremes xs
        | not (any null xs) = map head xs : extremes (map tail xs)
        | otherwise = []


main :: IO()
main = do
    -- input <- readFile "gpl-3.0.txt"
    let input = "hello\nworld\n"
    print $ tranpose input
