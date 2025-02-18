# MSBuild
[Wikipedia](https://en.wikipedia.org/wiki/MSBuild)

> Microsoft Build Engine, better known as MSBuild, is a free and open-source build tool set for managed code as well as native C++ code and was part of .NET Framework.

[MSBuild - Visual Studio | Microsoft Docs](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild?view=vs-2019)

[Walkthrough: Using MSBuild to Create a Visual Studio C++ Project | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/walkthrough-using-msbuild-to-create-a-visual-cpp-project?view=msvc-170)

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

## [vswhere](https://github.com/microsoft/vswhere)
> Locate Visual Studio 2017 and newer installations

- `C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe`
- [Find MSBuild](https://github.com/microsoft/vswhere/wiki/Find-MSBuild)
  ```pwsh
  $msbuild = vswhere -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe | select-object -first 1
  if ($msbuild) {
    & $msbuild $args
  }
  ```

[Examples - microsoft/vswhere Wiki](https://github.com/Microsoft/vswhere/wiki/Examples)

## CLI
[Use the Microsoft C++ toolset from the command line | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line)

[c++ - How do I compile a Visual Studio project from the command-line? - Stack Overflow](https://stackoverflow.com/questions/498106/how-do-i-compile-a-visual-studio-project-from-the-command-line)

### MSBuild
[MSBuild on the command line - C++ | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/msbuild-visual-cpp)
- Can only specify a `sln` or `vcproj` file

- When specifying a `vcproj` file
  - `$(SolutionDir)` will not be available
    - `/p:SolutionDir=$PSScriptRoot`

    [.net - $(SolutionDir) MSBuild property incorrect when running Sandcastle Help File Builder via CMD - Stack Overflow](https://stackoverflow.com/questions/32435599/solutiondir-msbuild-property-incorrect-when-running-sandcastle-help-file-buil)

  - `/p:Configuration` will also affect referenced projects

    [Configuration for ProjectReference in MSBuild - Stack Overflow](https://stackoverflow.com/questions/6624168/configuration-for-projectreference-in-msbuild)

    [visual studio 2010 - msbuild a project referencing projects with different configurations - Stack Overflow](https://stackoverflow.com/questions/11192694/msbuild-a-project-referencing-projects-with-different-configurations)

- Macros
  - `$env:CL='/D*'` (lower priority than `PreprocessorDefinitions`)
  - `ClCompile/AdditionalOptions`
    ```xml
    <ClCompile>
      <AdditionalOptions>$(ExternalCompilerOptions) ... </AdditionalOptions>
    </ClCompile>
    ```

  [c++ - MSBuild: set a specific preprocessor #define in the command line - Stack Overflow](https://stackoverflow.com/questions/166474/msbuild-set-a-specific-preprocessor-define-in-the-command-line)

  [c++ - Adding preprocessor to CL in command line and build \*.sln by MSBuild - Stack Overflow](https://stackoverflow.com/questions/65927984/adding-preprocessor-to-cl-in-command-line-and-build-sln-by-msbuild)

- `OutDir`
  - `/p:ConfigurationName=""` + `$(ConfigurationName)`

```pwsh
# $root = "$PWD\"
$root = "$PSScriptRoot\"

$vswhere = 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe'
$msbuild = & $vswhere -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe
Write-Host $msbuild

# $env:CL = ''
# $env:LINK = ''
& $msbuild Test/Test.vcxproj /p:SolutionDir=$root /p:Configuration="Release" /p:Platform=x64
if (!$?) { throw "Build failed" }
# $env:CL = ''
# $env:LINK = ''
```

### Environment variables
> The MSVC command-line tools use the `PATH`, `TMP`, `INCLUDE`, `LIB`, and `LIBPATH` environment variables, and also use other environment variables specific to your installed tools, platforms, and SDKs. Even a simple Visual Studio installation may set twenty or more environment variables. This complexity is why we strongly recommend that you use a [developer command prompt shortcut](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#developer_command_prompt_shortcuts) or one of the [customized command files](https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#developer_command_file_locations). We don't recommend you set these variables in the Windows environment yourself.

- [CL environment variables](https://learn.microsoft.com/en-us/cpp/build/reference/cl-environment-variables?view=msvc-170)
- [LINK environment variables](https://learn.microsoft.com/en-us/cpp/build/reference/linking?view=msvc-170#link-environment-variables)

Libraries:
- Rust: [vcvars-rs: Provides build scripts access to the environment variables set by vcvars](https://github.com/Enyium/vcvars-rs)
  - `cmd vcvarsall.bat x86_64 && echo.====_unique_separator && set`
- PowerShell: [VCVars: Add, Push, or Pop Visual C++ environment variables to your system PATH](https://github.com/bruxisma/VCVars)

> Starting in Visual Studio 2019 version 16.5, MSBuild and DEVENV don't use the command-line environment to control the toolset and libraries used.
- [c++ - MSBuild - Cannot open include file (despite listed in the INCLUDE list ) - Stack Overflow](https://stackoverflow.com/questions/38744475/msbuild-cannot-open-include-file-despite-listed-in-the-include-list)

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