# [Static Assertions](https://en.cppreference.com/w/cpp/language/static_assert)
- 静态检查结构尺寸

### `static_assert(false)` 问题
[有关模板 + if constexpr + static_assert 的问题 - V2EX](https://www.v2ex.com/t/841566#reply2)

[c++ - constexpr if and static_assert - Stack Overflow](https://stackoverflow.com/questions/38304847/constexpr-if-and-static-assert?rq=1)
> The program is ill-formed, no diagnostic required, if no valid specialization can be generated for a template or a substatement of a constexpr if statement (`[stmt.if]`) within a template and the template is not instantiated.
> 
> No valid specialization can be generated for a template containing static_assert whose condition is nondependent and evaluates to false, so the program is ill-formed NDR.

[c++ - "If constexpr" in C++17 does not work in a non-templated function - Stack Overflow](https://stackoverflow.com/questions/50051473/if-constexpr-in-c17-does-not-work-in-a-non-templated-function)

*Two phase name lookup*

`if constexpr` is defined as a branch for instantiation

Workarounds:
- lambda (C++20)

  ```cpp
  []<bool false_value = false>() {
      static_assert(false_value, "fail");
  }();
  ```

- 模板变量

  ```cpp
  template<typename T>
  inline constexpr bool always_false_v = false;
  ...
  static_assert(always_false_v<T>, "fail");
  ```

- `!sizeof(T)`

  如果 Op 是 incomplete type 或者 void 的话会出错

- `!sizeof(T*)`

[How can I create a type-dependent expression that is always false? - The Old New Thing](https://devblogs.microsoft.com/oldnewthing/20200311-00/?p=103553)