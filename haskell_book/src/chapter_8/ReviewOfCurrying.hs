-- ReviewOfCurrying.hs
module ReviewOfCurrying where
    cattyConny :: String -> String -> String
    cattyConny x y = x ++ " mrow " ++ y

    flippy :: String -> String -> String
    flippy = \a -> \b -> flip cattyConny a b

    appedCatty :: String -> String
    appedCatty = cattyConny "woops"

    frappe :: String -> String
    frappe = flippy "haha"
