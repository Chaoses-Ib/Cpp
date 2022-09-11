# [{fmt}](https://fmt.dev/) ([repo](https://github.com/fmtlib/fmt))
## Syntax
[Replacement fields](https://fmt.dev/latest/syntax.html#format-string-syntax):
```antlr
replacement_field ::=  "{" [arg_id] [":" (format_spec | chrono_format_spec)] "}"
arg_id            ::=  integer | identifier
integer           ::=  digit+
digit             ::=  "0"..."9"
identifier        ::=  id_start id_continue*
id_start          ::=  "a"..."z" | "A"..."Z" | "_"
id_continue       ::=  id_start | digit
```

[Format specifiers](https://fmt.dev/latest/syntax.html#format-specification-mini-language):
```antlr
format_spec ::=  [[fill]align][sign]["#"]["0"][width]["." precision]["L"][type]
fill        ::=  <a character other than '{' or '}'>
align       ::=  "<" | ">" | "^"
sign        ::=  "+" | "-" | " "
width       ::=  integer | "{" [arg_id] "}"
precision   ::=  integer | "{" [arg_id] "}"
type        ::=  "a" | "A" | "b" | "B" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" |
                 "o" | "p" | "s" | "x" | "X"
```

## Character types
Type | Support
--- | ---
`char` | default
`wchar_t` | [fmt/xchar.h](https://fmt.dev/latest/api.html#xchar-api)
`char8_t` | ❌
`char16_t` | ❌
`char32_t` | ❌