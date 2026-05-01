#!/usr/bin/env bash
set -uo pipefail

status=0

echo "## Repro 1: repo root target"
pnpm dlx oxfmt@latest --check dist || status=$?

echo
echo "## Repro 2: package subdirectory target"
(
  cd apps
  pnpm dlx oxfmt@latest --check dist
) || status=$?

exit "$status"
