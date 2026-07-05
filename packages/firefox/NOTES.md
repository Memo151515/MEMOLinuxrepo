# Firefox

Firefox should be built from a pinned Mozilla release source archive, preferably ESR first for MEMO stability.

MEMO must package the Mozilla build toolchain before this can be considered production-ready: Clang/LLVM, Rust, cbindgen, Python, Node.js, NASM, NSS, NSPR, ICU, SQLite, GTK, DBus, audio, and graphics libraries.

Do not use Debian, Arch, or Flatpak binaries as the package source. They are references only.
