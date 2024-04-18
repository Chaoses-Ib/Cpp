# Functions
## Force inline
- `__forceinline`

  不保证一定内联，但如果开启了 `/W4`，不能内联时会发出警告。

  [Inline Functions (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/inline-functions-cpp?view=vs-2019)

  [Compiler User Guide: `__forceinline`](https://www.keil.com/support/man/docs/armcc/armcc_chr1359124967177.htm)

  [Visual C++ `__forceinline` strange behavior - Stack Overflow](https://stackoverflow.com/questions/41102421/visual-c-forceinline-strange-behavior)
  - [`inline_recursion` pragma](https://learn.microsoft.com/en-us/cpp/preprocessor/inline-recursion?view=msvc-170), [`inline_depth` pragma](https://learn.microsoft.com/en-us/cpp/preprocessor/inline-depth?view=msvc-170)

    > The inline_depth pragma has no effect on functions marked with `__forceinline`.
  
  - 返回 `string` 或 `vector` 也可能导致 force inline 失败。

- [Force inline functions in C++(GCC) |A Course By Curiosity](http://jijithchandran.blogspot.com/2013/12/force-inline-functions-in-cgcc.html)

[c++ - Can I selectively (force) inline a function? - Stack Overflow](https://stackoverflow.com/questions/7108797/can-i-selectively-force-inline-a-function)

[Why there is no standard way to force inline in C++? - Stack Overflow](https://stackoverflow.com/questions/6108439/why-there-is-no-standard-way-to-force-inline-in-c)

[gcc - When `__builtin_memcpy` is replaced with libc's memcpy - Stack Overflow](https://stackoverflow.com/questions/11747891/when-builtin-memcpy-is-replaced-with-libcs-memcpy)


[→Intrinsics]()