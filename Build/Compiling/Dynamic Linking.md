# Dynamic Linking
## Importing
### MSVC: [__declspec(dllimport)](https://learn.microsoft.com/en-us/cpp/cpp/dllexport-dllimport)
Annotating calls by using the `__declspec(dllimport)` can make them faster. `__declspec(dllimport)` is always required to access exported DLL data.

Without `__declspec(dllimport)`, given this code:
```c
int main(void)
{
    func1();
}
```
the compiler generates code that looks like this:
```x86asm
call func1
```
and the linker translates the call into something like this:
```x86asm
call 0x4000000         ; The address of 'func1'.
```

If `func1` exists in another DLL, the linker can't resolve this address directly because it has no way of knowing what the address of `func1` is. The linker generates a thunk at a known address looks like this:
```x86asm
0x40000000:    jmp DWORD PTR __imp_func1
```
Here `__imp_func1` is the address for the `func1` slot in the import address table of the executable file. All these addresses are known to the linker. The loader only has to update the executable file's import address table at load time for everything to work correctly.

That's why using `__declspec(dllimport)` is better: because the linker doesn't generate a thunk if it's not required. Thunks make the code larger (on RISC systems, it can be several instructions) and can degrade your cache performance. If you tell the compiler the function is in a DLL, it can generate an indirect call for you.

So now this code:
```c
__declspec(dllimport) void func1(void);
int main(void)
{
   func1();
}
```
generates this instruction:
```cx86asm
call DWORD PTR __imp_func1
```
There's no thunk and no jmp instruction, so the code is smaller and faster. You can also get the same effect without `__declspec(dllimport)` by using [whole program optimization](Optimization.md#whole-program-optimization).

For function calls within a DLL, you don't want to have to use an indirect call. A direct call is always faster and smaller. You only want to use `__declspec(dllimport)` when calling DLL functions from outside the DLL itself. Don't use `__declspec(dllimport)` on functions inside a DLL when building that DLL.[^dllimport]

[^dllimport]: [Importing function calls using __declspec(dllimport) | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/build/importing-function-calls-using-declspec-dllimport)

## Exporting
### [MSVC](https://learn.microsoft.com/en-us/cpp/build/exporting-from-a-dll)
- [__declspec(dllexport)](https://learn.microsoft.com/en-us/cpp/cpp/dllexport-dllimport)
- [DEF files](https://learn.microsoft.com/en-us/cpp/build/exporting-from-a-dll-using-def-files)
- [/EXPORT](https://learn.microsoft.com/en-us/cpp/build/reference/export-exports-a-function)