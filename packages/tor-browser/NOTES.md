# Tor Browser

Tor Browser must remain a direct package under `packages/tor-browser`.

Before enabling it in MEMO images, add signature verification, a native `tor` package, sandbox policy, and reproducible build inputs. Do not repackage another distribution's Tor Browser binary as the normal MEMO source package.
