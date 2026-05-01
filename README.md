# oxfmt gitignore subdirectory repro

This repository demonstrates that `oxfmt` formats directories that are ignored by parent `.gitignore` files when the ignored directory is passed as the walk target.

## Repro 1: ignored subdirectory from repo root

```text
.
├── .git/
├── .gitignore      # ignores dist/ and apps/dist/
└── dist/
    └── unformatted.js
```

## Reproduce

From the repository root:

```bash
pnpm dlx oxfmt@latest --check dist
```

Current behavior: `oxfmt` checks `dist/unformatted.js`.

Expected behavior: `dist/` should be skipped because it is ignored by the repository root `.gitignore`.

## Repro 2: package subdirectory in a monorepo

```text
.
├── .git/
├── .gitignore      # ignores apps/dist/
└── apps/
    └── dist/
        └── unformatted.js
```

Run from the package directory:

```bash
cd apps
pnpm dlx oxfmt@latest --check dist
```

Current behavior: `oxfmt` checks `apps/dist/unformatted.js`.

Expected behavior: `apps/dist/` should be skipped because it is ignored by the repository root `.gitignore`.
