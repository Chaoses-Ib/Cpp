# Dynamic Storage
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