# [Conversion Functions](https://en.cppreference.com/w/cpp/language/cast_operator)
将类转化为其它类型（其它类型转化为类使用构造函数）

如将 `class` 转为 `int` 类型：
```cpp
class::operator int() const;
```

- `public`

- 强制类型转换也会调用转换函数

- 可以加 `explicit`（C++11）

- 其它类型的命名空间怎么办？直接写