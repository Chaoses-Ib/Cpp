# Triplets
[Triplets | Microsoft Learn](https://learn.microsoft.com/en-us/vcpkg/concepts/triplets)

## Configs
Release:
- `x64-windows-static-release`
- `x64-windows-release`
- `x64-windows-static-md-release`

Use debug or release CRT?

[`VCPKG_POLICY_ONLY_RELEASE_CRT`](https://learn.microsoft.com/en-us/vcpkg/reference/policies#vcpkg_policy_only_release_crt)
> Indicates that a port intends to install only components that use the release C Runtime libraries, and that linking with the debug C Runtime libraries is a bug. See also [`VCPKG_POLICY_SKIP_CRT_LINKAGE_CHECK`](https://learn.microsoft.com/en-us/vcpkg/reference/policies#vcpkg_policy_skip_crt_linkage_check).

[using vcpkg release static libraries in Visual Studio debug builds fails - Issue #2153 - microsoft/vcpkg](https://github.com/Microsoft/vcpkg/issues/2153)

[MSVC RelWithDebInfo configuration uses mixture of debug and release libraries - Issue #5683 - LMMS/lmms](https://github.com/LMMS/lmms/issues/5683)

[How do I tell vcpkg to only build the release version on the command line - Issue #10683 - microsoft/vcpkg](https://github.com/microsoft/vcpkg/issues/10683)
