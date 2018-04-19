-- Palindrome.hs
module Palindrome where
    isPalindrome :: (Eq a) => [a] -> Bool
    isPalindrome x = x == reverse x
