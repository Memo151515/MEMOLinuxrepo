# htop Notes

## Why This Package

`htop` is a common terminal process viewer and a practical early userland package. It helps validate MEMO's terminal stack, ncurses packaging, `/proc` expectations, and configure-based source builds.

## Reference Sources

- Arch packaging was used to confirm current upstream release handling and optional build features.
- Debian packaging was used to compare dependency expectations, terminal behavior, and `/etc` configuration path conventions.

## MEMO Packaging Decision

The MEMO recipe builds from upstream source with autotools and installs under `/usr`, with configuration rooted at `/etc`. Optional features should be reviewed as MEMO grows its native library set.
