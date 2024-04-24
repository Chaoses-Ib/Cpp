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