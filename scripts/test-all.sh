#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for project in "$root"/repos/*; do
  [ -d "$project/.git" ] || continue
  name="$(basename "$project")"
  echo "== $name =="
  if [ -f "$project/package.json" ]; then
    if command -v pnpm >/dev/null 2>&1 && [ -f "$project/pnpm-lock.yaml" ]; then
      pnpm -C "$project" test
    elif command -v npm >/dev/null 2>&1; then
      npm --prefix "$project" test
    else
      echo "No Node package manager found; skipping $name"
    fi
  else
    echo "No known test command for $name; skipping"
  fi
done
