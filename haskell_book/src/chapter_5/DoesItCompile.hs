-- DoesItCompile.hs
module DoesItCompile where
    bigNum = (^) 5 $ 10
    wahoo = (+) bigNum $ 10

    x = print
    y = print "woohoo!"
    z = x "hello world"

    a = (+)
    b = 5
    c = a b 10
    d = a c 200

    e = 12 + b where
        b = 10000 * c
        c = 1 
