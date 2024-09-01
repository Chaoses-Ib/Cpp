# [Initialization](https://en.cppreference.com/w/cpp/language/initialization)
## 整数初始化
整数也可以用 `int num(123);` 的方式初始化  
以及列表初始化：`int num = {123};` 和 `int num{123};`（空大括号被认为是0）

## [Default initialization](https://en.cppreference.com/w/cpp/language/default_initialization)
```cpp
T object;
new T
```
- 拥有自动存储、动态存储的对象会拥有不确定的值
  - 是否在构造函数中初始化成员，会造成不同的结果
- 拥有静态存储、线程存储的对象会进行零初始化

```cpp
int i;
int i();
int i = int();
int *p = new int;
int *p = new int();
```
<details>

? 0 0 ? 0
</details>

[C++手稿：哪些变量会自动初始化？ | Harttle Land](https://harttle.land/2015/10/05/cpp-variable-init.html)

## [Value initialization](https://en.cppreference.com/w/cpp/language/value_initialization)
```cpp
T ()
new T ()
Class::Class(...) : member () { ... }
T object {};
T {}
new T {}
Class::Class(...) : member {} { ... }	
```

## [Direct initialization](https://en.cppreference.com/w/cpp/language/direct_initialization)
```cpp
T object ( arg );
T object ( arg1, arg2, ... );

// Initialization of an object of non-class type with a single brace-enclosed initializer (note: for class types and other uses of braced-init-list, see list-initialization)
T object { arg };

T ( other )
T ( arg1, arg2, ... )

static_cast< T >( other )

new T( args, ... )

Class::Class() : member( args, ... ) { ... }

[arg]() { ... }
```
可能会被误解析为函数声明，例如：
```cpp
// Function declaration
DB db(std::string(get_db_path()));
DB db(std::string get_db_path());

// Direct initialization
DB db((std::string)get_db_path());
DB db{std::string(get_db_path())};
```

## [List initialization](https://en.cppreference.com/w/cpp/language/list_initialization)
[c++ - What are the advantages of list initialization (using curly braces)? - Stack Overflow](https://stackoverflow.com/questions/18222926/what-are-the-advantages-of-list-initialization-using-curly-braces)

## 全局初始化
[VC++全局变量初始化 - hanford - 博客园](https://www.cnblogs.com/hanford/p/6027963.html)

## 类型推断
`auto`  
（C++11）

## 填充问题
[initialization - How to initialise memory with new operator in C++? - Stack Overflow](https://stackoverflow.com/questions/2204176/how-to-initialise-memory-with-new-operator-in-c)
1. `new int[10]();`
2. `fill_n()`
3. `memset()`

## 自引用初始化
只要存储空间还在，不论生命期是否开始或结束，都可以使用对象的地址。

> Similarly, before the lifetime of an object has started but after the storage which the object will occupy has been allocated or, after the lifetime of an object has ended and before the storage which the object occupied is reused or released, any glvalue that refers to the original object may be used but only in limited ways. For an object under construction or destruction, see 12.7. Otherwise, such a glvalue refers to allocated storage (3.7.4.2), and using the properties of the glvalue that do not depend on its value is well-defined. The program has undefined behavior if:
> 
> - an lvalue-to-rvalue conversion (4.1) is applied to such a glvalue,
> - the glvalue is used to access a non-static data member or call a non-static member function of the object, or
> - the glvalue is bound to a reference to a virtual base class (8.5.3), or
> - the glvalue is used as the operand of a dynamic\_cast (5.2.7) or as the operand of typeid.

[c++ - Construct object with itself as reference? - Stack Overflow](https://stackoverflow.com/questions/4368361/construct-object-with-itself-as-reference)  
[class - Is passing a C++ object into its own constructor legal? - Stack Overflow](https://stackoverflow.com/questions/32608458/is-passing-a-c-object-into-its-own-constructor-legal)

使用静态成员：
```cpp
#include <iostream>
#include <fstream>
#include <string>
 
int main() {
  std::string filename = "test.bin";
  std::fstream s(filename, s.binary | s.trunc | s.in | s.out);  //!
  if (!s.is_open()) {
    std::cout << "failed to open " << filename << '\n';
  } else {
    // write
    double d = 3.14;
    s.write(reinterpret_cast<char*>(&d), sizeof d); // binary output
    s << 123 << "abc";                              // text output
 
    // for fstream, this moves the file position pointer (both put and get)
    s.seekp(0);
 
    // read
    s.read(reinterpret_cast<char*>(&d), sizeof d); // binary input
    int n;
    std::string str;
    if (s >> n >> str)                             // text input
      std::cout << "read back from file: " << d << ' ' << n << ' ' << str << '\n';
  }
}
```