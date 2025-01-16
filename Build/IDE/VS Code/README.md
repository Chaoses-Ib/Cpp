# [VS Code](https://github.com/Chaoses-Ib/ComputerSoftware/blob/main/Programming/IDEs/Visual%20Studio%20Code/README.md)
[microsoft/vscode-cpptools: Official repository for the Microsoft C/C++ extension for VS Code.](https://github.com/microsoft/vscode-cpptools)

## Data
Cache:
- `C_Cpp.intelliSenseCachePath`

  > Defines the folder path for cached precompiled headers used by IntelliSense. The default cache path is `%LocalAppData%/Microsoft/vscode-cpptools` on Windows, `$XDG_CACHE_HOME/vscode-cpptools/` on Linux (or `$HOME/.cache/vscode-cpptools/` if `XDG_CACHE_HOME` is not defined), and `$HOME/Library/Caches/vscode-cpptools/` on macOS. The default path will be used if no path is specified or if a specified path is invalid.

  `C_Cpp.intelliSenseCacheSize`: `5120` MB by default
  - Only includes `vscode-cpptools/ipch`?
  
  [VSCode-Cpptools/ipch/folders. should i delete them? or are they necessary everytime i use it? - microsoft/vscode-cpptools - Discussion #10637](https://github.com/microsoft/vscode-cpptools/discussions/10637)

  [visual studio code - Is it safe to delete ~/.cache/vscode-cpptools in vscode? - Stack Overflow](https://stackoverflow.com/questions/78300434/is-it-safe-to-delete-cache-vscode-cpptools-in-vscode)