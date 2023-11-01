# Automatic Conversions
By utilizing [return type overloading](../../Functions/Overloading/Return.md), we can implement automatic conversions - conversions that convert the expression to any desired type, even those not allowed by implicit conversions. The basic idea is:
```cpp
#include <cstdint>

template<typename T>
class auto_cast {
    T value_;
public:
    auto_cast(T value) : value_(value) {};

    template<typename T2>
    operator T2() {
        return T2(value_);
    }
};

int main() {
    std::uintptr_t p = auto_cast(main);
    int (*f)() = auto_cast(p);
}
```

Implementations:
- [IbWinCppLib/auto_cast.hpp](https://github.com/Chaoses-Ib/IbWinCppLib/blob/master/include/IbWinCpp/Cpp/auto_cast.hpp)