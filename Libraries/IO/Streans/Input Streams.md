# Input Streams
[std::basic_istream](https://en.cppreference.com/w/cpp/io/basic_istream)

## Unformatted input
可以使用 [std::basic_istream<CharT,Traits>::gcount](https://en.cppreference.com/w/cpp/io/basic_istream/gcount) 来获取上次输入的字符数。

## Positioning
### Seeking
[std::basic_istream<CharT,Traits>::seekg](https://en.cppreference.com/w/cpp/io/basic_istream/seekg)

不是所有 istream 都是 seekable 的，并且也无法提前检测一个 istream 是不是 seekable 的[^seekable-so]。

终端和管道输入通常是 unseekable 的，文件和 string 输入是 seekable 的。

这意味着，在通用情况下 istream 的每个输入字符只能被读取一次，不可能在复制输入前计算输入长度并分配足够的缓冲区，而只能边读取边扩大缓冲区。另外，后者可以使用 [std::basic_istream<CharT,Traits>::gcount](https://en.cppreference.com/w/cpp/io/basic_istream/gcount) 在输入后获取长度。

[^seekable-so]: [linux - C++ how to check if a stream (iostream) is seekable - Stack Overflow](https://stackoverflow.com/questions/9451005/c-how-to-check-if-a-stream-iostream-is-seekable)