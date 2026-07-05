# less Notes

## Why This Package

`less` is a core terminal pager and belongs early in a source-built distribution. It is small, stable, and useful for testing configure/make packaging plus terminal library dependencies.

## Reference Sources

- Arch packaging was used to verify upstream source usage and normal `/usr` installation layout.
- Debian packaging was used to compare pager integration expectations and keep the MEMO recipe minimal.

## MEMO Packaging Decision

The MEMO recipe builds directly from upstream source and stages into `${PKGDIR}`. System-level pager alternatives or default environment configuration should be handled by a later MEMO policy package rather than this source recipe.
