# oxfmt gitignore subdirectory repro

This repository demonstrates that `oxfmt --check dist` formats a directory that is ignored by a parent `.gitignore`.

## Structure

```text
.
├── .git/
├── .gitignore      # ignores dist/
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
