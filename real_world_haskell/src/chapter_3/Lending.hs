-- Lending.hs
module Lending where
    lend :: (Num a, Ord a) => a -> a -> (Nothing | a)
    lend amount balance = let reserve = 100
                              newBalance = balance - amount in
                                  if balance < reserve then Nothing else Just newBalance
