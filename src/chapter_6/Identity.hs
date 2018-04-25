-- Identity.hs
module Identity where
    data Identity a = Identity a deriving Show

    instance Eq a => Eq (Identity a) where
        (==) (Identity v) (Identity v') = v == v'

    -- It works, but there's no need for it.
    -- instance Ord a => Eq (Identity a) where
        -- (==) (Identity v) (Identity v') = compare v v' == EQ
