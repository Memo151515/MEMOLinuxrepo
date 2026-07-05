# tar Notes

## Why This Package

`tar` is essential for extracting and creating source archives, making it a base package for an LFS-derived source distribution.

## Reference Sources

- Arch packaging was used to compare current upstream tarball selection.
- Debian packaging was used to compare base-system behavior and compression-helper assumptions.

## MEMO Packaging Decision

The MEMO recipe keeps compression tools such as `gzip`, `xz`, and `zstd` as separate packages. `tar` should discover those helpers at runtime.
