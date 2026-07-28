#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Workspace:"
git -C "$root" status --short

echo
echo "Child projects:"
for project in "$root"/repos/*; do
  [ -d "$project/.git" ] || continue
  name="$(basename "$project")"
  branch="$(git -C "$project" branch --show-current 2>/dev/null || true)"
  echo "== $name ${branch:+($branch)} =="
  git -C "$project" status --short
done
