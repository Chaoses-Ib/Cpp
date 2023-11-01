# Constructors
```cpp
myclass::myclass(int a){…};
```

- 要声明为 `public`

- 没有返回值类型

- 参数名不能和成员名相同

  有两种命名方法来避免这种情况：
  - 成员名添加 `m_` 前缀
  - 成员名添加 `_` 后缀

  （修改参数名也可以，然而这违反了内部隐藏原则，不优雅）

- 默认构造函数：

  `mycalsss::myclass(){}`

  列表初始化按顺序填充 `public` 数据成员

  如果提供了构造函数，那么默认构造函数就需要手动提供

  有两种方法：
  - 给提供的构造函数的所有参数提供默认值

    `myclass::myclass(int a = 0);`

  - 再单独写一个默认构造函数

    `myclass::myclass(){…};`

    通常应提供一个默认构造函数来初始化成员

- 四种调用方式：
  - `myclass c = myclass(123);`

    - `myclass *c = new myclass(123);`

    C++ 允许编译器用两种方法执行它：
    - 直接构造
    - 先构造一个临时对象，然后将它复制到 c 中，再销毁临时对象（时机不定）

  - `myclass c(123);`

    不要不提供值，那样不会调用默认构造，而是会把它当成函数声明

  - `myclass c{123};`

  - `myclass c = 123;`

    只适用于单参数构造函数（或者为其它所有参数提供默认值）

    可用来完成隐式转换（除非在构造函数前加 `explicit`）

## 构造函数模板参数
构造函数没法指定模板参数，最多只能传 tag 值。

所以才需要 make 函数？

[c++ - Can the template parameters of a constructor be explicitly specified? - Stack Overflow](https://stackoverflow.com/questions/2861839/can-the-template-parameters-of-a-constructor-be-explicitly-specified)

## Initializer lists
- 成员初始化列表
  
  ```cpp
  myclass::myclass(int a, int b) : a_(a), b_(b) {…}
  ```
  相比在代码块中初始化：
  - 能初始化 `const` 成员
  - 能初始化引用成员
  - 初始化顺序只按照成员声明顺序，与初始化列表中的书写顺序无关（？）
  - 执行效率更高（？）

  （只能用于构造函数）

- 委托构造函数
  
	在一个构造函数定义中使用另一个构造函数
  ```cpp
  myclass::myclass(int a, double b) : a_(a), b_(b)
      {…}
  myclass::myclass() : myclass(0, 0.01) {…}
  myclass::myclass(int a) : myclass(a, 0.01) {…}
  ```

- 继承构造函数
  
  让派生类能够继承基类构造函数

  ```cpp
  class child : public father{
  public:
      using father::father; //但不继承默认构造函数、复制构造函数、移动构造函数
      child() : father(1, 2), mem(3) {…}
  }
  ```

[C++, What does the colon after a constructor mean? - Stack Overflow](https://stackoverflow.com/questions/2785612/c-what-does-the-colon-after-a-constructor-mean)

## 构造函数失败问题
- 抛出异常
- 传参返回结果
- 二段构造（在 init 方法中初始化）

  违反了 RAII

[C++构造函数失败_wonder - CSDN 博客](https://blog.csdn.net/qq_16209077/article/details/52759994)

[c++中，如果构造函数构造失败，如何终止并且不创建对象？ - 知乎](https://www.zhihu.com/question/349937913)

[C++ new失败的处理 - LonelyEnvoy - 博客园](https://www.cnblogs.com/LonelyEnvoy/p/5865832.html)

## [Copy constructors](https://en.cppreference.com/w/cpp/language/copy_constructor)
- 将一个对象复制到新创建的对象中

  它用于初始化、按值传递参数、返回值，但不用于赋值

  - `myclass c2(c1);`
  - `myclass c2 = c1;`
  - `myclass c2 = myclass(c1);`
  - `myclass *c2 = new myclass(c1);`

- 默认复制构造函数：

  `myclass(const myclass &);`

  直接复制所有（非静态）成员

  相当于 `c2.mem = c1.mem;`

  （如果成员是类，则会调用它的复制构造函数来复制）

## [Copy assignment operator](https://en.cppreference.com/w/cpp/language/copy_assignment)
```cpp
myclass& myclass::operator=(const myclass &);
```

- 用 `=` 初始化时，可能调用赋值运算符，也可能不会（取决于是否有临时对象）

- `c3 = c2 = c1;` 即 `c3.operator=( c2.operator=(c1) );`

- ```cpp
  myclass& myclass::operaotr=(const myclass& c){
      if(this == &c) return *this; //要检查自我赋值，以防止释放后无法复制
      delete [] str; //因为被赋值的对象可能不是空的
      len = c.len;
      str = new char [len+1];
      strcpy(str, c.str);
      return *this; //返回的是引用
  }
  ```

- 析构问题

  `this->~class();` ？

- `const` 成员问题

  有 `const` 成员本来就不该支持赋值？

  [c++ - const member and assignment operator. How to avoid the undefined behavior? - Stack   Overflow](https://stackoverflow.com/questions/4136156/const-member-and-assignment-operator-how-to-avoid-the-undefined-behavior)