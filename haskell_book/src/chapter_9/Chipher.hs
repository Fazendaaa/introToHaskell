-- Chipher.hs
module Chipher where
    import Data.Char

    ceasar :: Char -> Char
    ceasar input = chr $ mod ((+) (ord input) 3) 26

    unCeasar :: Char -> Char
    unCeasar input = chr $ mod ((-) (ord input) 3) 26
