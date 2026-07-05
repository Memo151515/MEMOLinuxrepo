# coreutils Notes

## Why This Package

`coreutils` provides essential commands such as `cat`, `chmod`, `cp`, `date`, `ls`, `mkdir`, `mv`, `rm`, and `sort`. A native MEMO repository needs this early.

## Reference Sources

- Arch packaging was used to compare the current GNU release and common feature toggles.
- Debian packaging was used to compare file ownership boundaries and split-package expectations.

## MEMO Packaging Decision

The recipe uses upstream GNU source and stages into `${PKGDIR}`. Programs that commonly conflict with other base packages can be disabled until MEMO defines final ownership rules.
