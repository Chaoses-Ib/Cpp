# Linking
## Options
### [CMAKE_EXE_LINKER_FLAGS](https://cmake.org/cmake/help/latest/variable/CMAKE_EXE_LINKER_FLAGS.html)
These flags will be used by the linker when creating an executable.

- Visual Studio 2022
  ```cmake
  //Flags used by the linker during all build types.
  CMAKE_EXE_LINKER_FLAGS:STRING=/machine:x64
  
  //Flags used by the linker during DEBUG builds.
  CMAKE_EXE_LINKER_FLAGS_DEBUG:STRING=/debug /INCREMENTAL
  
  //Flags used by the linker during MINSIZEREL builds.
  CMAKE_EXE_LINKER_FLAGS_MINSIZEREL:STRING=/INCREMENTAL:NO
  
  //Flags used by the linker during RELEASE builds.
  CMAKE_EXE_LINKER_FLAGS_RELEASE:STRING=/INCREMENTAL:NO
  
  //Flags used by the linker during RELWITHDEBINFO builds.
  CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO:STRING=/debug /INCREMENTAL
  ```

### [add_link_options()](https://cmake.org/cmake/help/latest/command/add_link_options.html) (3.13)
```cmake
add_link_options(<option> ...)
```
Add options to the link step for executable, shared library or module library targets in the current directory and below that are added after this command is invoked.

### [target_link_options()](https://cmake.org/cmake/help/latest/command/target_link_options.html) (3.13)
```cmake
target_link_options(<target> [BEFORE]
  <INTERFACE|PUBLIC|PRIVATE> [items1...]
  [<INTERFACE|PUBLIC|PRIVATE> [items2...] ...])
```
Add options to the link step for an executable, shared library or module library target.

## [CMAKE_\<LANG\>_STANDARD_LIBRARIES](https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_STANDARD_LIBRARIES.html) (3.6)
Libraries linked into every executable and shared library linked for language `<LANG>`. This is meant for specification of system libraries needed by the language for the current platform.

- Visual Studio
  ```cmake
  //Libraries linked by default with all C/C++ applications.
  CMAKE_<C|CXX>_STANDARD_LIBRARIES:STRING=kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib
  ```
  <details><summary>Visual Studio 2022</summary>
  
  ```cmake
  //Libraries linked by default with all C applications.
  CMAKE_C_STANDARD_LIBRARIES:STRING=kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib
  ```
  ```cmake
  //Libraries linked by default with all C++ applications.
  CMAKE_CXX_STANDARD_LIBRARIES:STRING=kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib
  ```
  </details>

This variable should not be set by project code. It is meant to be set by CMake's platform information modules for the current toolchain, or by a toolchain file when used with `CMAKE_TOOLCHAIN_FILE`. But if you really want to do that[^std-lib-force]:
```cmake
SET(CMAKE_<LANG>_STANDARD_LIBRARIES "a.lib b.lib ..." CACHE STRING "Libraries linked into every executable and shared library linked for language <LANG>." FORCE)
```
<details><summary>C/C++</summary>

```cmake
SET(CMAKE_C_STANDARD_LIBRARIES "a.lib b.lib ..." CACHE STRING "Libraries linked into every executable and shared library linked for C." FORCE)
SET(CMAKE_CXX_STANDARD_LIBRARIES "a.lib b.lib ..." CACHE STRING "Libraries linked into every executable and shared library linked for C++." FORCE)
```
</details>

[^std-lib-force]: [\[CMake\] CMAKE_CXX_STANDARD_LIBRARIES](https://cmake.org/pipermail/cmake/2008-May/021643.html)