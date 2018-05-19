-- Exercises.hs
module Exercises where
    import Data.List (sortBy)

    -- Cons == :
    -- Nil == []
    data List a = Cons a (List a) | Nil deriving (Show)

    -- fromList :: (List a) => a -> [a]

    -- I sincerlly didn't understang quit well what I was supposed to do.
    data Tree a = Maybe a (Tree a) (Tree a) | Nothing
    
    computeSize :: [a] -> Int
    computeSize [] = 0
    computeSize (_:xs) = 1 + computeSize xs

    recursiveSum :: Num a => [a] -> a
    recursiveSum [] = 0
    recursiveSum (x:xs) = x + recursiveSum xs

    calculateMean :: (Integral a) => [a] -> a
    calculateMean xs = div (recursiveSum xs) $ fromIntegral (computeSize xs)

    setBackwards :: [a] -> [a]
    setBackwards [] = []
    setBackwards (x:xs) = setBackwards xs ++ [x]

    palindrofy :: [a] -> [a]
    palindrofy xs = xs ++ setBackwards xs

    isPalindrome :: (Eq a) => [a] -> Bool
    isPalindrome [] = True
    isPalindrome xs | length xs == 1 = True
    isPalindrome (x:xs) = if x == (last xs) then isPalindrome newXs else False where
        newXs = take ((length xs) - 1) xs       

    sortListOfList :: [[a]] -> [[a]]
    sortListOfList xs = sortBy (\as bs -> compare (length as) (length bs)) xs

    joinBySeparator :: Char -> [String] -> String
    joinBySeparator _ [] = ""
    joinBySeparator _ xs | length xs == 1 = xs !! 0
    joinBySeparator separator (x:xs) = (x ++ (separator : "")) ++ joinBySeparator separator xs

    --------------------------------------------------------------------------------------------------------------------

    data Point2D = Point2D {
        x :: Double,
        y :: Double
    } deriving (Show)
    data Direction = ToLeft | ToRight | Straight deriving (Show)
    data Orientation = ClockWise | CounterClockWise | Collinear deriving (Show)

    clockOrientation :: [Point2D] -> Orientation
    clockOrientation points = orientation where
        pointA = points !! 0
        pointB = points !! 1
        pointC = points !! 2
        determinant = (x pointB - x pointA) * (y pointC - y pointA) - (y pointB - y pointA) * (x pointC - x pointA)
        orientation = case compare determinant 0 of
            EQ -> Collinear
            LT -> ClockWise
            GT -> CounterClockWise

    calculateTurn :: [Point2D] -> Direction
    calculateTurn points = case clockOrientation points of
        ClockWise -> ToRight
        CounterClockWise -> ToLeft
        Collinear -> Straight

    listToTurn :: [Point2D] -> [Direction]
    listToTurn points | length points >= 3 = calculateTurn points : [] ++ listToTurn (drop 1 points)
    listToTurn _ = []

    createPoint2D :: (Double, Double) -> Point2D
    createPoint2D (coordinateX, coordinateY) = Point2D { x = coordinateX, y = coordinateY }

    comparePoints2DByAngle :: Point2D -> Point2D -> Ordering
    comparePoints2D pointA pointB = case compare (y pointA) (y pointB) of
        LT -> LT
        GT -> GT
        EQ -> compare (x pointA) (x pointB)

    convexHull :: [Point2D] -> Integer -> [Direction]
    convexHull points = go points 1 where
        go newPoints count
            | count > 1 = go points (count - 1)
            | [] == newPoints = []
            | otherwise = []

    -- https://en.wikipedia.org/wiki/Graham_scan
    grahamScan :: [Point2D] -> [Direction]
    grahamScan points = turned where
        sorted = sortBy comparePoints2DByAngle points
        turned = listToTurn sorted

    -- I'm kind on a deadlock in this exercise, some day I will come back to it.
    main :: IO()
    main = print(grahamed) where
        -- https://en.wikipedia.org/wiki/Convex_hull#/media/File:Convex_hull.png
        xCoordinates = [0.0, 1.0, 2.0, 3.0, 4.0, 0.0, 1.0, 2.0, 3.0, 1.0, 2.0]
        yCoordinates = [0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0]
        coordinates = zip xCoordinates yCoordinates
        points = map createPoint2D coordinates
        grahamed = grahamScan points
