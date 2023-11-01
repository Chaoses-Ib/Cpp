# [Destructors](https://en.cppreference.com/w/cpp/language/destructor)
```cpp
myclass::~myclass(){…}
```

- 除了动态存储，类都是 LIFO 的

  [c++11 - C++ local variable destruction order - Stack Overflow](https://stackoverflow.com/questions/14688285/c-local-variable-destruction-order/14688333#14688333)

## 主动释放问题
- 堆上的类可以 `delete`
- 栈上的类只可以调用 `class.~class()` 来部分释放，完全释放只能靠作用域结束

  （毕竟栈是 LIFO 的）

  （本来是给 placement new 用的）

[Destructors (C++) | Microsoft Learn](https://learn.microsoft.com/en-us/cpp/cpp/destructors-cpp)