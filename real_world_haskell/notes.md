# TL;DR
## Chapter 1
First of all, the name. [Haskell Curry](https://en.wikipedia.org/wiki/Haskell_Curry):

_"Haskell Brooks Curry [...] was an American mathematician and logician. Curry is best known for his work in combinatory logic; while the initial concept of combinatory logic was based on a single paper by Moses Schönfinkel, much of the development was done by Curry. Curry is also known for Curry's paradox and the Curry–Howard correspondence. There are three programming languages named after him, __Haskell__, __Brook__ and __Curry__, as well as the concept of currying, a technique used for transforming functions in mathematics and computer science."_

Haskell programs could run more slowly than similar programs written in C/C++. That's because Haskell is focused in productivity and reliability, outweighing -- for those who care about it -- any performance advantage that others languages might perform.

Haskell is know for:
* Emphasizes safety;
* Being used in the industry and being Open Source.

### Getting started
GHC: Glasgow Haskell Compiler

#### Boolean
In C is used the __!__ operator, in Haskell is __not__ operator.

## Chapter 2
Haskell types:
* Strong;
### Types
* Static;
* Can be inferred.

Type coercing is need because Haskell won't do it automatically for you. From academic definitions: type strength is "how permissive" a type system is.

### Functions
_"Haskell doesn't have a __return__ keyword, because a function is a single expression, not a sequence of statements. The value of the expression is the result of the function."_

### Why the fuss over purity?
* _"[...] a pure function can only depend on its arguments [...]"_;
* Makes abstraction more easy to understand.

### Further reading
* [Theorems fo free](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.38.9875).

## Chapter 3
### New Data Type
* _Values constructor_ is also called _data constructor_;
* _Components_ are the knew data types that the new one will be built upon;
* _type_ keyword is kind like _typedef_ from C/C++;

### Algebraic Data Types (ADT)
Are those types that can have more than one value constructor, like the Bool type:

    data Bool = False | True

### Enumeration

    data WeekDays = Sunday
                  | Monday
                  | Tuesday
                  | Wednesday
                  | Thursday
                  | Friday
                  | Saturday
                  deriving (Eq, Show)

### Reporting Errors

    error :: String -> a

_"It doesn't let our caller distinguish between a recoverable error and a problem so severe that it really should terminate our program."_

### The offside Rule and Whitespace in an Expression
_"Haskell uses indentation as cue to parse sections of code [...] the __offside rule__."_

Even so, the indentation is not mandatory, you can use the { ... _code here_ ... } to avoid indentation rules.

### A Few Notes
* Data types with the _data_ keyword are algebraic ones;
* The *_* (underscore) is called _wild card_;
* _Isomorphic_ types: have the same shape;
* -fwarn-incomplete-patterns;
* -fwarn-name-shadowing.

## Chapter 4
### Functional Programming
In Arch Linux environment there's a fight between dependencies, so when compiling Haskell's files do it the following way if _--make_ isn't working for you:

    $ ghc -dynamic fileName.hs

I haven't found a package to do _unix2dos_ in Arch as others distros have it.

### Infix Functions
Backquotes, or backtick, are used to "infixing" prefix operators like:


    λ> 1 `plus` 2
    3
    λ> plus 1 2
    3
### Lists
_"If you need to determine whether a list is empty, use the __null__ function:"_

    λ> null []
    True
    λ> null [1, 2, 3]
    False
    λ> null "Farm"
    False

### Partial and Total functions
_"Functions that have only return values, defined for a subset of valid inputs are called partial functions (calling __error__ doesn't qualify as returning value!). Wee call functions that return valid results over their entire input domains total functions."_

### What's the big deal about tail recursion?
Read [Tail Call Optimization(TCO)](https://en.wikipedia.org/wiki/Tail_call).

### The Left Fold

    λ> foldl (+) 0 (1:2:3:[]) == (((0 + 1) + 2 ) + 3)
    λ> foldr (+) 0 (1:2:3:[]) == (1 + (2 + (3 + (0)))

More about [primitive recursion](https://en.wikipedia.org/wiki/Primitive_recursive_functional).

Read the incredible explanation about why use __foldl'__ instead of __fold__. And to aid read [this](https://wiki.haskell.org/Foldr_Foldl_Foldl%27) as well.

### Anonymous (lambda) Functions
The only thing I can write is: _"there's no free lunch"_.

Remember that to use anonymous functions your patterns should not be recursive in any way that uses a list or anything like it.

### Currying
_"Partial function application is named __currying__, after the logician Haskell Curry."_

### Sections
Partial application of functions are called _sections_:

    λ> (1+) 2
    3
    λ> map (^2) [1, 2, 3, 4, 5]
    [1, 4, 9, 26, 25]
    λ> all (`elem` ['a'..'z']) "Farm"
    False

### As-patterns
What the _tails_ function does?

    λ> tails "Farm"
    ["Farm", "arm", "rm", "m", ""]

Writing this function _as-patterns_ returning nonempty suffixes:

    suffixes :: [a] -> [a]
    suffixes xs@(_:xs') = xs : suffixes xs'
    suffixes _ = []

The __@__ in this case means _"bind the variable xs to the value that matches the right side of the @ symbol"_.

### Further Reading
* [A tutorial on the universality and expressiveness of fold](http://www.cs.nott.ac.uk/~pszgmh/fold.pdf).

## Chapter 5
### Writing a Library
