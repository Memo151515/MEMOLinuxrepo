# MEMQ Linux Repository Progress

## Status

Initial native package repository bootstrap is now usable as a small source-based package set.

MEMQ Linux targets an LFS-based source-built system. Package recipes in this repository must remain independent from Arch, Debian, or any other distribution binary package manager.

## Added Packages

| Package | Status | Notes |
| --- | --- | --- |
| bash | added | GNU shell for base system and build scripts. |
| coreutils | added | Core GNU file, shell, and text utilities. |
| fastfetch | added | CMake/Ninja based system information tool. |
| findutils | added | `find`, `xargs`, and related file search utilities. |
| gawk | added | GNU awk for build scripts and text processing. |
| grep | added | GNU text search utility. |
| gzip | added | Base compression utility. |
| htop | added | ncurses process viewer built from source. |
| less | added | Core terminal pager built with autotools/configure. |
| sed | added | GNU stream editor for scripts and builds. |
| tar | added | GNU archive utility for source packages. |
| tree | added | Small Makefile based directory listing utility. |

## Repository Shape

- `packages/<name>/memo.yml` contains package metadata and the source build summary.
- `packages/<name>/build.sh` stages installs into `${PKGDIR}`.
- `packages/<name>/NOTES.md` records Arch/Debian reference notes and MEMQ-specific packaging choices.

## Next Tasks

- Add checksum fields once MEMQ source mirroring/download tooling is defined.
- Add a formal package schema validator.
- Add native recipes for libraries needed by existing packages: `readline`, `ncurses`, `pcre2`, `gmp`, `mpfr`, `acl`, and `attr`.
- Decide how MEMQ package archives will be assembled from `${PKGDIR}`.
- Add CI checks for `memo.yml` structure and `build.sh` shell syntax.
