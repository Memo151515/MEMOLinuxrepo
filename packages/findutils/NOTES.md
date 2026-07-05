# findutils Notes

## Why This Package

`findutils` provides `find` and `xargs`, both required for source builds, packaging scripts, and normal system administration.

## Reference Sources

- Arch packaging was used to confirm upstream release and normal configure options.
- Debian packaging was used to compare locate database paths and base-system expectations.

## MEMO Packaging Decision

The MEMO recipe stages upstream GNU findutils into `${PKGDIR}`. Locate database update scheduling should be handled outside this source recipe.
