# [Classes](https://en.cppreference.com/w/cpp/language/classes)
- 在类声明外定义成员函数时，需要用作用域解析运算符来标识函数所属的类

  例如：
  ```cpp
  int Myclass::func(int a){}
  ```
  （没法省略？）

- 定义位于类声明中的函数默认会被*内联*

- 结构与类的唯一区别是，结构的默认访问类型是 `public`，而类是 `private`

- `const` 方法：

  ```cpp
  void myclass:func() const;
  ```

- 如果两个方法有相互引用，就不能在类里同时定义它们？
  
  ```cpp
  class abc {
  public:
    void f1() {
      int a;
      cin >> a;
      if (a) f2();
    }
    void f2() {
      int a;
      cin >> a;
      if (a) f1();
    }
  };

  int main()
  {
    abc ab;
    ab.f1();
  }
  ```
  并不是

## [Static members](https://en.cppreference.com/w/cpp/language/static)

- 静态类成员与对象无关，所有对象共用一个

  只能在类外初始化：`int myclass::mem = 0;`（除非是 `const` 整型（或 `enum`））
  - 静态引用，不需要实例化

- 静态类方法
  - 如果函数定义是独立的，那么不能加 `static`
  - 不能通过对象调用，也就是说无法使用 `this`，无法使用（非静态）成员

## 默认成员函数
1. 默认构造函数
2. 默认析构函数
3. 复制构造函数
4. 赋值运算符
5. 地址运算符

移动构造函数、移动赋值运算符

## [Forward declarations](https://en.cppreference.com/w/cpp/language/class)
前向声明只能用来定义参数/指针，不能用来实例化、调用方法。

[c++ - Invalid use of incomplete type struct, even with forward declaration - Stack Overflow](https://stackoverflow.com/questions/5543331/invalid-use-of-incomplete-type-struct-even-with-forward-declaration)

[C++ class forward declaration - Stack Overflow](https://stackoverflow.com/questions/9119236/c-class-forward-declaration)