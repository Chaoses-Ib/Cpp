# [Pointers to Members](<https://en.cppreference.com/w/cpp/language/pointer#:~:text=the%20same%20function).-,Pointers%20to%20members,-Pointers%20to%20data>)
pointer to member functions (PMF, PTMF), member function pointers (MFP)

[minlux/ptmf: How C++ pointer to member function works](https://github.com/minlux/ptmf)

[Member Function Pointers and the Fastest Possible C++ Delegates - CodeProject](https://www.codeproject.com/Articles/7150/Member-Function-Pointers-and-the-Fastest-Possible)

MSVC:
- [MSVC C++ ABI Member Function Pointers « Rants from Vas](https://rants.vastheman.com/2021/09/21/msvc/)
- [`pointers_to_members` pragma | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/preprocessor/pointers-to-members?view=msvc-170)

## Extracting the Function Pointer from a Bound Pointer to Member Function
PMF 只含有跳板函数的地址，没有虚函数的偏移/地址，在编译器不开洞的情况下只能靠反汇编跳板函数实现。

- GCC: `-Wno-pmf-conversions`
  
  [Bound member functions (Using the GNU Compiler Collection (GCC))](https://gcc.gnu.org/onlinedocs/gcc/Bound-member-functions.html)

  [coolxv/cpp-stub: C++ unit test stub(not mock) and awesome.Surpported ISA x86,x86-64,arm64,arm32,arm thumb,mips64,riscv,loongarch64.](https://github.com/coolxv/cpp-stub/tree/master?tab=readme-ov-file)

- Clang: [Clang will not accept a conversion from a bound pmf(Pointer to member function) to a regular method pointer. Gcc accepts this. - Issue #22495 - llvm/llvm-project](https://github.com/llvm/llvm-project/issues/22495)

[c++ - Print address of virtual member function - Stack Overflow](https://stackoverflow.com/questions/3068144/print-address-of-virtual-member-function)

[Get real address of any function : r/cpp\_questions](https://www.reddit.com/r/cpp_questions/comments/8mlks2/get_real_address_of_any_function/)

[There IS a way of casting pointer-to-member-function to a void\* : r/cpp](https://www.reddit.com/r/cpp/comments/otl2h8/there_is_a_way_of_casting_pointertomemberfunction/)