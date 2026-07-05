# sed Notes

## Why This Package

`sed` is a core stream editor used throughout source builds, init scripts, and system maintenance tasks.

## Reference Sources

- Arch packaging was used to confirm the straightforward GNU configure build.
- Debian packaging was used to compare base-system placement and minimal dependency expectations.

## MEMO Packaging Decision

The MEMO recipe uses upstream GNU source directly and keeps the build minimal: configure, make, and staged install.
