# Array
[Array declaration - cppreference.com](https://en.cppreference.com/w/c/language/array)

## Convert pointer to (reference to) array
- Template
    ```cpp
    #include <array>

    template<size_t size, typename T>
    auto ptr_to_array(T* ptr) -> T(&)[size] {
        return *(T(*)[size])ptr;
    }

    int main() {
        int a[3];
        int* ptr = a;
        size_t size = std::size(ptr_to_array<3>(ptr));  // 3
    }
    ```
    or to `std::array`:
    ```cpp
    #include <array>

    template<size_t size, typename T>
    std::array<T, size>& ptr_to_array(T* ptr) {
        return *(std::array<T, size>*)ptr;
    }

    int main() {
        int a[3];
        int* ptr = a;
        size_t size = ptr_to_array<3>(ptr).size();  // 3
    }
    ```
- Macro
    ```cpp
    #include <array>
    #include <type_traits>

    #define PTR_TO_ARRAY(PTR, SIZE) (*(std::remove_reference<decltype(*(PTR))>::type(*)[SIZE])(PTR))

    int main() {
        int a[3];
        int* ptr = a;
        size_t size = std::size(PTR_TO_ARRAY(ptr, 3));  // 3
    }
    ```