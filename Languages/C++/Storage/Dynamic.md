# Dynamic Storage
## `new`
- 初始化：

  ```cpp
  int a = new int (6);
  ```
  或
  ```cpp
  int a = new int {6};
  ```

- `new` 失败时将引发 `std::bad_alloc` 异常

  [C++ 每次 new 都需要做异常处理吗？ - 知乎](https://www.zhihu.com/question/52291267)

- `new` 是一个运算符（`new[]` 则是另一个）

  `operator new`？

- `placement new`（定位 new）运算符：

  `<new>`
  ```cpp
  p = new(buffer) int;
  ```
  因为 buffer 不是 `new` 分配的，所以也就不能用 `delete` 来释放（除非 buffer 之前就是用 `new` 创建的）

  [C++ 网易面试题“让new操作符不分配内存，只调用构造函数” - 简书](https://www.jianshu.com/p/b52a5df69c88)

## `delete`
- `delete` 只能删除 `new` 分配的内存，而不能是栈上的内存

  （VC++ 中，这会触发一个异常）

- `delete` 空指针 是安全的

- `new` 的数组必须通过 `delete [] arr` 来释放，使用 `delete arr` 的后果是不确定的

  （但用 `new []` 为一个实体分配内存时仍用 `delete` 来释放）

  [Effective C++ 16：使用同样的形式来new和delete | Harttle Land](https://harttle.land/2015/08/07/effective-cpp-16.html)

## Classes
除了构造和析构，还要注意以下函数：
- 拷贝构造
- 移动拷贝构造
- `operator=`
- 移动 `operator=`

能使用智能指针的地方建议使用智能指针。

## Array allocation
[^pvs]

`delete[]` does not require the size of the array to be destroyed. There are two main approaches to the way compilers remember the size:
- Over-allocation: Storing the size in the allocated array.  
  The basic implementation is:
  ```cpp
  // Get the size of the array to be destroyed
  size_t n = *(size_t*)((char*)p - sizeof(size_t));

  // Call the destructor for each element
  while (n--)
  {
    p[n].~ClassName();
  }

  // Release the memory
  operator delete[] ((char*)p - sizeof(size_t));
  ```
  MSVC, GCC and Clang use this strategy.
  
- Associative array: Storing the size in a separate associative array.  
  The basic implementation is:
  ```cpp
  // Get the size of the array to be destroyed
  size_t n = array_size_association.lookup(p);

  // Call the destructor for each element
  while (n-- != 0)
  {
    p[n].~SomeClass();
  }

  // Release the memory
  operator delete[] (p);
  ```

Note that objects with [trivial destructors](https://en.cppreference.com/w/cpp/language/destructor#Trivial_destructor) do not require a delete expression and may be disposed of by simply deallocating their storage.

[^pvs]: [Why do arrays have to be deleted via delete\[\] in C++](https://pvs-studio.com/en/blog/posts/cpp/0973/)

## Why does a virtual destructor require delete operator? (since C++98)
<details><summary>C++98 [class.dtor] p11</summary>

> At the point of definition of a virtual destructor (including an implicit definition), non-placement operator delete shall be looked up in the scope of the destructor’s class and if found shall be accessible and unambiguous. [Note: this assures that an operator delete corresponding to the dynamic type of an object is available for the delete-expression.]

</details>

C++17 \[class.dtor\] p13:

> At the point of definition of a virtual destructor (including an implicit definition), the non-array deallocation function is determined as if for the expression `delete this` appearing in a non-virtual destructor of the destructor’s class. If the lookup fails or if the deallocation function has a deleted definition, the program is ill-formed. [Note: This assures that a deallocation function corresponding to the dynamic type of an object is available for the delete-expression. —end note]

Workarounds if the delete operator is not available:
- An empty `delete(void*)`
- [Class-specific destroying deallocation functions](https://en.cppreference.com/w/cpp/memory/new/operator_delete) (C++20) [^virtual-dtor-c++20]
    ```cpp
    class Base {
    public:
        void operator delete(Base* p, std::destroying_delete_t) {
            // This function shouldn't be called
            std::terminate();

            // p->~Base();
            // ::operator delete(p);
        }
        virtual ~Base() {}
    };

    class Derived : public Base {
    public:
        ~Derived() {}
    };

    int main() {
        Derived d;
    }
    ```

[^virtual-dtor-c++20]: [Why does a virtual destructor require operator delete? - Stack Overflow](https://stackoverflow.com/questions/31686508/why-is-delete-operator-required-for-virtual-destructors)