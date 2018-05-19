-- NiceDrop.hs
module NiceDrop where
    -- Just decided to write down this code because of its simplicity and beauty
    niceDrop :: Int -> [a] -> [a]
    niceDrop n xs | 0 >= n = xs
    niceDrop _ [] = []
    niceDrop n (_:xs) = niceDrop (n -1 ) xs
