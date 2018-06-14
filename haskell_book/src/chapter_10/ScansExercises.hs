-- ScansExercises.hs
module ScansExercises where
    import Data.List

    -- This exercises I felt missing some functions call to understand exaclty HOW is to be implemented. The WHAT they
    -- want I understod, the problem was how.

    fibs :: Integral a => Int -> [a]
    fibs nth = take nth $ (:) 1 $ scanl' (+) 1 (fibs (nth - 1))

    fibsLimit :: Int -> [Int]
    fibsLimit limit = 1 : takeWhile (< limit) (scanl' (+) 1 (fibsLimit ((-) limit 1)))

    fact ::  Int -> [Int]
    fact n = take n $ scanl' (\acc cur -> (*) acc ((+) cur 1)) 1 [1..]

    --------------------------------------------------------------------------------------------------------------------

    firstTwentiethFibs :: Integral a => [a]
    firstTwentiethFibs = fibs 20

    fibsLessThanOneHundred :: [Int]
    fibsLessThanOneHundred = fibsLimit 100
