# Exceptions
```cpp
try {
	...
} catch (const std::exception&) {
	...
}
```

- `catch (...)` 捕获所有异常。

- 引用是为了可以接受派生类对象。

- 栈解退（unwinding the stack）会销毁栈上的对象。（这就要求使用智能指针）

- 异常规范（exception specification）已被抛弃，除了 `noexcept`。

- 未捕获异常会调用 `terminate()`，而 `set_terminate()` 可以指定 `terminate()` 调用的函数（默认是 `abort()`）

  意外异常会调用 `unexpected()`，它默认会再调用 `terminate()`。也可以用 `set_unexpected` 指定调用哪个函数。

[对使用 C++ 异常处理应具有怎样的态度？ - 知乎](https://www.zhihu.com/question/22889420)

[知乎上看到一些人评价c++的exception很难用，想问一下大家写c++时怎么处理错误？ - 知乎](https://www.zhihu.com/question/31614576)

[Modern C++ best practices for exceptions and error handling | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/errors-and-exception-handling-modern-cpp)

[C++异常机制的实现方式和开销分析](http://baiy.cn/doc/cpp/inside_exception.htm)

[Can't catch a C++ exception - Stack Overflow](https://stackoverflow.com/questions/28920320/cant-catch-a-c-exception/28920447)
- `throw;` 是重新抛出异常，不是抛出空异常

## [`std::exception`](https://en.cppreference.com/w/cpp/error/exception)
1. `logic_error`
   1. `invalid_argument`
   2. `domain_error`（定义域）
   3. `length_error`（空间不足）
   4. `out_of_range`（越界）
   5. `future_error`

2. `bad_optional_access` (C++17)

3. `rutime_error`
   1. `range_error`（值域）
   2. `overflow_error`（上溢）
   3. `underflow_error`（下溢）
   4. `regex_error`
   5. `system_error`

   6. `ios_base::failure`
   7.  `ileststem::filesystem_error` (C++17)

   8. `tx_eception`
   9. `nonexistent_local_time` (C++20)
   10. `ambiguous_local_time` (C++20)
   11. `format_error` (C++20)

4. `bad_typeid`

5. `bad_cast`
   1. `bad_any_cast` (C++17)

6. `bad_weak_ptr`

7. `bad_function_call`

8. `bad_alloc`（内存分配失败）

   `new(std::nothrow)` 失败时返回 `nullptr`
   1. `bad_array_new_length`

9.  `bad_exception`

10. `bad_variant_access` (C++17)

11. `ios_base::failure` (until C++11)