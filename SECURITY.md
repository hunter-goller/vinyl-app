# Security Policy

## Supported versions

Vinyl App is pre-alpha and has no supported public release yet. Security fixes
are applied to the current `main` branch.

## Reporting a vulnerability

Please do not disclose a suspected vulnerability in a public issue.

Preferred reporting methods:

1. Use GitHub's private security advisory feature for the repository.
2. If that is unavailable, email `hgoller6700@gmail.com` with the subject
   `Vinyl App security report`.

Include reproduction steps, affected code or behavior, and the potential impact.
Do not include real user data.

## Current security model

Vinyl App is designed as a local-first application. At the current development
stage:

- Album and artist data are stored locally in SQLite.
- No authentication system is implemented.
- No cloud synchronization is implemented.
- No external music service is required for core operation.
- NFC and external metadata integrations are planned but not implemented.

Security and privacy documentation must be updated before those boundaries
change.
