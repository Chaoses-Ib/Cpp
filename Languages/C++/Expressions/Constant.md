# [Constant Expressions](https://en.cppreference.com/w/cpp/language/constant_expression)
## Constants
- `constexpr`

  `inline`/`static`？

- `constinit const`
- `const`
- `#define`

[Constants and literals - cppreference.com](https://en.cppreference.com/book/intro/constants)

### 用 `constexpr` 和用 `const` 的区别是什么？
`constexpr` 也可以运行期啊，`const` 也可以编译期啊。

但是作为一种语义暗示，编译期常量用 `constexpr` 更好？虽然 `constexpr` 可以运行期再执行，但必须编译期可执行，而 `const` 就只保证不可修改。

[c++ - const vs constexpr on variables - Stack Overflow](https://stackoverflow.com/questions/13346879/const-vs-constexpr-on-variables)

[这三种定义C++常量的方式孰优孰劣？ - 知乎](https://www.zhihu.com/question/419476568)

### Macros to constants
- 可以利用命名空间
- 作用范围更准确，不会出现影响变量名和函数名的情况
- 有类型

```cpp
//_DEBUG
const bool _debug =
#ifdef _DEBUG
    true;
#else
    false;
#endif
```