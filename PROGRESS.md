# MEMO Linux Repository Progress

## Status

Initial native package repository bootstrap is in progress.

MEMO Linux targets an LFS-based source-built system. Package recipes in this repository must remain independent from Arch, Debian, or any other distribution binary package manager.

## Added Packages

| Package | Status | Notes |
| --- | --- | --- |
| fastfetch | added | CMake/Ninja based system information tool. |
| tree | added | Small Makefile based directory listing utility. |
| htop | added | ncurses process viewer built from source. |
| less | added | Core terminal pager built with autotools/configure. |

## Next Tasks

- Add checksum fields once MEMO source mirroring/download tooling is defined.
- Add a formal package schema validator.
- Add bootstrap packages for build tooling and core libraries.
- Decide how MEMO package archives will be assembled from `${PKGDIR}`.
- Add CI checks for `memo.yml` structure and `build.sh` shell syntax.
