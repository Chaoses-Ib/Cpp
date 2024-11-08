# MSBuild
[Wikipedia](https://en.wikipedia.org/wiki/MSBuild)

> Microsoft Build Engine, better known as MSBuild, is a free and open-source build tool set for managed code as well as native C++ code and was part of .NET Framework.

[MSBuild - Visual Studio | Microsoft Docs](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild?view=vs-2019)

- [ ] [.vcxproj and .props file structure | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/build/reference/vcxproj-file-structure?view=msvc-160)

## Distribution
- VS

  [bycloudai/InstallVSBuildToolsWindows: Tutorial on how to install Microsoft C++ Build Tools](https://github.com/bycloudai/InstallVSBuildToolsWindows)

- Build Tools for Visual Studio

  [Download Visual Studio Tools - Install Free for Windows, Mac, Linux](https://visualstudio.microsoft.com/downloads/)

  ```pwsh
  Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vs_BuildTools.exe' -OutFile "$env:TEMP\vs_BuildTools.exe"

  & "$env:TEMP\vs_BuildTools.exe" --passive --wait --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --remove Microsoft.VisualStudio.Component.VC.CMake.Project	
  ```

- [Download MSVC compiler/linker & Windows SDK without installing full Visual Studio](https://gist.github.com/mmozeiko/7f3162ec2988e81e56d5c4e22cde9977)

- Scoop
  - [legion-labs/scoop-bucket: Legion Labs scoop bucket](https://github.com/legion-labs/scoop-bucket)

  [\[Request\] Add Microsoft Visual C++ Build Tools - Issue #1861 - ScoopInstaller/Extras](https://github.com/ScoopInstaller/Extras/issues/1861)

- Chocolatey
  - [Chocolatey Software | Visual C++ Build Tools 2017 15.0.26228.20170424](https://community.chocolatey.org/packages/visualcpp-build-tools)
  - [Chocolatey Software | Visual Studio 2019 Build Tools 16.11.41](https://community.chocolatey.org/packages/visualstudio2019buildtools)

- [windows-build-tools: :package: Install C++ Build Tools for Windows using npm](https://github.com/felixrieseberg/windows-build-tools)

[winapi - Can I download the Visual C++ Command Line Compiler without Visual Studio? - Stack Overflow](https://stackoverflow.com/questions/22290501/can-i-download-the-visual-c-command-line-compiler-without-visual-studio)

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