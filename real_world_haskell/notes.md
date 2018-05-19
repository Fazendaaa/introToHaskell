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
### Types
Haskell types:
* Strong;
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
