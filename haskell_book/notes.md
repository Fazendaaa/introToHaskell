# TL;DR
## Chapter 1
### Alpha equivalence
Functions that mean the same thing but wrote in different forms:

    λx.x == λd.d == λz.z

### Beta reduction
Apply a lambda term to an argument within the body of the abstraction:

    (λx.x)2         (λx.x+1)2+1         (λx.x)(λy.y)z
          2                 3          ((λx.x)(λy.y))z
                                        [x := (λy.y)]
                                        (λy.y)z
                                        [y := z]
                                         z

Applications in the lambda calculus are _left associative_.

### Free variables
Variables that are not named in the head of the function -- the opposite of the bound variables:

    λx.xy           (λx.xy)z
                    (λ[x := z].xy)
                    zy

Alpha equivalence does not apply to free variables.

### Multiple arguments
Each lambda can only bind one parameter and can only accept one argument, this is called _currying_:

    λxy.xy == λx(λy.xy)     λx.x            λxy.xy                  λxy.xy

                           (λx.x) 1        (λxy.xy) 1 2            (λxy.xy)(λz.a) 1
                           [x := 1]        (λx.(λy.xy)) 1 2        (λx(λy.xy))(λz.a) 1
                            1              [x := 1]                [x := (λz.a)]
                                           (λy.1y) 2               (λy(λz.a)y) 1
                                           [y := 2]                [y := 1]
                                            1 2                    (λz.a) *
                                                                    a

> * since 'z' is not used anywhere, can be removed without any problem, leaving only the function body.

