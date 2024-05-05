# CMake
[`add_subdirectory()`](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
- `cmake_minimum_required()` in the subdirectory will be ignored?

## `CMakeSettings.json`
[CMakePresets.json vs CMakeSettings.json vs CMakeLists.txt - Stack Overflow](https://stackoverflow.com/questions/75143040/cmakepresets-json-vs-cmakesettings-json-vs-cmakelists-txt)

[⚙ D53775 \[git/svn\] Ignore Visual Studio's CMakeSettings.json.](https://reviews.llvm.org/D53775)
> When using Visual Studio's built-in support for CMake, the `CMakeSettings.json` contains the build configurations (build dir, generator, toolchain, cmake variables, etc). It is specific to the build machine, therefore should not be versioned.