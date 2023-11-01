# [Lambda Expressions](https://en.cppreference.com/w/cpp/language/lambda)
```cpp
std::count_if(v.begin(), v.end(),
    [](int x) {return x % 3 == 0;} );
```
- 参数是可选的：`[]{return 123;}`

- 有多个 `return` 语句时，不能自动推断类型，需要用返回类型后置语法指定：

  ```cpp
  [](int x)->bool {return x % 3 == 0;}
  ```

- 也可以给 lambda 函数指定名称：

  ```cpp
  auto f3 = [](int x){return x % 3 ==0};
  ```

  使用时可以就像普通函数：`bool b = f3(7);`

- 可以访问作用域内的其它动态变量：

  ```cpp
  int count = 0;
  std::for_each(v.begin(), v.end(),
      [&count](int x){cout += x % 13 ==0;} );
  ```

  `[=]` 按值访问所有动态变量，`[&]` 按引用访问所有动态变量

  用逗号分隔，如：`[n1, &count]`、`[=, &count]`

## Generic lambda (C++14)
auto ➡ template

[c++ - How does generic lambda work in C++14? - Stack Overflow](https://stackoverflow.com/questions/17233547/how-does-generic-lambda-work-in-c14)

## Template lambda (C++20)
[More Powerful Lambdas with C++20 - ModernesCpp.com](https://www.modernescpp.com/index.php/more-powerful-lambdas-with-c-20)

## `mutable`
[c++ lambda 表达式里 为什么值捕获的局部变量无法修改？ - V2EX](https://www.v2ex.com/t/838315)

## Generalized lambda capture (C++14)
```cpp
std::thread([v = std::move(v)] {
    f(v);
});
```
注意，lambda 的捕获是 const 的，要加 mutable 才能修改。

[c++ - Move capture in lambda - Stack Overflow](https://stackoverflow.com/questions/8640393/move-capture-in-lambda)

### lambda 递归问题
- `std:function`

  有额外开销？

  ```cpp
  function<void()>f=[&f]{cout<<"Hello ";f();};f();
  ```
  or
  ```cpp
  function<void(ostream&)>f=[&f](auto&o){f(o<<"Hello ");};f(cout);
  ```

- 函数参数

  ```cpp
  auto f = [] {
      auto f_impl = [](auto& f_ref)->void {
          f_ref(f_ref);
      };
      f_impl(f_impl);
  };
  ```
  ```cpp
  auto f=[](auto&f)->void{cout<<"Hello ";f(f);};f(f);
  ```

- Y combinator

  用模板自动构造函数参数

- static

  ```cpp
  void f()
  {
      static int (*self)(int) = [](int i)->int { return i>0 ? self(i-1)*i : 1; };
      std::cout<<self(10);
  }
  ```
  （不加 `static` 而用 `[&f]` 是不行的，无状态的 lambda 才可以转换为函数指针）

[c++ - Recursive lambda functions in C++11 - Stack Overflow](https://stackoverflow.com/questions/2067988/recursive-lambda-functions-in-c11)

## Immediately invoked function expressions
[Uses of Immediately Invoked Function Expressions (IIFE) in C++ | Erik Rigtorp](https://rigtorp.se/iife/)
- [r/cpp](https://www.reddit.com/r/cpp/comments/i290wo/uses_of_immediately_invoked_function_expressions/)

1. 复杂初始化
2. 把代码段打入冷宫
3. `int main(){[](){}();}`

See also [statement expressions](../Statements/README.md#statement-expressions).