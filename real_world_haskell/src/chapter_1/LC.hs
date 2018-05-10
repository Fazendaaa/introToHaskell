-- file: LC.hs
module LC where
    main:: IO()
    main = interact lineCount
        where lineCount input = show (length (lines input)) ++ "\n"
