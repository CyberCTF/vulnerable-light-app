#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) outside the application folder, where a file read or command execution on the API server reaches it;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-vulnerable-light-app}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /ctf/flag
chmod 444 /ctf/flag
