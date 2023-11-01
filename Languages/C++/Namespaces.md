# [Namespaces](https://en.cppreference.com/w/cpp/language/namespace)
- 命名空间可以相互嵌套，但不能放在代码块内
  - 可以在命名空间内使用 `using`

    但要注意，`using` 编译指令并不是添加嵌套名称（传递性）

    若有
    ```cpp
    namespace my{
        using std::cout;
        using namespace your;
    }
    ```
    则
    ```cpp
    using namespace my;
    ```
    等效于
    ```cpp
    using namespace my;
    using namespace your;
    ```

  - 要注意两种嵌套写法的区别：
    - `namespace Send::Type {`

      不能使用 Send 中的名称
    - `namespace Send { namespace Type {`

- 文件的声明区域即 全局命名空间

- 命名空间是开放的，可以把名称分散地加入到同一个命名空间中
  - 由此实现了声明与定义的分离

- 可以给命名空间创建别名
  
  ```cpp
  namespcae my = your::std;
  ```

- 命名空间可以匿名，会自动使用 `using` 编译指令

  因为是匿名的，所以不能在其它文件中引用，相当于 `static`

- Classes

  [c++ - Can a class share a namespace's name? - Stack Overflow](https://stackoverflow.com/questions/5856759/can-a-class-share-a-namespaces-name)

  [design - Should class names reflect namespace name? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/326109/should-class-names-reflect-namespace-name)

  [design - C++ namespace name isolation - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/347416/c-namespace-name-isolation)

  [c# - Same class and namespace name - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/322008/same-class-and-namespace-name)

访问：
- 含命名空间的名称（如 `std::cout`）是 限定的名称，不含的（如 `cout`）则是 未限定的名称
- 作用域解析运算符 `::`

  ```cpp
  std::cout << 123;
  ```

- `using` 声明

  使单个名称可用（加入到当前声明区域）

  如 `using std::cout;`

- `using` 编译指令

  使整个命名空间可用

  如 `using namespace std;`

  - 与 using 声明不同的是，编译指令是“灵活谦让”的，可以在编译指令引入一个名称后声明一个同名名称，不会冲突，而是会直接替代它引入的名称

    （仍可用 `::name` 来访问被引入的名称）

    ```cpp
    int main(){
        using namespace std;
        int cout = 0;
        cout << 123; //0<<123
        ::cout << 123; //print "123"
    }
    ```

[design - Best practices for using namespaces in C++ - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/50120/best-practices-for-using-namespaces-in-c)

## 用途
- 避免命名冲突
- 明确功能归属

### 链接时命名冲突
`a.cpp`:
```cpp
struct MyClass {
    CString s;
};
```
`b.cpp`:
```cpp
struct MyClass {
    int s;
};

{
MyClass obj;
obj.s = 123;
}  //exception
```
VS 没有任何提示，定义跳转也正常工作，调用堆栈也看不出问题（点进去只能看汇编），非常坑。