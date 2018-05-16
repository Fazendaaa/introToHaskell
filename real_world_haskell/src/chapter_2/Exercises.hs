-- Exercises.hs
module Exercises where
    lastButOne :: [a] -> a
    -- The  original  response  that  the  exercise  wanted  would  run  through negative index error, that's why the if
    -- statement, to avoid this.
    lastButOne xs = if length xs > 1 then xs !! (length xs - 2) else head xs
