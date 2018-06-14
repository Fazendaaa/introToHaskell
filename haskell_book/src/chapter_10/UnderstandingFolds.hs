-- UnderstandingFolds.hs
module UnderstandingFolds where
    import Data.List

    a = foldr (++) "" ["woot", "WOOT", "woot"]
    b = foldr (:) [] "fear is the little death"
    c = foldr (&&) True [False, True]
    d = foldr (||) False [False, True]
    e = foldl (\a b -> (++) a (show b)) "" [1..5]
    f = foldl (\a _ -> const a "nothing") 'a' [1..5]
    g = foldl const 0 "tacos"
    h = foldr (flip const) 0 "burritos"
    i = foldr (flip const) 'z' [1..5]
