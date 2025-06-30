# Linking
## Linkers
- [MSVC](https://docs.microsoft.com/en-us/cpp/build/reference/linking)

## Link-time code generation
MSVC: [/LTCG](https://learn.microsoft.com/en-us/cpp/build/reference/ltcg-link-time-code-generation)

## Auto-linking
Auto-linking is a mechanism for automatically determining which libraries to link to while building a C, C++ or Obj-C program.[^auto-wiki]

- MSVC: Default libraries
  - [CRT](https://learn.microsoft.com/en-us/cpp/c-runtime-library/crt-library-features#c-standard-library-stl-lib-files): `msvcprt(d).lib` or `libcpmt(d).lib`
  - [#pragma comment(lib, "NAME")](https://docs.microsoft.com/en-us/cpp/preprocessor/comment-c-cpp#lib)  
    The linker searches for this library the same way as if you specified it on the command line, as long as the library isn't specified by using [/NODEFAULTLIB](https://docs.microsoft.com/en-us/cpp/build/reference/nodefaultlib-ignore-libraries).

  Disable:
  - [/NODEFAULTLIB](https://learn.microsoft.com/en-us/cpp/build/reference/nodefaultlib-ignore-libraries?view=msvc-170)
  - [/Zl: Omit Default Library Name](https://learn.microsoft.com/en-us/cpp/build/reference/zl-omit-default-library-name)
- MSVC & [vcpkg](https://github.com/microsoft/vcpkg): AutoLink  
  Automatic linking with libraries build using vcpkg.

  Note that AutoLink can sometimes cause confusing linking errors. For example, if you installed Boost.Test in vcpkg and accidentally write `WinMain()` but not `main()` for a console subsystem program, MSVC will link Boost.Test since it provides `main()`. Moreover, Boost.Test's `main()` will call `init_unit_test_suite()` and eventually lead to an unresolved external symbol error for `init_unit_test_suite()` instead of `main()`. In such cases, passing [/VERBOSE](https://docs.microsoft.com/en-us/cpp/build/reference/verbose-print-progress-messages) to the linker will help diagnose it. You will see something like this:
  ```
  Searching C:\vcpkg\installed\x64-windows-static-md\debug\lib\boost_unit_test_framework-vc140-mt-gd.lib:
  Found main
    Referenced in MSVCRTD.lib(exe_main.obj)
    Loaded boost_unit_test_framework-vc140-mt-gd.lib(unit_test_main.obj)
  ```

[^auto-wiki]: [Auto-linking - Wikipedia](https://en.wikipedia.org/wiki/Auto-linking)

## Entry point
- MSVC: [/ENTRY](https://learn.microsoft.com/en-us/cpp/build/reference/entry-entry-point-symbol), [/NOENTRY](https://learn.microsoft.com/en-us/cpp/build/reference/noentry-no-entry-point)