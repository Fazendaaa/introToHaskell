-- ZippingExercises.hs
module ZippingExercises where
    myZip :: [a] -> [b] -> [(a, b)]
    myZip _ [] = []
    myZip [] _ = []
    myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

    myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
    myZipWith _ _ [] = []
    myZipWith _ [] _ = []
    myZipWith func (x:xs) (y:ys) = func x y : myZipWith func xs ys

    myNewZip :: [a] -> [b] -> [(a, b)]
    myNewZip xs ys = myZipWith (,) xs ys
