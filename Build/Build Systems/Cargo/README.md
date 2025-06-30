# Cargo
## Static library
Cargo can pack a Rust library with dependencies into a single `.lib` ([`staticlib`](https://github.com/Chaoses-Ib/Rust/blob/main/Build/rustc/Linkage.md#staticlib)), but C++ compilers usually don't. This makes integrating Rust into C++ project easier than integrating C++ into Rust.

## [cc-rs](https://github.com/rust-lang/cc-rs)
[Docs.rs](https://docs.rs/cc/latest/cc/)

> Rust library for build scripts to compile C/C++ code into a Rust library

cxx-build: [Cargo-based setup --- Rust ♡ C++](https://cxx.rs/build/cargo.html)

## CMake
[cmake-rs: Rust build dependency for running cmake](https://github.com/rust-lang/cmake-rs) ([Docs.rs](https://docs.rs/cmake/latest/cmake/))

## vcpkg
- [vcpkg-rs: Build library for finding native libraries in vcpkg for Rust - Windows (msvc), Linux and macOS](https://github.com/mcgoo/vcpkg-rs) ([Docs.rs](https://docs.rs/vcpkg/latest/vcpkg/))

  > When triplet is not specified, inferred triplet from rust target is used.

  > The default 64-bit configuration is `x64-windows-static-md` which is a [community supported](https://github.com/microsoft/vcpkg/blob/master/docs/users/triplets.md#community-triplets) configuration that is a good match for Rust - dynamically linking to the C runtime, and statically linking to the packages in vcpkg.
  > 
  > Another option is to build a fully static binary using `RUSTFLAGS=-Ctarget-feature=+crt-static`. This will link to libraries built with vcpkg triplet `x64-windows-static`.
  > 
  > For dynamic linking, set `VCPKGRS_DYNAMIC=1` in the environment. This will link to libraries built with vcpkg triplet `x64-windows`. If `VCPKGRS_DYNAMIC` is set, `cargo install` will generate dynamically linked binaries, in which case you will have to arrange for dlls from your Vcpkg installation to be available in your path.

  Can only use release config.

[Support cargo (Rust) libraries - Issue #20619 - microsoft/vcpkg](https://github.com/microsoft/vcpkg/issues/20619)

## MSBuild
- Manual build with VS
  - Build events + Cargo
- [CLI](../MSBuild/README.md#cli)
- [swigger/build-vcxproj](https://github.com/swigger/build-vcxproj)

  > It can read file list and other information from vcxproj, and provide common compilation options according to version configuration. This makes build.rs shorter and easier to implement, so that the source file list does not need to be updated in two places.
