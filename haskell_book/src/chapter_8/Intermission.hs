-- Intermission.hs
module Intermission where
    applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
    applyTimes 0 _ b = b
    applyTimes n f b = f $ applyTimes (n - 1) f b
