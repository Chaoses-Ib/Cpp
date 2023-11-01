# Return Type Overloading
You can pretend to overload the return type of a function by utilizing implicit conversions [^oldnewthing]. For example:
```cpp
auto read(const void* p) {
    struct {
        const void* p;
        operator uint8_t() {
            return *reinterpret_cast<const uint8_t*>(p);
        }
        operator uint32_t() {
            return *reinterpret_cast<const uint32_t*>(p);
        }
    } r {p};
    return r;
}

int main() {
    int test_data = 0x102;
    uint8_t u8 = read(&test_data);  // 2
    uint32_t u32 = read(&test_data);  // 258
}
```

See also [Automatic Conversions](../../Types/Conversions/Automatic.md).

[^oldnewthing]: [How can I have a C++ function that returns different types depending on what the caller wants? - The Old New Thing](https://devblogs.microsoft.com/oldnewthing/20191106-00/?p=103066)