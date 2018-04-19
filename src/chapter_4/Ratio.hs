-- Ratio.hs
module Ratio where
    x = 6;
    y = (length [0, 1, 2]);
    -- It has to be 'div' because '/' is for Fractional types. And still don't know why but the infix doesn't work quite
    -- as well here.
    z = div x y;
