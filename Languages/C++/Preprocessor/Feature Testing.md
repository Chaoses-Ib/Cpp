# [Feature Testing](https://en.cppreference.com/w/cpp/feature_test)
## Language features (C++20)
```cpp
__cpp_*
```

## Library features (C++20)
[\<version\>](https://en.cppreference.com/w/cpp/header/version)
```cpp
__cpp_lib_*
```

How to test `<version>` itself?
- `__cplusplus`
  ```cpp
  #if __cplusplus >= 202002L
  #  include <version>
  #endif
  ```
  However, regardless of the language standard, MSVC will expand `__cplusplus` to `199711L` unless [/Zc:__cplusplus](https://learn.microsoft.com/en-us/cpp/build/reference/zc-cplusplus) is specified (which is not specified by default in Visual Studio).[^__cplusplus-so]
- [__has_include](https://en.cppreference.com/w/cpp/preprocessor/include)
  ```cpp
  #ifdef __has_include
  # if __has_include(<version>)
  #   include <version>
  # endif
  #endif
  ```
  `__has_include` was introduced in C++17. If `__has_include` does not exist, then `<version>` does not exist either.

## Attributes (C++20)
```cpp
__has_cpp_attribute( attribute-token )
```

## Headers (C++17)
[__has_include](https://en.cppreference.com/w/cpp/preprocessor/include)

Note that a `__has_include` result of `1` only means that a header or source file with the specified name exists. The header file may be unusable under the current language standard.

[^__cplusplus-so]: [c++ - How are the __cplusplus directive defined in various compilers? - Stack Overflow](https://stackoverflow.com/questions/11053960/how-are-the-cplusplus-directive-defined-in-various-compilers)