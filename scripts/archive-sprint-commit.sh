#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
  echo "usage: $0 <sprint> <project> [commit]" >&2
  exit 64
fi

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
sprint="$1"
project="$2"
revision="${3:-HEAD}"

if [[ ! "$sprint" =~ ^[A-Za-z0-9][A-Za-z0-9._-]*(\[[A-Za-z0-9._-]+\])?$ ]]; then
  echo "invalid sprint name: $sprint" >&2
  exit 64
fi

if [[ ! "$project" =~ ^[A-Za-z0-9][A-Za-z0-9_-]*$ ]]; then
  echo "invalid project name: $project" >&2
  exit 64
fi

repo="$root/repos/$project"
if [[ ! -d "$repo/.git" ]]; then
  echo "unknown child project: $project" >&2
  exit 66
fi

commit="$(git -C "$repo" rev-parse --verify "${revision}^{commit}")"
short_commit="$(git -C "$repo" rev-parse --short "$commit")"
commit_date="$(git -C "$repo" show -s --format=%cs "$commit")"
sprint_dir="$root/docs/sprints/$sprint"
relative_commit="commits/$project-$commit_date-$short_commit.md"
archive="$sprint_dir/$relative_commit"

if [[ -e "$archive" ]]; then
  echo "already archived: ${archive#$root/}"
  exit 0
fi

branch="$(git -C "$repo" branch --show-current || true)"
[[ -n "$branch" ]] || branch="HEAD detached"

mkdir -p "$sprint_dir/commits"
if [[ ! -e "$sprint_dir/README.md" ]]; then
  {
    printf '# Sprint %s\n\n' "$sprint"
    printf -- '- Status: 进行中\n'
    printf -- '- Source task: 待补充\n\n'
    printf '## 范围\n\n待补充。\n\n## 提交证据\n\n'
  } > "$sprint_dir/README.md"
fi
if [[ ! -e "$sprint_dir/rollout.md" ]]; then
  {
    printf '# %s 发布与验证记录\n\n' "$sprint"
    printf '## 验证\n\n待补充。\n\n## 发布顺序\n\n待补充。\n\n## 遗留事项\n\n待补充。\n'
  } > "$sprint_dir/rollout.md"
fi

{
  printf '# %s · %s iteration %s\n\n' "$sprint" "$project" "$short_commit"
  printf -- '- Project: `%s`\n' "$project"
  printf -- '- Branch at archive: `%s`\n' "$branch"
  printf -- '- Commit: `%s`\n' "$commit"
  printf -- '- Authored: %s\n\n' "$(git -C "$repo" show -s --format='%ai' "$commit")"
  printf '## Message\n\n```text\n'
  git -C "$repo" show -s --format=%B "$commit"
  printf '\n```\n\n## Changed files\n\n```text\n'
  git -C "$repo" diff-tree --no-commit-id --name-status -r "$commit"
  printf '\n```\n'
} > "$archive"

printf -- '- [`%s` · `%s`](%s)\n' "$project" "$short_commit" "$relative_commit" >> "$sprint_dir/README.md"
echo "archived: ${archive#$root/}"
