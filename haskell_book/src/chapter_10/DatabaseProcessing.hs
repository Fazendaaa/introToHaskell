-- DatabaseProcessing.hs
module DatabaseProcessing where
    import Data.Time
    import Data.List

    data DatabaseItem = DbString String
                      | DbNumber Integer
                      | DbDate   UTCTime
                      deriving (Eq, Ord, Show)

    --------------------------------------------------------------------------------------------------------------------
    
    isDate :: DatabaseItem -> [UTCTime] -> [UTCTime]
    isDate item accumulator = case item of
        DbDate date -> (++) ((:) date []) accumulator
        _           -> accumulator

    isNumber :: DatabaseItem -> [Integer] -> [Integer]
    isNumber item accumulator = case item of
        DbNumber number -> (++) ((:) number []) accumulator
        _               -> accumulator

    --------------------------------------------------------------------------------------------------------------------

    filterDbDate :: [DatabaseItem] -> [UTCTime]
    filterDbDate input = foldr isDate [] input

    filterDbNumber :: [DatabaseItem] -> [Integer]
    filterDbNumber input = foldr isNumber [] input

    mostRecent :: [DatabaseItem] -> UTCTime
    mostRecent = maximum . filterDbDate

    sumDb :: [DatabaseItem] -> Integer
    sumDb = sum . filterDbNumber

    avgDb :: [DatabaseItem] -> Double
    avgDb input = (/) (sum numbers) ((fromIntegral . length) numbers) where
        numbers = map fromInteger $ filterDbNumber input

    --------------------------------------------------------------------------------------------------------------------

    theDatabase :: [DatabaseItem]
    theDatabase = [
        DbDate(UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)),
        DbNumber 9001,
        DbString "Hello, world!",
        DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))]

    firstFiltered = filterDbDate theDatabase
    secondFiltered = filterDbNumber theDatabase
    thirdFiltered = mostRecent theDatabase
    fourthFiltered = sumDb theDatabase
    fifithFiltered = avgDb theDatabase
