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
