-- file: CC.hs
module CC where
    main:: IO()
    main = interact characterCount
        where characterCount input = show (length input) ++ "\n"
