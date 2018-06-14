-- UsingFolds.hs
module UsingFolds where
    import Data.List

    myOr :: [Bool] -> Bool
    myOr xs = foldr (||) False xs

    myAny :: (a -> Bool) -> [a] -> Bool
    myAny func xs = foldr (\cur acc -> acc || (func cur)) False xs

    myElemFold :: Eq a => a -> [a] -> Bool
    myElemFold x xs = foldl' (\ acc cur -> x == cur || acc) False xs

    myElemAny :: Eq a => a -> [a] -> Bool
    myElemAny x xs = myAny (\cur -> x == cur) xs

    myReverse :: [a] -> [a]
    myReverse xs = foldl' (flip (:)) [] xs

    myMap :: (a -> b) -> [a] -> [b]
    myMap func xs = foldr (\cur acc -> (:) (func cur) acc) [] xs

    myFilter :: (a -> Bool) -> [a] -> [a]
    myFilter func xs = foldr (\cur acc -> if func cur then (:) cur acc else acc) [] xs

    squish :: [[a]] -> [a]
    squish xs = foldr (++) [] xs

    squishMap :: (a -> [b]) -> [a] -> [b]
    squishMap func xs = foldr ((++) . func) [] xs

    -- I thing this could be improved a lot, but right now just don't know how.
    squishAgain :: [[a]] -> [a]
    squishAgain xs = foldr (\cur acc -> (++) (foldr id cur []) acc) [] xs

    myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
    myMaximumBy func (x:xs) = foldr (\cur acc -> if (==) GT (func cur acc) then cur else acc) x xs
    
    myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
    myMinimumBy func (x:xs) = foldr (\cur acc -> if (==) LT (func cur acc) then cur else acc) x xs
