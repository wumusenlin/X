# 0001 Workspace Structure

## Decision

Use `X` as a coordination workspace for multiple independent git projects.

## Rationale

This keeps shared requirements, contracts, and rollout planning in one place while preserving each business project's existing repository, CI, permissions, and release process.

## Consequences

- Cross-project tasks are coordinated from `X/tasks/`.
- Source changes are committed inside each child project.
- `projects/` is ignored by `X` git except for documentation placeholders.

