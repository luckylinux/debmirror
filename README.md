# debmirror

# Important
This is an **unofficial** Improvement to `debmirror` compared to the [upstream Release](https://salsa.debian.org/debian/debmirror/).

All Credits for the original Source Code belong to the respective Author(s).

# Motivication
Many Repositories **require** the use of the patched `debmirror` Tool.

This can be due to several Reasons:
- Flat Repository Structure
- Abscence of `dists/` in the URL Path
- GPG Issues with `Release.gpg` / `Release`, whereas `InRelease` works correctly
- Specify a custom User Agent (needed in particular for those Repositories on/behind Cloudflare that would otherwise get blocked)
- `codename` not matching `dist` in `Packages` / `Release` Files
- ...

# Examples
Refer to the Files in the `examples_custom_repositories`.


