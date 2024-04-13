# [Attributes](https://en.cppreference.com/w/cpp/language/attributes)
Introduces implementation-defined attributes for types, objects, code, etc.

## `[[nodiscard]]` (C++17)
[How can I intentionally discard a `[[nodiscard]]` return value? - Stack Overflow](https://stackoverflow.com/questions/53581744/how-can-i-intentionally-discard-a-nodiscard-return-value)
- [`std::ignore`](https://en.cppreference.com/w/cpp/utility/tuple/ignore)

  ```cpp
  #include <tuple>

  std::ignore = e;
  ```
- `statics_cast<void>()`

[ES.48: Avoid casts](https://github.com/isocpp/CppCoreGuidelines/blob/4f723b0ffff6f5c8d7f6d86555ecdda8a2323850/CppCoreGuidelines.md#es48-avoid-casts):
> Never cast to `(void)` to ignore a `[[nodiscard]]` return value. Use `std::ignore =` to turn off the warning which is simple, portable, and easy to grep.

## [`[[no_unique_address]]`](https://en.cppreference.com/w/cpp/language/attributes/no_unique_address) (C++20)

## [`[[likely]]`, `[[unlikely]]`](https://en.cppreference.com/w/cpp/language/attributes/likely) (C++20)