# Counter
- `__COUNTER__`
  - [MSVC](https://docs.microsoft.com/en-us/cpp/preprocessor/predefined-macros)
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