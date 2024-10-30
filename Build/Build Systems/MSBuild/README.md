# MSBuild
[MSBuild - Visual Studio | Microsoft Docs](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild?view=vs-2019)

- [ ] [.vcxproj and .props file structure | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/build/reference/vcxproj-file-structure?view=msvc-160)

## .props
- 相对路径
  ```xml
  $(MSBuildThisFileDirectory)
  ```
  ```xml
  <PropSheetPath>$([System.IO.Path]::GetFullPath('$(MSBuildThisFileDirectory)'))</PropSheetPath>
  ```
  [c++ - Include path relative to props file in visual studio - Stack Overflow](https://stackoverflow.com/questions/44386059/include-path-relative-to-props-file-in-visual-studio)



[MSBuild - Wikipedia](https://en.wikipedia.org/wiki/MSBuild)

Microsoft Build Engine, better known as MSBuild, is a free and open-source build tool set for managed code as well as native C++ code and was part of .NET Framework.