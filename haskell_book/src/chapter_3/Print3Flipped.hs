-- Print3Flipped.hs
module Print3Flipped where
    myGreeting :: String
    myGreeting = (++) "Hello" ", Wolrd!"

    hello :: String
    hello = "Hello"

    world :: String
    world = "World"

    main :: IO()
    main = do
        putStrLn myGreeting
        putStrLn secondGreeting where
                 -- how to be overkill
                 secondGreeting = (++) hello (concat[((++) ", " world), "!"])
