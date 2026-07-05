# gzip Notes

## Why This Package

`gzip` is a small but fundamental compression utility used throughout source distribution, logging, and archive workflows.

## Reference Sources

- Arch packaging was used to compare upstream release tracking and simple GNU build flow.
- Debian packaging was used to compare base-system placement and compatibility expectations.

## MEMO Packaging Decision

The MEMO recipe uses upstream GNU source directly and installs through `DESTDIR`, keeping it suitable for MEMO's native package staging model.
