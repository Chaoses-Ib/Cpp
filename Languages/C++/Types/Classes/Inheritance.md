# [Inheritance](https://en.cppreference.com/w/cpp/language/derived_class)
- 公有继承
- 保护继承
- 私有继承

|  | `public` | `protected` | `private` |
| --- | --- | --- | --- |
| 共有继承 | `public` | `protected` | `private` |
| 私有继承 | `private` | `private` | `private` |
| 保护继承 | `protected` | `protected` | `private` |

[C++继承：公有，私有，保护 - csqlwy - 博客园](https://www.cnblogs.com/qlwy/archive/2011/08/25/2153584.html)

## 公有继承
is-a 关系，派生类对象也是一个基类对象

```cpp
class child : public father {
…
}
```

- 基类的私有成员只能通过基类的公有和保护方法访问
  - 因此，派生类构造函数必须调用基类构造函数
    - 如果没有显式调用基类的构造函数，将会自动调用基类的默认构造函数

      `child() : father() {…}`
    - 析构时首先调用派生类的析构函数，然后调用基类的

  - 调用基类方法：

    ```cpp
    child::func() {
        father::func(); //如果派生类没有重新定义 func，也可以直接调用
    }
    ```

  - 若方法名相同，子类的方法将替换基类的方法（而不是重载）
    - 一般基类与派生类同一方法的原型相同（除了返回类型协变（covariance of return type）：返回类型随类类型变化而变化）
    - 若方法在基类中被重载了，则也应在派生类中定义所有重载

  - `protected`

    派生类可以访问，类外不能访问的成员

    最好只用于成员函数，因为修改成员数据可能会导致意外（考虑到基类在设计时假设外部不能修改成员数据）

- 基类指针可以不经显式转换地指向派生类（upcasting 向上强制转换）

  例如：
  ```cpp
  child child1();
  father *p = &child1;
  ```
  但反过来不行，派生类指针不可以直接指向基类（考虑到基类没有派生类的成员）

  - 因此，操作基类的函数也适用于派生类
  - *可以用子类复制出一个基类*

    ```cpp
    child child1();
    father father1(child); //father(const father&)
    //or
    father1 = child;
    ```

- 多态

  同一方法在基类和派生类中有不同实现，且*使用哪个实现取决于调用该方法的对象*

  - 虚方法

    没有 `virtual`：根据指针类型选择方法

    有 `virtual`：*根据指针指向的对象的类型选择方法*
    - 因为只有基类指针能指向派生类，所以指针类型≈基类

    这意味着，如果用了 `virtual`，就可以让原本调用基类方法的函数，转而调用到派生类的方法；相反的，如果没有 `virtual`，函数调用的仍是它定义的那个类型——基类的方法

    - 使用

      只用在声明中，不用在定义中

    - 虚析构函数

      如果析构函数不是虚的，那就只会调用指针类型——基类的析构函数

      （但构造函数不能是虚的，构造时本身调用的就是派生类的构造函数（然后由它再调用基类的构造函数））

      构造函数不能调用虚函数。

      [c++ - Calling virtual functions inside constructors - Stack Overflow](https://stackoverflow.com/questions/962132/calling-virtual-functions-inside-constructors)

    - 原理

      具体实现由实现决定

      通常是通过增加一个隐藏的方法数组成员，即虚函数表（virtual function table，vtbl）
      - 为虚函数表预留指针空间
      - 创建虚函数表
      - 每次调用虚函数时查表调用

      [How to obtain the address of a vtable without creating the object : r/cpp\_questions](https://www.reddit.com/r/cpp_questions/comments/z55xlh/how_to_obtain_the_address_of_a_vtable_without/)

[C++中關於 virtual 的兩三事. 在 C++ 中，提到物件導向少不了像是 inheritance 或是… | by 一個沒那麼肥的肥宅 | 今天的天空，有點藍 | Medium](https://medium.com/theskyisblue/c-%E4%B8%AD%E9%97%9C%E6%96%BC-virtual-%E7%9A%84%E5%85%A9%E4%B8%89%E4%BA%8B-1b4e2a2dc373)

## Abstract base classes
- 纯虚函数（pure virtual function）

  如：
  ```cpp
  virtual int func() const = 0;
  ```

  包含纯虚函数的类不能实例化为对象

  不过纯虚函数仍可以被定义（在类声明外）

- ~~之所以需要 ABC，是为了解决多继承的问题。如果基类不是纯虚的，继承实现了不同功能的组件时，就会导致基类被多次继承。~~

  Diamond problem 应该用虚继承解决，和纯不纯虚无关。

- 保持所有函数为纯虚的好处是什么？保留一些常用的行为不是很方便吗？

## `final`
不允许被 override。

[比較安全的 C++ 虛擬函式寫法：C++11 override 與 final – Heresy's Space](https://kheresy.wordpress.com/2014/10/03/override-and-final-in-cpp-11/)

[The Performance Benefits of Final Classes | C++ Team Blog](https://devblogs.microsoft.com/cppblog/the-performance-benefits-of-final-classes/)

[When can the C++ compiler devirtualize a call? – Arthur O'Dwyer – Stuff mostly about C++](https://quuxplusone.github.io/blog/2021/02/15/devirtualization/)

## 虚继承
[【C++基础之二十一】菱形继承和虚继承_偶尔e网事-CSDN博客_c++菱形继承](https://blog.csdn.net/jackystudio/article/details/17877219)

## 编译期多态
```cpp
template <typename DerivedT>
class Base {
    DerivedT& derived;
protected:
    Base(DerivedT& derived) : derived(derived) {}
public:
    void print(){
        std::cout << derived.text() << std::endl;
    }
};

class Derived : public Base<Derived> {
    friend class Base;

    const char* text(){
        return "Hello World!";
    }
public:
    Derived() : Base(*this) {}
};

Derived obj;
obj.print();
```
想不起来是在哪看到的了。