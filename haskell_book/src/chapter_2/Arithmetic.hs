-- arithmetic.hs
makeQuot x y = (quot x y ) ^ y + (rem x y) == x
makeDiv x y = (div x y ) * y + (mod x y) == x

-- with parentheses:
withParentheses = (2 ^) (2 + 2)

-- with $:
withCoin = (2 ^) $ 2 + 2

-- without parentheses:
withoutParentheses = (2 ^) 2 + 2

-- The $ will allow everything to the right of it to be evaluated first and can be used to delay function application.
moreCoin = (2 ^) $ (* 30) $ 2 + 2