[Worth reading before proceed!](http://www.cs.columbia.edu/~sedwards/classes/2012/w4115-fall/lambda.pdf)

    (λxy.xxy)(λx.xy)(λx.xz)
             ...
    -- don't know which steps
    were taken to clean up this --
             ...
    (λxyz.xz(yz))(λmn.m)(λp.p)
    (λx.λy.λz.xz(yz))(λm.λn.m)(λp.p)
    [x := (λm.λn.m)]
    (λy.λz.(λm.λn.m)z(yz))(λp.p)
    [y := (λp.p)]
    λz.(λm.λn.m)z((λp.p)z)
    λz.(λm.λn.m)(z)((λp.p)z)
    λz.((λm.λn.m)(z))((λp.p)z)
    [m := z]
    λz.(λn.z)((λp.p)z)
    λz.((λn.z)((λp.p)z))
    [n := ((λp.p)z)] *
    λz.z

> * There's a _'tricky'_ part right right here, since _λn.z_ is not bound by _n_ that means this variable could be anything the result still be the _z_ only.

### Evaluation is simplification
_β normal form_ is when you cannot beta reduce -- apply lambdas to arguments -- the terms any further:

    2000/1000 == 2
    (10+2)*100/2 == 600
    (λx.x)z == λz.z
    (λxy.xy)z == (λx.λy.xy)z == λy.zy

### Combinators
It's a lambda term with no free variables:

    λx.x
    λxy.x
    λxyz.x(yz)

Are not combinators:

    λy.x -- x is free
    λx.xz -- z is free
    
### Divergence
Means that reduction process never terminates or ends:

    (λx.xx)(λx.xx)
    [x := (λx.xx)]
    (λx.xx)(λx.xx)
    [x := (λx.xx)]
    (λx.xx)(λx.xx)
         ...
    (λx.xx)(λx.xx)

This matters in programming because terms that diverge are terms that don't produce an _answer_ or meaningful result.

### Summary
* All functions take one argument and return one result;
* Variables may be bound in the functions declaration, and every time a bound variable shows up in a function, it has the same value.

### Definitions
* Lambda _abstraction_ is an anonymous function or lambda term:

        (λx.x+1)

* _Application_ is how one evaluates or reduces lambdas:

        (λx.x) 1
* _Lambda calculus_ is a formal system for expressing programs in terms of abstraction and application;
* _Normal order_ is a common evaluation strategy  in lambda calculi -- ie, applying or beta reducing.

### More in
* [A Tutorial Introduction to the Lambda Calculus](http://www.inf.fu-berlin.de/lehre/WS03/alpi/lambda.pdf);
* [A Introduction to Lambda Calculus](http://www.cse.chalmers.se/research/group/logic/TypesSS05/Extra/geuvers.pdf);
* [PROOFS  AND  TYPES](http://paultaylor.eu/stable/prot.pdf).

## Chapter 2
### Hello, Haskell
See source file.

### Understanding expressions
Everything in Haskell is an expression or declaration.

#### Normal form
Reducible expressions are also called _redexes._

### Functions
See source file.

### Troubleshooting
Use spaces, _not_ tabs, to indent your code -- in general, whitespace is significant in Haskell.

### Arithmetics
See source file for explanation about _$_.

_Sectioning_ allows you to pass around partially applied functions:

    (+1) 2
    3

### _Let_ and _where_
See source file.
* Let: introduces an _expression_;
* Where: _declaration_ bound to a surrounding syntactic construct.

### Definitions
* A _parameter_, or _formal parameter_, represents a value that will be passed to the function when the function is called;
* A function's parameter is bound to the value of an _argument_ when the function is applied to that argument -- a variable inside an function could be called as an argument, like 2 + 2;
* An _expression_ is a combination of symbols that conforms to syntactic rules and can be evaluated to some result;
* A _value_ is an expression that cannot be reduced or evaluated any further.

### More in
* [Let vs. Where](http://wiki.haskell.org/Let_vs._Where);
* [How to desugar Haskell code](http://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html).

## Chapter 3
### Strings
Haskell has _Char_ type and strings are _type alias_ for an char list.

### List
The (:) operator, called _cons_, builds a list:

    λ> 'f' : "arm"
       "farm"
    λ> 'F' : ""
       "F"

Elements:

    λ> head "Farm"
       'F'
    λ> tail "Farm"
       "arm"
    λ> take 0 "Farm"
       ""
    λ> take 2 "Farm"
       "Fa"
    λ> drop 2 "Farm"
       "rm"
    λ> drop 15 "Farm"
        ""
    λ> "Farm" !! 0
       'F'
    λ> "Farm" !! 2
       'r'
    λ> head ""
       *** Exception: Prelude.head: empty list
    λ> "" !! 2
       *** Exception: Prelude.!!: index too large

## Chapter 4
### Numeric Types
Haskell does not use only one type, we need to be concerned with are:
* Integral numbers:
    * Int - Fixed range;
    * Integer - Supports arbitrarily range of numbers.
* Fractional:
    * Float - Single precision, should not be used in business applications;
    * Double - Double precision, twice bits as Float and it the Fractional default type;
    * Rational - Represents the ratio of two integers;
    * Scientific - Space efficient and almost arbitrary precision.

All of this numeric datatypes have a typeclass named Num.

__Most programs should use _Integer_, no _Int_!__ - unless performance makes a difference.

### Comparing Values
In Haskell the __!=__ equivalent is __/=__.

Funny comparisons:

    λ> 'a' < 'b'
       True
    λ> "Julie" > "Chris"
       True
    λ> ['a', 'b'] > ['b', 'a']
       False

### Conditionals
Haskell have _if expressions_:

    λ> if True then 1 else 0
    1

Unlike C lang and some "low-level" languages, Haskell only allows conditionals with Bool type. That means that the following C code:

    int x = 0;

    if (x) {
        printf("if\n.");
    } else {
        printf("else\n.");
    }

Roughly "translated" to Haskell as:

    λ> let x = 0
    λ> if x then "if" else "else"
       error

The correct way is:

    λ> let x = 0
    λ> if 0 /= x then "if" else "else"
       "else"

### Tuples
    λ> (,) 1 0
       (1, 0)
    λ> (,) 1 'a'
       (1, 'a')
    λ> (,) 1 "Farm"
       (1, "Farm")

> _"It's generally unwise to use tuples of an overly large size [...]. Most tuples you see will be ( , , , , ) (5-tuple) or smaller."_

### Lists
* Elements must be of same type;
* The number of values isn't specified in the type.

Examples:

    λ> let l = [1, 2, 3]
    λ> length l
       3

### Definitions
* You cannot have a tuple with only one element, but there is a zero tuple called _unit_ or ();
* _Data declarations_ define new datatypes and _always_ create a new type constructor, but may or may not create new data constructor;
* _Arity_ is the number of arguments a function accepts.

### Names and variables
Haskell there are seven categories of entities that have names:
* Functions;
* Term-level variables;
* Data constructors;
* Type variables;
* Type constructor;
* Typeclasses;
* Modules.

## Chapter 5
### What are types for?
* Improved lambda calculus called _[System F](https://crypto.stanford.edu/~blynn/lambda/systemf.html)_;
* Since types are _static_ typechecking occurs at __compile time__.

### Currying
> _"As in the lambda calculus, arguments (plural) is a shorthand for the truth in Haskell: __all functions in Haskell take one argument and return on result.__"_

Currying is about nesting multiple functions as each accept one parameter and return one result, allowing the illusion of multiple-parameter functions.

### Partial application
See source code for more.

### Manual currying and uncurrying
_Uncurrying_ means un-nesting the functions and replacing the two functions with a tuple of two values.

### Currying and uncurrying existing functions
    λ> let curry f a b = f (a, b)
    λ> let uncurry f a b = f a b
    λ> curry fst 1 2
       1
    λ> uncurry (+) 1 2
       3

### Sectioning
Refers to partial application of infix operators:

    λ> let x = 5
    λ> let y = (2^)
    λ> let z = (^2)
    λ> y x
       32
    λ> x z
       25

### Polymorphism
> _"Many forms"_

obs: _polymorphic_ means "made of many forms".

In Haskell, polymorphism divides into two categories:
* parametric - refers to type variables/parameters that are fully polymorphic;
* constrained (aka: 'ad-hoc') - puts a typeclass constraints on the variable, that way decreasing the number of types it could be, but increasing what you can do with it.

_"[...] When you see a lowercase name in a type signature, it is a type variable and polymorphic."_

    f :: Num a => a -> b -> Int -> NewOneType
                 [0]  [1]   [2]    [3]

0. Constrained polymorphic;
1. Fully polymorphic;
2. Concrete;
3. Concrete.

#### Working around constraints
Remember?

    λ> 6 / length [1, 2, 3]
       error

One way out:

    λ> 6 / fromIntegral (length [1, 2, 3])
       2.0

### Type inference
> _"Haskell's type inference is built on an extended version of the Damas-Hindley-Milner type system."_

_Monomorphism restriction_: if any can be determined, top-level declarations by default will have a concrete type.

### Definitions
* "_Principal type_ is the most generic type which still typechecks";
* "_Typeclass_ is a means of expressing faculties or interfaces that multiple datatypes may have in common";
* "_Parametricity_ is the property that holds in the presence of parametric polymorphism";
* Importing encode function from Data.Aeson module:
    
        import Data.Aeson (encode)

### Follow-up resources
* [Principal type-schemes for functional programs](https://fi.ort.edu.uy/innovaportal/file/20124/1/31-milner-damas.pdf);
* [Fundamental Concepts in Programing Languages](https://link.springer.com/article/10.1023%2FA%3A1010000313106).

## Chapter 6
### Typeclasses
> _"Typeclasses and types in Haskell are, in a sense, opposites."_

Typeclasses are similar to interfaces in some languages, can work in multiple datatypes.

### Typeclass deriving
Typeclass instances that can derive, with some constraints, are:
* Eq;
* Ord;
* Enum;
* Bounded;
* Read;
* Show.

### Writing typeclass instances
See source code Trivial.hs.

"Unlike other languages, Haskell does not provide universal stringification (Show / print) or equality (Eq (value equality) or pointer equality) as this is not always sound safe, regardless of what programming language you're using."

### Partial functions
"Is one that doesn't handle all the possible cases, so there are possible scenarios in which we haven't defined any way for the code to evaluate."

### Multiple Inheritance
See "deadly diamond of death" [here](https://en.wikipedia.org/wiki/Multiple_inheritance).

### Enum
    λ> enumFromThenTo 1 10 100
                     [0][1][2]

The parameters are:

0. start;
1. step (optional);
2. end.

### Side effects
Since Haskell is a pure functional programming language, this means that programs are written as functions and can be expressed exclusively in terms of a lambda calculus.

Printing something in the screen or reading something from a terminal or even a file violates this principle, that's because it does something in a not "lambda calculus way" interacting with something that is outside of it's scope. But Haskell does that without involving anything to the pure lambda calculus and that's why it's called a purely functional programming language.

### Typeclasses vs Concrete
One thing about being explicit parametricity and typeclasses is that you mean what you want to do with your data, which means you are less likely to make a mistake.

### Definitions
* _Typeclass inheritance_: when a typeclass has a superclass;
* _Instance_: how a typeclass should work given a type.

### Follow-up resources
* [The Expression Problem](http://homepages.inf.ed.ac.uk/wadler/papers/expression/expression.txt);
* [How to make ad-hoc polymorphism less ad hoc](https://cse.iitk.ac.in/users/karkare/courses/2010/cs653/Papers/ad-hoc-polymorphism.pdf);
* [Type Classes in Haskell](http://ropas.snu.ac.kr/lib/dock/HaHaJoWa1996.pdf).

## Chapter 7
### Func-y
Haskell functions are first-class entities. In a nutshell that basically means:
* You can pass and return functions;
* You can make use of syntactic patters.

_Shadowing_: when an argument suppress other with same declaration due to its scopes. That happens because Haskell is a lexically scoped language.

### Anonymous functions
    λ> (\x -> x * 3) 5
    15
    λ> (\x -> x * 3) 1
    3

### Pattern matching
I hope that this example speaks for itself:

    isItTwo :: Integer -> Bool
    isItTwo 2 = True
    isItTwo _ = False

In the terminal:

    λ> isItTwo 3
    False
    λ> isItTwo 2
    True

This looks like logic languages like Prolog.

### Higher-Order Functions (HOFs)
Functions that accepts functions as arguments and/or as return.

### Guards
_"If-then-else is not guards!"_

    myAbs :: Integer -> Integer
    myAbs x
        | x < 0     = negate x
        | otherwise = x

The __|__ operator is called _pipe_.

### Pointfree style
Is a way of composing functions without specifying their arguments. And is good to remember that the composition are applied from right to left.

### Chapter Definition
* "_Currying_ is the process of transforming a function that takes multiple arguments into a series of function which each take one arguments and return one result.";
* "[...] pattern matching is the act of checking a given sequence of tokens for the presence of the constituents of some pattern. [...] The patterns generally have the form of either sequences or tree structures." - [Wikipedia](https://en.wikipedia.org/wiki/Pattern_matching);
* Composition => The function _g_ is applied to _x_, _f_ is applied to _g_'s results later on:

        comp :: (b -> c) -> ((a -> b) -> (a -> c))
        comp f g x = f (g x)

### Follow-up resources
* [Haskell's pattern matching](https://www.haskell.org/tutorial/patterns.html);
* [The Implementation of Functional Programming Languages](https://www.microsoft.com/en-us/research/wp-content/uploads/1987/01/slpj-book-1987-small.pdf) - pages 53-103;
* [Fundamental Concepts in Programming Languages](http://www.cs.cmu.edu/~crary/819-f09/Strachey67.pdf) - page 11;
* [An Introduction to Pointfree Programing](http://di.uminho.pt/~jno/ps/iscalc_1.ps.gz);
* [Point-free Program Calculation](http://www4.di.uminho.pt/~mac/Publications/phd.pdf).

## Chapter 8
### Recursion
A total function is one function that handles all of its inputs.

### Follow-up resources
* [How to Succeed at Recursion Without Really Recursing](https://mvanier.livejournal.com/2897.html);

## Chapter 9
### Lists
Using Maybe to return a tail:

    λ> :info Maybe
    data Maybe a = Nothing | Just a

Code:
  
    safeTail :: [a] -> Maybe [a]
    safeTail []      = Nothing
    safeTail (x:[])  = Nothing
    safeTail (_:xs)  = Just xs

### List comprehensions

    [ x^2 | x <- [1..10] ]
    [ x^2 | x <- [1..10], 0 == rem x 2 ]
    [ x^y | x <- [1..5], y <- [2, 3] ]

Using _elem_:

    λ> elem 'a' "Farm"
    True
    λ> elem 'b' "Farm"
    False

### Spines and nonstrict evaluation
_"Because Haskell's evaluation is nonstrict, [...] nothing is evaluated until it must be."_

            : <---------------------|
           / \                      |
          _   : <-------------------| This is the spine
             / \                    |
            _   : <-----------------|
               / \
              _   []

Spines are nodes in trees structures and cons in lists.

### Weak Head Normal Form (WHNF)
Just read this chapter part, it will be more productive than resuming it.

### Transforming lists of values
_"A common mantra for performance sensitive code in Haskell is, __'lazy in the spine, strict in the leaves'__."_

### Zipping lists

    λ> zip [1, 2, 3] [10, 11, 12]
    [(1, 10), (2, 11), (3, 12)]
    λ> zipWith (+) [1, 2, 3] [10, 11, 12]
    [11, 13, 15]
    λ> unzip [(1, 10), (2, 11), (3, 12)]
    [1, 2, 3] [10, 11, 12]

### Follow-up resources
* [Data-List](http://hackage.haskell.org/package/base/docs/Data-List.html);
* [Ninety-nine Haskell problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems).

## Chapter 10
### Folding lists
Folds are called also as catamorphisms -- "means of deconstructing data".

Folds happens in two stages:
1. Transversal: recurses over the spine;
2. Folding: evaluation or reduction of the values.

Folds, different from maps, will throw exception upon undefined values because it evaluates all foldable values before run it, different from maps that does it upon the value:

    λ> foldr (+) 0 [1, 2, undefined]
    *** Exception: Prelude.undefined
    λ> map (\x -> (+) 1 x) [1, 2, undefined]
    [2,3,*** Exception: Prelude.undefined

### Scanning lists
_Scans_ are kind like folds but it returns all intermediate stages of the fold:

    λ> foldr (+) 0 [1, 2, 3]
    6
    λ> scanr (+) 0 [1, 2, 3]
    [6, 5, 3, 0]

And scans are to the left as to the right, like folds.

### Associativity and Folding
They are not like "'potatoes', 'potatos'":

    λ> foldr (^) 2 [1, 2, 3]
    1
    λ> foldl (^) 2 [1, 2, 3]
    64

### Unconditional spine recursion
One of the differences between foldl and foldr is that the first one evaluates the bottom of the foldable before run it, and the second no.

That's why it's better to use foldr in infinite lists, since all foldl non evaluated members will increase memory and performance. But, in cases there's need for a foldl use foldl' -- "fold-l-prime" -- instead.

### Summary
* Foldr:
    * Works with infinite lists;
    * Associates to the right;
* Foldl:
    * Cannot be used with infinite lists;
    * Only tail-call after reaching the end of the list;

### Scans
Scans are not catamorphisms.

Read the solution to the waterfall problem [here](https://chrisdone.com/posts/twitter-problem-loeb).

Read the book implementation of a fibonacci with scanl -- note: there's a scanl' also.

### Definitions
* _Tail call_ is the final result of a function;
* _Tail recursion_ is a function whose tail calls are recursive invocation of itself;

### Follow-up resources
* [Fold](https://wiki.haskell.org/Fold);
* [Introduction to Functional Programming using Haskell](https://www.amazon.com/Introduction-Functional-Programming-using-Haskell/dp/0134843460) - Sections 4.5 and 4.6;
* [Introduction to Haskell](http://www.cantab.net/users/antoni.diller/haskell/haskell.html);
* [A tutorial on the universality and expressiveness of fold](http://www.cs.nott.ac.uk/~pszgmh/fold.pdf).

## Chapter 11
### Algebraic datatypes
