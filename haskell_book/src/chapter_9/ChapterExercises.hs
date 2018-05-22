-- ChapterExercises.hs
module ChapterExercises where
    import Data.Char

    arrayIsUpper :: String -> String
    arrayIsUpper xs = filter isUpper xs

    capitalize :: String -> String
    capitalize (x:xs) = toUpper x : xs
    
    capitalizeAll :: String -> String
    capitalizeAll [] = []
    capitalizeAll (x:xs) = toUpper x : capitalizeAll xs

    -- I'm only using head because the exercise says so.
    onlyHeadCapitalized :: String -> Char
    onlyHeadCapitalized input = toUpper $ head input

    onlyHeadCapitalizedPointFree :: String -> Char
    onlyHeadCapitalizedPointFree = toUpper . head

    ----------------------------------------------------------------------------

    myOr :: [Bool] -> Bool
    myOr [] = True
    myOr (x:xs) = x || myOr xs

    myAny :: (a -> Bool) -> [a] -> Bool
    myAny _ [] = True
    myAny func (x:xs) = (func x) || myAny func xs

    myElem :: Eq a => a -> [a] -> Bool
    myElem _ [] = False
    myElem var (x:xs) = var == x || myElem var xs

    myReverse :: [a] -> [a]
    myReverse [] = []
    myReverse (x:xs) = (++) (myReverse xs) (x : [])

    ----------------------------------------------------------------------------

    squish :: [[a]] -> [a]
    squish [] = []
    squish (x:xs) = (++) x (squish xs) 

    squishMap :: (a -> [b]) -> [a] -> [b]
    squishMap _ [] = []
    squishMap func (x:xs) = (++) (func x) (squishMap func xs) 

    squishAgain :: [[a]] -> [a]
    squishAgain xs = squishMap id xs

    ----------------------------------------------------------------------------
    
    myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
    myMaximumBy _ (x:[]) = x
    myMaximumBy func (x:xs) = newMaximum where
        toCompare = myMaximumBy func xs
        newMaximum = case func x toCompare of
            LT -> toCompare
            EQ -> x
            GT -> x

    myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
    myMinimumBy _ (x:[]) = x
    myMinimumBy func (x:xs) = newMinimum where
        toCompare = myMinimumBy func xs
        newMinimum = case func x toCompare of
            LT -> x
            EQ -> x
            GT -> toCompare

    myMaximum :: (Ord a) => [a] -> a
    myMaximum (x:[]) = x
    myMaximum (x:xs) = newMaximum where
        toCompare = myMaximum xs
        newMaximum = case compare x toCompare of
            LT -> toCompare
            EQ -> x
            GT -> x

    myMinimum :: (Ord a) => [a] -> a
    myMinimum (x:[]) = x
    myMinimum (x:xs) = newMinimum where
        toCompare = myMinimum xs
        newMinimum = case compare x toCompare of
            LT -> x
            EQ -> x
            GT -> toCompare
