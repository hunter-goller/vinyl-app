# Contributing to Vinyl App

Vinyl App is currently a personal portfolio project under active development.
Contributions are welcome when they are focused, documented, and aligned with
the roadmap.

## Before starting

1. Read the [documentation index](docs/README.md).
2. Review the [architecture overview](docs/architecture/overview.md).
3. Check the [roadmap](ROADMAP.md) and existing GitHub issues or Trello task
   references.
4. Discuss large architectural or product changes before implementing them.

## Development setup

Follow [docs/development/setup.md](docs/development/setup.md).

The basic verification sequence is:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart format .
flutter analyze
flutter test
flutter build apk --debug
```

## Branch naming

Use a short-lived branch based on the work item:

```text
VinylApp-011
VinylApp-012-migration
fix/albums-companion-test
docs/database-guide
```

Do not maintain a permanent documentation branch. Documentation changes should
be reviewed in ordinary branches and merged into `main` alongside the code they
describe.

## Code expectations

- Follow the configured analyzer and lint rules.
- Use package imports for code under `lib/`.
- Keep route strings in `AppRoutes`.
- Access long-lived dependencies through Riverpod.
- Do not query Drift directly from feature UI once repositories exist.
- Keep business workflows out of widgets.
- Add or update tests for changed behavior.
- Do not hand-edit generated `*.g.dart` files.

See [coding standards](docs/development/coding-standards.md).

## Documentation expectations

Before opening a pull request, ask whether the change affects:

- Setup commands or dependencies
- Routes or navigation behavior
- Database tables, relationships, or migrations
- Provider ownership or lifetime
- Repository or service contracts
- User-visible features
- Roadmap status

Update the relevant Markdown file in the same pull request when possible. See
[documentation maintenance](docs/development/documentation-maintenance.md).

## Pull requests

Use the repository pull-request template and include:

- What changed and why
- Related VinylApp task or issue
- Tests performed
- Screenshots for UI changes
- Documentation impact

A pull request should pass the complete CI workflow before merge.

## Commit messages

Prefer concise, imperative messages that describe the result:

```text
Add Plays Drift table
Document database schema
Fix generated companion name in album tests
```

The project uses the pull-request title and description for merge commits, so
PR titles should also be clear and durable.

## Reporting security issues

Do not open a public issue for a suspected vulnerability. Follow
[SECURITY.md](SECURITY.md).
