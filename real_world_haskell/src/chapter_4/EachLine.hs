firstWords :: [String] -> [String]
firstWords [] = []
firstWords (x:xs)
    | (/=) [] x = (head . words) x : firstWords xs
    | otherwise = firstWords xs

main :: IO()
main = do
    input <- readFile "gpl-3.0.txt"
    let allLines = lines input
    print $ firstWords allLines