# C Runtime Library (CRT)
## Debug
[CRT debugging techniques | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/c-runtime-library/crt-debugging-techniques?view=msvc-170)
> The functions in the CRT debug libraries are compiled with debug information and without optimization. Some functions contain assertions to verify parameters that are passed to them, and source code is provided. With this source code, you can step into CRT functions to confirm that the functions are working as you expect and check for bad parameters or memory states. (Some CRT technology is proprietary and doesn't provide source code for exception handling, floating point, and a few other routines.)

- Macros for reporting: `_RPTn`, `_RPTFn`

- Debug hook function writing
  - Client block hook functions
  - Allocation hook functions
  - Allocation hooks and CRT memory allocations
  - Report hook functions

- `_DEBUG` conflicts with release CRT

  [c++ - Switching to non-debug runtime /MT causes link errors - Stack Overflow](https://stackoverflow.com/questions/32429836/switching-to-non-debug-runtime-mt-causes-link-errors)

- Rust uses dynamic [release CRT for both debug and release](https://github.com/Chaoses-Ib/Rust/blob/main/Build/rustc/Linkage.md#crt) by default

## CMake
[`CMAKE_MSVC_RUNTIME_LIBRARY`](https://cmake.org/cmake/help/git-stage/variable/CMAKE_MSVC_RUNTIME_LIBRARY.html)
> This variable has effect only when policy [`CMP0091`](https://cmake.org/cmake/help/git-stage/policy/CMP0091.html#policy:CMP0091 "CMP0091") is set to `NEW` prior to the first [`project()`](https://cmake.org/cmake/help/git-stage/command/project.html#command:project "project") or [`enable_language()`](https://cmake.org/cmake/help/git-stage/command/enable_language.html#command:enable_language "enable_language") command that enables a language using a compiler targeting the MSVC ABI.

```cmake
cmake_minimum_required(VERSION 3.15)

project(external)

# Release CRT: set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
```

[`MSVC_RUNTIME_LIBRARY`](https://cmake.org/cmake/help/latest/prop_tgt/MSVC_RUNTIME_LIBRARY.html)

Static:
```cmake
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
```
```cmake
set_property(TARGET foo PROPERTY
    MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>"
)
```

[visual studio - Setting the MSVC runtime in CMake - Stack Overflow](https://stackoverflow.com/questions/10113017/setting-the-msvc-runtime-in-cmake)
