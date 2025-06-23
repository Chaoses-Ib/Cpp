# `sizeof` Operator
[cppreference.com](https://en.cppreference.com/w/cpp/language/sizeof.html)

## Syntax
```cpp
// Yields the size in bytes of the object representation of type.
sizeof( type )

// Yields the size in bytes of the object representation of the type of expression, if that expression is evaluated.
sizeof expression
```
- 不带括号按标准只能用表达式，不能直接用类型

  Why not the opposite, i.e. only expressions need parentheses but types don't? Wouldn't only that way make sense? Expressions need parentheses to keep priority anyway, but types don't need them.

- `sizeof a + b` is parsed as `(sizeof a) + b` instead of `sizeof (a + b)`

- MSVC allows `sizeof type` in old versions (e.g. 14.31.31103), but prohibited now

  [sizeof type-name improperly accepted without parentheses - Developer Community](https://developercommunity.visualstudio.com/t/sizeof-type-name-improperly-accepted-wit/10433628?q=limit+merge+type)

  [fix(cpp/holder): `sizeof` syntax - Chaoses-Ib/IbWinCppLib@f630f0e](https://github.com/Chaoses-Ib/IbWinCppLib/commit/f630f0e3a2c757652298c626fcd52469e5d5bc81)
  
- [If sizeof... argument not surround by parentheses, result in internal compiler error - Developer Community](https://developercommunity.visualstudio.com/t/If-sizeof-argument-not-surround-by-pa/10252909?space=21&q=rollup+column)

[c++ - When should we use sizeof with and without parentheses - Stack Overflow](https://stackoverflow.com/questions/28075100/when-should-we-use-sizeof-with-and-without-parentheses)
