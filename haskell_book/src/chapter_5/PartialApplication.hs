-- PartialApplication.hs
module PartialApplication where
    -- Both of the following definition are equivalent:
    --      addStuff :: Integer -> (Integer -> Integer)
    addStuff :: Integer -> Integer -> Integer;
    addStuff a b = (+) ((+) a b) 5;

    addTen = addStuff 5;
    fifiteen = addTen 5;

    subtractStuff :: Integer -> Integer -> Integer;
    subtractStuff x y = x - y - 10;
    subtractOne = subtractStuff 1;
    -- Beawere of the responsabilities of using it:
    --      subtractOne (subtractStuff x) y = x - y - 10
    --      subtractOne (subtractStuff 1) y = 1 - y - 10
    --      subtractOne y = 1 - y - 10
    --      subtractOne y = (-) (negate y) 9
