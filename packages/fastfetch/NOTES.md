# fastfetch Notes

## Why This Package

`fastfetch` is a popular standalone system information tool. It is useful early in a distribution because it exercises compiler, CMake, terminal output, and optional hardware detection paths without being part of the critical boot chain.

## Reference Sources

- Arch packaging was used as the main reference for the current upstream project, CMake/Ninja build style, and optional feature awareness.
- Debian packaging was used as a comparison point for dependency expectations and conservative build/runtime assumptions.

## MEMO Packaging Decision

The MEMO recipe keeps the package source-built and distribution-neutral. Optional integrations should be enabled later only after their libraries exist as MEMO-native packages.
