# MSBuild
[Wikipedia](https://en.wikipedia.org/wiki/MSBuild)

> Microsoft Build Engine, better known as MSBuild, is a free and open-source build tool set for managed code as well as native C++ code and was part of .NET Framework.

[MSBuild - Visual Studio | Microsoft Docs](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild?view=vs-2019)

- [ ] [.vcxproj and .props file structure | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/build/reference/vcxproj-file-structure?view=msvc-160)

## CLI
[Use the Microsoft C++ toolset from the command line | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line)

[MSBuild on the command line - C++ | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/msbuild-visual-cpp)

[c++ - How do I compile a Visual Studio project from the command-line? - Stack Overflow](https://stackoverflow.com/questions/498106/how-do-i-compile-a-visual-studio-project-from-the-command-line)

### Environment variables
> The MSVC command-line tools use the `PATH`, `TMP`, `INCLUDE`, `LIB`, and `LIBPATH` environment variables, and also use other environment variables specific to your installed tools, platforms, and SDKs. Even a simple Visual Studio installation may set twenty or more environment variables. This complexity is why we strongly recommend that you use a [developer command prompt shortcut](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#developer_command_prompt_shortcuts) or one of the [customized command files](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#developer_command_file_locations). We don't recommend you set these variables in the Windows environment yourself.

- [CL environment variables](https://learn.microsoft.com/en-us/cpp/build/reference/cl-environment-variables?view=msvc-170)
- [LINK environment variables](https://learn.microsoft.com/en-us/cpp/build/reference/linking?view=msvc-170#link-environment-variables)

Libraries:
- Rust: [vcvars-rs: Provides build scripts access to the environment variables set by vcvars](https://github.com/Enyium/vcvars-rs)
  - `cmd vcvarsall.bat x86_64 && echo.====_unique_separator && set`
- PowerShell: [VCVars: Add, Push, or Pop Visual C++ environment variables to your system PATH](https://github.com/bruxisma/VCVars)

> Starting in Visual Studio 2019 version 16.5, MSBuild and DEVENV don't use the command-line environment to control the toolset and libraries used.

### Libraries
Rust:
- [msbuild](https://docs.rs/msbuild/0.1.0/msbuild/struct.MsBuild.html)
  - `C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe`

[MSBuild integration - Issue #306 - microsoft/windows-rs](https://github.com/microsoft/windows-rs/issues/306)

## .props
- 相对路径
  ```xml
  $(MSBuildThisFileDirectory)
  ```
  ```xml
  <PropSheetPath>$([System.IO.Path]::GetFullPath('$(MSBuildThisFileDirectory)'))</PropSheetPath>
  ```
  [c++ - Include path relative to props file in visual studio - Stack Overflow](https://stackoverflow.com/questions/44386059/include-path-relative-to-props-file-in-visual-studio)

## Tools
- [cargo-vs: autogenerate visual studio solutions / projects](https://github.com/MaulingMonkey/cargo-vs)