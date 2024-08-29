# Run-Time Type Information
**Run-time type information (RTTI)** is a mechanism that allows the type of an object to be determined during program execution.[^msvc]

There are four main C++ language elements to run-time type information:
- [dynamic_cast operator](https://en.cppreference.com/w/cpp/language/dynamic_cast)
- [typeid operator](https://en.cppreference.com/w/cpp/language/typeid)
- [type_info class](https://en.cppreference.com/w/cpp/types/type_info)
- [type_index class](https://en.cppreference.com/w/cpp/types/type_index)

## Implementations
> How does `typeid` know what type of object `p` is 
pointing to?
> 
> The answer is surprisingly simple. Since every polymorphic object contains a pointer to a vtable, compilers leverage that fact by co-locating class-type information with the class vtable. Specifically, the compiler places a pointer immediately prior to the class vtable. This pointer points to a structure that contains information used to determine the name of the class that owns the vtable.[^ida]

### MSVC
[/GR (Enable Run-Time Type Information)](https://learn.microsoft.com/en-us/cpp/build/reference/gr-enable-run-time-type-information?view=msvc-170):
- `_CPPRTTI`

Static RTTI:
- `/D_HAS_STATIC_RTTI=0`
  
  Adding `HAS_STATIC_RTTI=0` to Preprocessor Definitions does not work.

  [`JSON_HAS_STATIC_RTTI` - JSON for Modern C++](https://json.nlohmann.me/api/macros/json_has_static_rtti/)

- `warning STL4040: The contents of <any> require static RTTI`

  [c++ - std::any without RTTI, how does it work? - Stack Overflow](https://stackoverflow.com/questions/51361606/stdany-without-rtti-how-does-it-work)

  `BOOST_ASIO_DISABLE_STD_ANY`

- `std::function` also uses

Disable RTTI: `/GR- /D_HAS_STATIC_RTTI=0`
- [Lambdas always have debug information in release mode - Developer Community](https://developercommunity.visualstudio.com/t/lambdas-always-have-debug-information-in-release-m/1215001)

> In Visual C++, the pointer points to a Microsoft `RTTICompleteObjectLocator` structure, which in turn contains a pointer to a `TypeDescriptor` structure. The `TypeDescriptor` structure contains a character array that specifies the name of the polymorphic class.[^ida]

Structures[^igorsk]:
```cpp
struct RTTICompleteObjectLocator
{
    DWORD signature;  // always zero?
    DWORD offset;  // offset of this vtable in complete class (from top)
    DWORD cdOffset;  // offset of constructor displacement
    TypeDescriptor* pTypeDescriptor;  // TypeDescriptor of the complete class
    RTTIClassHierarchyDescriptor* pClassDescriptor;  // describes inheritance hierarchy
};

struct TypeDescriptor
{
    DWORD pVFTable;  // reference to RTTI's vftable
    DWORD spare;  // internal runtime reference
    const char name[];  // type descriptor name
};

struct RTTIClassHierarchyDescriptor
{
    DWORD signature;  // always zero?
    DWORD attributes;  // bit 0 set = multiple inheritance, bit 1 set = virtual inheritance
    DWORD numBaseClasses;  // number of classes in pBaseClassArray
    RTTIBaseClassArray* pBaseClassArray;
};

struct RTTIBaseClassDescriptor
{
    TypeDescriptor* pTypeDescriptor;  // type descriptor of the class
    DWORD numContainedBases;  // number of nested classes following in the Base Class Array
    PMD where;  // pointer-to-member displacement info
    DWORD attributes;  // flags, usually 0
};

struct PMD
{
    int mdisp;  // member displacement
    int pdisp;  // vbtable displacement
    int vdisp;  // displacement inside vbtable
};
```

### GCC
> In g++ code, this pointer points to a `type_info` structure, which contains a pointer to the name of the class.[^ida]

## Binary analysis
[\[Reverse Engineering Tips\] — Run-Time Type Identification | by Thomas Roccia | SecurityBreak](https://blog.securitybreak.io/reverse-engineering-tips-run-time-type-identification-99eaff0c3afb)

- `.?AV`

Tools:
- IDA
  - [ClassInformer](https://github.com/rcx/classinformer-ida7)
  - [RTTI parser](https://github.com/MlsDmitry/better-rtti-parser)
- [Trickster](https://github.com/TheLeftExit/Trickster)

[^msvc]: [Run-Time Type Information | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/cpp/run-time-type-information?view=msvc-170)
[^ida]: The IDA Pro Book
[^igorsk]: [Reversing Microsoft Visual C++ Part II: Classes, Methods and RTTI - OpenRCE](http://www.openrce.org/articles/full_view/23)