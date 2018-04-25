-- Absolute.hs
module Absolute where
    myAbs :: Integer -> Integer
    -- Just a remminder, when calling this function with negative parameters, use:
    --      myAbs (-value)
    myAbs input = if 0 < input then input else negate input
