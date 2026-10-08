# Upstream

| | |
| --- | --- |
| Project | VulnerableLightApp |
| Repository | https://github.com/Aif4thah/VulnerableLightApp |
| Version | main (no releases; last commit 2026-02-25) |
| Commit | 8998b55caab6a4a5bb2d725ad054c797c7d101f4 |
| Licence | GPL-3.0 |

`build/web/app/` is that commit, unchanged, without its Git history. `build/web/Dockerfile` is
upstream's Dockerfile with the SDK image pinned to `10.0.103` (upstream: `10.0`), the source
copied from `app/` instead of cloned from GitHub, and `dotnet build` (with the NuGet restore of
the versions pinned in the `.csproj`) run at build time so the container starts with
`dotnet run --no-build` and needs no internet. To update, replace `build/web/app/` with a newer
commit, then change this table.
