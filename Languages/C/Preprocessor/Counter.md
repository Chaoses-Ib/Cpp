# Counter
- `__COUNTER__`
  - [MSVC](https://docs.microsoft.com/en-us/cpp/preprocessor/predefined-macros): Expands to an integer literal that starts at 0. The value is incremented by 1 every time it's used in a source file, or in included headers of the source file. `__COUNTER__` remembers its state when you use precompiled headers.
  - GCC
  - Clang
- [BOOST_PP_COUNTER](https://www.boost.org/doc/libs/1_79_0/libs/preprocessor/doc/ref/counter.html)
    ```cpp
    #include <boost/preprocessor/slot/counter.hpp>
    BOOST_PP_COUNTER  // 0

    #include BOOST_PP_UPDATE_COUNTER()
    BOOST_PP_COUNTER  // 1
    ```
- `__LINE__`