-- Scope.hs
module Scope where
    area :: Float -> Float
    area d = let pi :: Float
                 pi = 3.14
                 in  pi * r ^ 2 where
                     r = d / 2
