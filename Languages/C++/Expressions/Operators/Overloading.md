# [Operator Overloading](https://en.cppreference.com/w/cpp/language/operators)
- Pointer to member of object/pointer:
  - `a.*b`
  - `a->*b`

- *逗号运算符可以重载*

[The Art of C++ / Operators: A highly efficient, move-aware operators library](https://github.com/taocpp/operators)

## `operator++`
```cpp
//++number
Number& operator++() {
	Number.value++;
	return *this;
}
//number++
Number operator++(int) {
	Number tmp = *this;
	++(*this);
	return tmpl
}
```

[c++ - How to overload the operator++ in two different ways for postfix a++ and prefix ++a? - Stack Overflow](https://stackoverflow.com/questions/3846296/how-to-overload-the-operator-in-two-different-ways-for-postfix-a-and-prefix)

## 逗号运算符重载
[c++ - When to Overload the Comma Operator? - Stack Overflow](https://stackoverflow.com/questions/5602112/when-to-overload-the-comma-operator)

[Boost.Assignment Documentation - 1.76.0](https://www.boost.org/doc/libs/1_76_0/libs/assign/doc/index.html)