# Functions
- C++ 的求值顺序是未规定的，由编译器自己安排，`f(a(), b())` 可能先求 b，也可能先求 a

## [Default arguments](https://en.cppreference.com/w/cpp/language/default_arguments)
```cpp
int func(int a, int b = 1, int c = 2);
```

- 原型指定默认参数就够了，定义不需要
  - *每个文件都可以为函数指定不同的默认参数*
  - 如果原型没有默认参数，定义有，会提示“函数不接受0个参数”
  - 如果原型和定义指定的默认参数不同，*且在同一文件中*，则会提示“重定义默认参数”
  - 含默认参数地声明多次同一函数时，会提示“重定义默认参数”，即使各次的默认参数一样（而只有一个含时不提示）
  - 同时声明和定义时，默认参数有效

- 默认参数必须从右向左添加

- 调用的时候不能跳过某个参数

- *默认参数可以是任何表达式，包括调用*

## Type traits
```cpp
#include <type_traits>

class C {
public:
    static void A();
    void B();
};

int main() {
    bool a = std::is_function_v<decltype(main)>;
    bool b = std::is_function_v<std::remove_pointer<decltype(&main)>::type>;
    bool c = std::is_function_v<std::remove_pointer<decltype(&C::A)>::type>;
    bool d = std::is_member_function_pointer_v<decltype(&C::B)>;

    bool e = std::is_function_v<decltype([](){})>;  // false
    bool f = std::is_member_function_pointer_v<decltype([](){})>;  // false
}
```

## Binding
函数名联编（binding）：将代码中的函数调用解释为执行特定函数的代码块

- 静态联编（早期联编）
  
  效率更高

- 动态联编（晚期联编）