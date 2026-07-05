# grep Notes

## Why This Package

`grep` is one of the basic tools expected on any Unix-like system and is required by many build and maintenance scripts.

## Reference Sources

- Arch packaging was used to compare current upstream versioning and PCRE2 integration.
- Debian packaging was used to compare dependency handling and base-system expectations.

## MEMO Packaging Decision

The MEMO recipe stays close to upstream GNU defaults. PCRE2 is listed as a dependency so MEMO can build the featureful variant once `pcre2` exists natively.
