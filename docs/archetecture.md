## Continuous Integration

The project uses GitHub Actions.

Stages:

1. Lint
2. Formatting
3. Type Checking
4. Expo Doctor
5. Build Verification

CI
├── Quality
│ ├── ESLint
│ ├── Prettier
│ ├── TypeScript
│ └── Expo Doctor
│
├── Tests
│ ├── Unit Tests
│ ├── Component Tests
│ └── Coverage
│
├── Security
│ ├── npm audit
│ └── CodeQL
│
└── Build
├── Android Bundle
└── iOS Bundle

The build job only executes after all quality checks pass.
