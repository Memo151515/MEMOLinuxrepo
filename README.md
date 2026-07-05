# MEMO Linux Native Package Repository

This repository is the native source package repository for MEMO Linux.

MEMO Linux is planned as an LFS (Linux From Scratch) based distribution. It is not a derivative of Arch, Debian, Fedora, Ubuntu, or any other existing distribution. Arch and Debian packaging are used only as references for upstream source locations, dependency discovery, build options, and filesystem layout expectations.

## Repository Layout

```text
packages/
  <package>/
    memo.yml   # package metadata and build/install summary
    build.sh   # source build script for MEMO Linux builders
    NOTES.md   # packaging rationale and upstream reference notes
```

Each package is expected to build from upstream source code without depending on binary packages from another distribution.

## Package Format

The initial MEMO package recipe format is intentionally small and readable:

- `name`: package name
- `version`: upstream version packaged for MEMO
- `summary`: short description
- `license`: upstream license identifier
- `homepage`: upstream project page
- `source`: upstream source archive or repository
- `dependencies`: runtime dependencies expected in the MEMO base or repository
- `build_dependencies`: tools needed to compile the package
- `build`: high-level build commands
- `install`: high-level install/staging commands

`build.sh` scripts assume these environment variables:

- `SRC_TARBALL`: path to a pre-downloaded upstream source archive
- `BUILDDIR`: temporary build directory, defaulting to `build`
- `PKGDIR`: package staging directory, defaulting to `pkg`
- `PREFIX`: install prefix, defaulting to `/usr`

Install commands must stage into `${PKGDIR}` via `DESTDIR` or equivalent. They must not install directly into the live system.

## Adding A Package

1. Create `packages/<name>/`.
2. Add `memo.yml`, `build.sh`, and `NOTES.md`.
3. Prefer upstream source releases over distribution-specific patchsets.
4. Check Arch packaging for current upstream source, common build flags, and optional features.
5. Check Debian packaging for dependency expectations, filesystem layout, and conservative defaults.
6. Keep MEMO recipes distribution-neutral and source-based.
7. Document any deliberate deviation from Arch or Debian in `NOTES.md`.

## Current Scope

The repository currently starts with small, useful command-line packages that are good early tests for a Linux From Scratch based native repository: `fastfetch`, `tree`, `htop`, and `less`.
