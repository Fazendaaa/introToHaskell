-- MoreBottoms.hs
module MoreBottoms where
    import Data.Bool (bool)
    
    similarMap :: (Eq b) => (b -> a) -> [b] -> [a]
    similarMap func (x:xs) = (:) (func x) $ bool [] (similarMap func xs) $ 0 /= length xs
