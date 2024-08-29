# Serialization
- [reflect-cpp: A C++20 library for fast serialization, deserialization and validation using reflection. Supports JSON, BSON, CBOR, flexbuffers, msgpack, TOML, XML, YAML / msgpack.org](https://github.com/getml/reflect-cpp) (C++20)
  - [Custom classes](https://github.com/getml/reflect-cpp/blob/main/docs/custom_classes.md)
    - No private or protected direct non-static data members
  - [Make sure it compiles with fno-exceptions - Issue #71](https://github.com/getml/reflect-cpp/issues/71)
  - [Upload to vcpkg - Issue #55](https://github.com/getml/reflect-cpp/issues/55)

  [reflect-cpp - Now with compile time extraction of field names from structs and enums using C++-20. : r/cpp](https://www.reddit.com/r/cpp/comments/18ecqu8/reflectcpp_now_with_compile_time_extraction_of/)

  [reflect-cpp v0.8.0 : r/cpp](https://www.reddit.com/r/cpp/comments/1bild6p/reflectcpp_v080/)

- [Cista: A simple, high-performance, zero-copy C++ serialization & reflection library.](https://github.com/felixguendling/cista)
- [alpaca: Serialization library written in C++17 - Pack C++ structs into a compact byte-array without any macros or boilerplate code](https://github.com/p-ranav/alpaca)

Macros:
- [serdepp: c++ serialize and deserialize adaptor library like rust serde.rs](https://github.com/injae/serdepp)

## JSON
- reflect-cpp
- [Glaze: Extremely fast, in memory, JSON and interface library for modern C++](https://github.com/stephenberry/glaze) (C++20)
  - [Pure Reflection](https://github.com/stephenberry/glaze/blob/main/docs/pure-reflection.md)
    - No user-declared constructors
    - No private or protected direct non-static data members
    - No virtual base classes
    - Glaze may silently fail (return `"{}"`) if these conditions are not met.
    - [Split `make_reflectable` to a separate header - Issue #956](https://github.com/stephenberry/glaze/issues/956)
  - No exceptions, no RTTI
    - ~~[Disable exceptions if a specific macro is defined - Issue #1279 - stephenberry/glaze](https://github.com/stephenberry/glaze/issues/1279)~~
  - 反序列化在开启 `use_hash_comparison` 时只会比较 perfect hash，不会产生字符串；不过序列化会产生 `"field":` 字符串。
  - [JSON-RPC 2.0 support](https://github.com/stephenberry/glaze/blob/main/docs/rpc/json-rpc.md)
  - vcpkg (non-official)

    [\[glaze\] Update to 2.6.1 by Chaoses-Ib - Pull Request #38592 - microsoft/vcpkg](https://github.com/microsoft/vcpkg/pull/38592)

  - Zero docs on header organization.
  - 3-space indentation
  - ~~[`validate_json` returns `syntax_error` if buffer contains non-ASCII chars - Issue #977](https://github.com/stephenberry/glaze/issues/977)~~

  [Glaze JSON library version 1.0 release : r/cpp](https://www.reddit.com/r/cpp/comments/11fanh5/glaze_json_library_version_10_release/)

  [Glaze 2.4.0 update: Pure reflection, Volatile support for hardware : r/cpp](https://www.reddit.com/r/cpp/comments/1bpssce/glaze_240_update_pure_reflection_volatile_support/)

Macros:
- [nlohmann/json: JSON for Modern C++](https://github.com/nlohmann/json)
- [taoJSON: C++ header-only JSON library](https://github.com/taocpp/json)

  [Binding Traits](https://github.com/taocpp/json/blob/main/doc/Binding-Traits.md)
- [Boost.JSON](https://github.com/boostorg/json)
- [cpp-json: reflection in c++ for json de/serialization](https://github.com/jake-stewart/cpp-json) (C++20, inactive)

  [compile-time reflection and json de/serialization in c++ : r/cpp](https://www.reddit.com/r/cpp/comments/152g5tb/compiletime_reflection_and_json_deserialization/)

Manual:
- [Tencent/RapidJSON: A fast JSON parser/generator for C++ with both SAX/DOM style API](https://github.com/Tencent/rapidjson)

Schemas:
- Protocol Buffers

[Modern C++ JSON serialization library recommendations : r/cpp](https://www.reddit.com/r/cpp/comments/cmqawn/modern_c_json_serialization_library/)

[stephenberry/json\_performance: Performance profiling of JSON libraries](https://github.com/stephenberry/json_performance)