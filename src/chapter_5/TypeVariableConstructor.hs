-- TypeVariableConstructor.hs
module TypeVariableConstructor where
    data Zed
    data Blah
    data C

    f :: zed -> Zed -> Blah; f = undefined
    --   [0]    [1]    [2]
    -- 
    -- 0. Fully polymorphic;
    -- 1. Concrete;
    -- 2. Concrete.

    g :: Enum b => a -> b -> C; g = undefined
    --            [0]  [1]  [2]
    -- 
    -- 0. Fully polymorphic;
    -- 1. Constrained polymorphic;
    -- 2. Concrete.

    h :: h -> g -> C; h = undefined
    --  [0]  [1]  [2]
    -- 
    -- 0. Constrained polymorphic(?);
    -- 1. Fully polymorphic;
    -- 2. Concrete.
