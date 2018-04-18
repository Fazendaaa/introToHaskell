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