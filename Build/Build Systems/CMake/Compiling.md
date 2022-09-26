# Compiling
## Options
### [CMAKE_\<LANG\>_FLAGS](https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_FLAGS.html)
`<LANG>` flags used regardless of the value of `CMAKE_BUILD_TYPE`.

- Visual Studio
  ```cmake
  //Flags used by the CXX compiler during all build types.
  CMAKE_CXX_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3 /GR /EHsc
  
  //Flags used by the CXX compiler during DEBUG builds.
  CMAKE_CXX_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1
  
  //Flags used by the CXX compiler during MINSIZEREL builds.
  CMAKE_CXX_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /DNDEBUG
  
  //Flags used by the CXX compiler during RELEASE builds.
  CMAKE_CXX_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG
  
  //Flags used by the CXX compiler during RELWITHDEBINFO builds.
  CMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /DNDEBUG
  ```

  Disable exception handling:
  ```cmake
  add_compile_options(/EHs-c-)
  ```
  or
  ```cmake
  string(REPLACE "/EHsc" "/EHs-c-" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  ```

  Disable runtime type information:
  ```cmake
  add_compile_options(/GR-)
  ```

  Disable runtime error checks:
  ```cmake
  string(REGEX REPLACE "/RTC[^ ]*" "" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
  ```

  <details><summary>Visual Studio 2022</summary>

  ```cmake
  //Flags used by the C compiler during all build types.
  CMAKE_C_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3
  
  //Flags used by the C compiler during DEBUG builds.
  CMAKE_C_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1
  
  //Flags used by the C compiler during MINSIZEREL builds.
  CMAKE_C_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /DNDEBUG
  
  //Flags used by the C compiler during RELEASE builds.
  CMAKE_C_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG
  
  //Flags used by the C compiler during RELWITHDEBINFO builds.
  CMAKE_C_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /DNDEBUG
  ```
  ```cmake
  //Flags used by the CXX compiler during all build types.
  CMAKE_CXX_FLAGS:STRING=/DWIN32 /D_WINDOWS /W3 /GR /EHsc
  
  //Flags used by the CXX compiler during DEBUG builds.
  CMAKE_CXX_FLAGS_DEBUG:STRING=/MDd /Zi /Ob0 /Od /RTC1
  
  //Flags used by the CXX compiler during MINSIZEREL builds.
  CMAKE_CXX_FLAGS_MINSIZEREL:STRING=/MD /O1 /Ob1 /DNDEBUG
  
  //Flags used by the CXX compiler during RELEASE builds.
  CMAKE_CXX_FLAGS_RELEASE:STRING=/MD /O2 /Ob2 /DNDEBUG
  
  //Flags used by the CXX compiler during RELWITHDEBINFO builds.
  CMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=/MD /Zi /O2 /Ob1 /DNDEBUG
  ```
  </details>

The flags in this variable will be passed to the compiler before those in the per-configuration `CMAKE_<LANG>_FLAGS_<CONFIG>` variant, and before flags added by the [add_compile_options()](#add_compile_options) or [target_compile_options()](#target_compile_options) commands.

### [add_compile_options()](https://cmake.org/cmake/help/latest/command/add_compile_options.html)
```cmake
add_compile_options(<option> ...)
```
Adds options to the `COMPILE_OPTIONS` directory property. These options are used when compiling targets from the current directory and below.

### [target_compile_options()](https://cmake.org/cmake/help/latest/command/target_compile_options.html)
```cmake
target_compile_options(<target> [BEFORE]
  <INTERFACE|PUBLIC|PRIVATE> [items1...]
  [<INTERFACE|PUBLIC|PRIVATE> [items2...] ...])
```
Adds options to the `COMPILE_OPTIONS` or `INTERFACE_COMPILE_OPTIONS` target properties. These options are used when compiling the given `<target>`, which must have been created by a command such as `add_executable()` or `add_library()` and must not be an ALIAS target.

## Include directories
### [CMAKE_\<LANG\>_STANDARD_INCLUDE_DIRECTORIES](https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_STANDARD_INCLUDE_DIRECTORIES.html) (3.6)
Include directories to be used for every source file compiled with the `<LANG>` compiler. This is meant for specification of system include directories needed by the language for the current platform. The directories always appear at the end of the include path passed to the compiler.

This variable should not be set by project code. It is meant to be set by CMake's platform information modules for the current toolchain, or by a toolchain file when used with `CMAKE_TOOLCHAIN_FILE`.