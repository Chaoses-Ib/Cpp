# Structure Building
Build a structure step by step instead of declaring the entire structure at once.

Basic idea:
```cpp
#include <utility>

template<typename T, typename U>
std::pair<T, U> append(T&& t, U&& u) {
    return { std::move(t), std::move(u) };
}

int main()
{
    /*
    struct {
        int a;
        float b;
        double c;
    };
    */

    int s1 = 1;
    auto s2 = append(std::move(s1), 1.0f);
    auto s3 = append(std::move(s2), 1.0);

    /*
    struct {
        int first.first;
        float first.second;
        double second;
    } s3;
    */
}
```

Make a static-sized output stream by structure building[^ostream-reddit][^ostream-so]:
```cpp
#include <array>
#include <utility>
#include <iostream>

template<size_t N>
class OutputStream {
public:
    std::array<uint8_t, N> buf;
    size_t pos = 0;

    template <typename U>
    U write(U&& u) {
        *reinterpret_cast<U*>(&buf[pos]) = std::move(u);
        pos += sizeof U;
        return {};
    }

    template <typename T, typename U>
    std::pair<T, U> write(U&& u) {
        *reinterpret_cast<U*>(&buf[pos]) = std::move(u);
        pos += sizeof U;
        return {};
    }
};

int main()
{
    auto f = [](auto& out) {
        /*
        struct {
            int a;
            float b;
            double c;
        };
        */
        
        auto s1 = out.write(1);
        auto s2 = out.write<decltype(s1)>(1.0f);
        auto s3 = out.write<decltype(s2)>(1.0);
        return s3;
    };
    OutputStream<sizeof(f(*(OutputStream<0>*)nullptr))> out;
    f(out);
    for (uint8_t byte : out.buf)
        std::cout << (int)byte << ' ';
}
```

[^ostream-reddit]: [How to make a static-sized output stream? : cpp_questions](https://www.reddit.com/r/cpp_questions/comments/wost4b/how_to_make_a_staticsized_output_stream/)
[^ostream-so]: [How to make a static-sized output stream in C++? - Stack Overflow](https://stackoverflow.com/questions/73357916/how-to-make-a-static-sized-output-stream-in-c)