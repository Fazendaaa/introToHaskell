-- file: WC.hs
module WC where
    main:: IO()
    main = interact wordCount
        where wordCount input = show (length (words input)) ++ "\n"
