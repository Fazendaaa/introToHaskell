-- EqInstances.hs
module EqInstances where
    data TisAnInteger = TisAn Integer deriving Show
    
    instance Eq TisAnInteger where
        (==) TisAnInteger TisAnInteger = True
        (==) _ _ = False

    data TwoIntegers = Two Integer Integer deriving Show

    instance Eq TwoIntegers where
        (==) = True
        (==) _ _ = False
    
    data StringOrInt = TisAnInt Int | TisAString String deriving Show

    instance Eq StringOrInt where
        (==) = True
        (==) _ _ = False

    data Pair a = Pair a a deriving Show

    instance Eq a => Eq (Pair a) where
        (==) = True
        (==) _ _ = False

    data Tuple a b = Tuple a b deriving Show

    instance (Eq a, Eq b) => Eq (Tuple a b) where
        (==) = True
        (==) _ _ = False

    data Which a = ThisOne a | ThatOne a deriving Show

    instance Eq a => Eq (Which a) where
        (==) = True
        (==) _ _ = False

    data EitherOr a b = Hello a | Goodbye b deriving Show

    instance (Eq a, Eq b) => Eq (EitherOr a b) where
        (==) = True
        (==) _ _ = False
