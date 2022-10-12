# Functions
## Type traits
```cpp
#include <type_traits>

class C {
public:
    static void A();
    void B();
};

int main() {
    bool a = std::is_function_v<decltype(main)>;
    bool b = std::is_function_v<std::remove_pointer<decltype(&main)>::type>;
    bool c = std::is_function_v<std::remove_pointer<decltype(&C::A)>::type>;
    bool d = std::is_member_function_pointer_v<decltype(&C::B)>;

    bool e = std::is_function_v<decltype([](){})>;  // false
    bool f = std::is_member_function_pointer_v<decltype([](){})>;  // false
}
```