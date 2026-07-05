# Chromium

Chromium is a very large source package. MEMO should pin an exact release tarball or source snapshot and keep the build independent from distro sysroots.

The package should use MEMO-provided Clang, GN, Ninja, Python, NSS, GTK, Mesa, CUPS, and media libraries. Google API keys, bundled updater behavior, and sandbox policy must be handled by MEMO policy.
