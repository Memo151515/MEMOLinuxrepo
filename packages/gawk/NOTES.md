# gawk Notes

## Why This Package

`gawk` is the GNU awk implementation and is needed by many configure scripts, build tools, and text-processing workflows.

## Reference Sources

- Arch packaging was used to compare current upstream version and optional library usage.
- Debian packaging was used to compare dependency expectations and alternatives handling.

## MEMO Packaging Decision

The MEMO recipe builds upstream source directly. Any `/usr/bin/awk` alternative policy should be handled by MEMO system policy rather than the source package itself.
