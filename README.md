# VulnerableLightApp

[VulnerableLightApp](https://github.com/Aif4thah/VulnerableLightApp) by Michael Vacarella
(Aif4thah): a deliberately vulnerable .NET REST API, with a GraphQL endpoint, covering about thirty
CWEs (SQL injection, XXE, insecure deserialization, JWT flaws, SSRF, command injection, file
upload, business logic, a backdoor and more), with SIEM-ready logs. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machine, and the
upstream source in [`build/web/app/`](build/web/app) builds with its own Dockerfile, with the SDK
pinned and the packages restored at build.

| Machine | Service |
| --- | --- |
| web | VulnerableLightApp (.NET 10, HTTPS, self-signed) on port 3000, published on 3033 |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then call https://localhost:3033/ (self-signed certificate: `curl -k`). Every endpoint except
`/Login` and `/swagger` answers 401 until you send a bearer token; the endpoints are listed at
`/swagger`. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: upstream points to
[Dojo-101](https://github.com/Aif4thah/Dojo-101).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-3.0, as VulnerableLightApp ([LICENSE](LICENSE)). This application is deliberately
vulnerable: keep it isolated.
