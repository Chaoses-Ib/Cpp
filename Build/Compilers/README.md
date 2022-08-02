# Compilers
[List of C++ compilers - Wikipedia](https://en.wikipedia.org/wiki/List_of_compilers#C++_compilers)

## C compilers
[List of C compilers - Wikipedia](https://en.wikipedia.org/wiki/List_of_compilers#C_compilers)

### Tiny C Compiler
[Homepage](https://bellard.org/tcc/)  
[Repository](https://repo.or.cz/w/tinycc.git)

TCC has a number of features that differentiate it from other current C compilers[^tcc-wiki]:
- Small  
  Its small file size (about 100 KB for the x86 TCC executable) and memory footprint allow it to be used directly from a single 1.44 M floppy disk, such as a rescue disk.
- Fast  
  TCC is intended to produce native x86, x86-64 and ARM code very quickly; according to Bellard, it compiles, assembles and links about nine times faster than GCC does.
- Scripting  
  TCC allows programs to be run automatically at compile time using a command-line switch. This allows programs to be run as a shell script under Unix-like systems that support the shebang interpreter directive syntax. With [libtcc](https://repo.or.cz/tinycc.git/blob/HEAD:/libtcc.h), you can also use TCC as a backend for dynamic code generation.

[^tcc-wiki]: [Tiny C Compiler - Wikipedia](https://en.wikipedia.org/wiki/Tiny_C_Compiler)