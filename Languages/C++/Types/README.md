# Types
[Fundamental types - cppreference.com](https://en.cppreference.com/w/cpp/language/types)

## bool
### The Safe Bool Idiom
[artima - The Safe Bool Idiom](https://www.artima.com/articles/the-safe-bool-idiom)

1. `empty()`、`valid()`

   不方便

2. `operator bool()`
   - 隐式转换问题
   - `operator bool`、`ctor(int)` 和 `operator+` 同时存在，就会引发 ambiguous overload

3. `operator!()`

   不够方便

4. `oprator void*()`

   `delete` 问题、比较问题

5. Nested classes

   投毒设计

   比较问题

6. The safe bool idiom

7. `safe_bool` class

[c++ Overload operator bool() gives an ambiguous overload error with operator+ - Stack Overflow](https://stackoverflow.com/questions/5306696/c-overload-operator-bool-gives-an-ambiguous-overload-error-with-operator)

## byte
- [`std::uint8_t`](https://en.cppreference.com/w/cpp/types/integer)
- `unsigned char`
- [`std::byte`](https://en.cppreference.com/w/cpp/types/byte) (C++17)
  - [byte lite: byte lite - A C++17-like byte type for C++98, C++11 and later in a single-file header-only library](https://github.com/martinmoene/byte-lite)
- [`std::bitset<8>`](https://en.cppreference.com/w/cpp/utility/bitset)

[Is there 'byte' data type in C++? - Stack Overflow](https://stackoverflow.com/questions/20024690/is-there-byte-data-type-in-c)

## Character types
### `char8_t`
[`/Zc:char8_t` (Enable C++20 `char8_t` type) | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/reference/zc-char8-t?view=msvc-170)
```cpp
// Compiles in C++17, Error C2440 in C++20 without /Zc:char8_t-
const char* s = u8"Hello";
// Compiles in C++20 without /Zc:char8_t-, or C++17 with /Zc:char8_t
const char8_t* s = u8"Hello";
```

## Strong typedef
- [`BOOST_STRONG_TYPEDEF`](https://www.boost.org/doc/libs/1_37_0/boost/strong_typedef.hpp) ([Boost.Serialization](https://www.boost.org/doc/libs/1_85_0/boost/serialization/strong_typedef.hpp))
  - [`LLVM_YAML_STRONG_TYPEDEF`](https://llvm.org/doxygen/YAMLTraits_8h_source.html#1725)

- [foonathan/type\_safe: Zero overhead utilities for preventing bugs at compile time](https://github.com/foonathan/type_safe)
  - Inherit

  [Tutorial: Emulating strong/opaque typedefs in C++](https://www.foonathan.net/2016/10/strong-typedefs/)

- [rollbear/strong\_type: An additive strong typedef library for C++14/17/20](https://github.com/rollbear/strong_type)
  - vcpkg

- [anthonywilliams/strong\_typedef: A class template that creates a new type that is distinct from the underlying type, but convertible to and from it](https://github.com/anthonywilliams/strong_typedef) ([r/cpp](https://www.reddit.com/r/cpp/comments/bucc3j/strong_typedef_create_distinct_types_for_distinct/))

  [strong\_typedef - Create distinct types for distinct purposes | Just Software Solutions - Custom Software Development](https://www.justsoftwaresolutions.co.uk/cplusplus/strong_typedef.html)

- [csb6/strong-types: Single-header implementation of strong typedefs in C++](https://github.com/csb6/strong-types)

- [Yosh31207/new\_type\_for\_cpp: New Type Idiom for C++](https://github.com/Yosh31207/new_type_for_cpp)

- [Meta-Proposal for C++ New-types](https://gist.github.com/seanmiddleditch/ab998c40744ccd691261e70d66dee951)

- Enum class
  
  [We already have strong typedefs in C++17](https://groups.google.com/a/isocpp.org/g/std-proposals/c/Y-7cdQcNDrk?pli=1)

[Strong typedefs - Stack Overflow](https://stackoverflow.com/questions/28916627/strong-typedefs)

New type idion in Rust.

[How best to implement the "newtype" idiom in C++? - Stack Overflow](https://stackoverflow.com/questions/62590196/how-best-to-implement-the-newtype-idiom-in-c)