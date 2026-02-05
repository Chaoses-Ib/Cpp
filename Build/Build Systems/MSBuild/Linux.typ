#import "@local/ib:0.1.0": *
#title[MSBuild on Linux]
= Wine
- Just copy from VS.

- #a[mstorsjo/msvc-wine: Scripts for setting up and running MSVC in Wine on Linux][https://github.com/mstorsjo/msvc-wine]
  - Debian: ```sh apt-get install -y wine64 python3 msitools ca-certificates winbind```
    - ```sh msitools``` is needed for unpacking Windows SDK.
    - ```sh git``` is required for patching, but otherwise doesn't matter.
    - #q[When MSVC is invoked with the `/Zi` and `/FS` options, it spawns a background `mspdbsrv.exe` process and communicates with it. This requires the `winbind` package to be installed for this communication to work.]
  - ```sh vsdownload.py --accept-license```
    - ```sh --major 17```
    - ```sh --msvc-version```
    - ```sh --sdk-version```
    - ```sh --print-selection```
    - ```sh --arch host --arch x86 --arch x64 --arch arm --arch arm64```
      - ```sh --arch x86 --arch x64```
    - ```sh --cache``` defaults to rm-after-use/error ```py tempfile.mkdtemp(prefix="vsinstall-")```.
  - Default packages: `Microsoft.VisualStudio.Workload.VCTools`, `Microsoft.VisualStudio.Component.VC.ATL`
    - `Selected 567 packages, for a total download size of 2.7 GB, install size of 8.9 GB`
    - Many unnecessary packages.
    - 5.4G after unpacking, where MSVC takes 3.6G and Windows SDK takes 1.7G.
      - `MSVC/*/lib` takes 2.9G.
    - #a[Suggestion: Using GitHub cache action to cache the downloaded files between CI runs - Issue \#113][https://github.com/mstorsjo/msvc-wine/issues/113]
  - #a[MSBuild cannot find a installed Windows SDK - Issue \#134][https://github.com/mstorsjo/msvc-wine/issues/134]
  - Used by #a[cross-rs][https://github.com/cross-rs/cross-toolchains/blob/main/docker/msvc-wine.sh]

- #a[est31/msvc-wine-rust: Cross compile Rust programs to the MSVC Windows target using Wine][https://github.com/est31/msvc-wine-rust]
  (discontinued)
  - #a[`msvc-wine-rust/linker-scripts/linker.sh`][https://github.com/est31/msvc-wine-rust/blob/master/linker-scripts/linker.sh]

#a[Running Visual Studio 2022 under WINE - WineHQ Forums][https://forum.winehq.org/viewtopic.php?t=41540]
