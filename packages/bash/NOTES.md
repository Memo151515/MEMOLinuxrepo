# bash Notes

## Why This Package

`bash` is a core shell for an LFS-style system and is needed by many build scripts and administrative workflows.

## Reference Sources

- Arch packaging was used to compare normal build flags and installed-readline usage.
- Debian packaging was used to compare shell integration expectations and maintainer-script assumptions.

## MEMO Packaging Decision

The MEMO recipe builds from GNU upstream source and avoids distribution policy in the package recipe. Decisions such as `/bin/sh` ownership, login shell registration, and default shell policy belong in a later MEMO base-system package.
