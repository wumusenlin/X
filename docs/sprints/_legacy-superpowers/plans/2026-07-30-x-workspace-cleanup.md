# X Workspace Cleanup Implementation Plan

> **For agentic workers:** Execute this plan inline; do not modify `repos/*`.

**Goal:** Remove misleading root-workspace signals and synchronize its operating rules with the actual project topology.

**Architecture:** X remains a control-plane repository. Child projects stay independent and are discovered by workspace editor settings, while task templates describe only affected projects.

**Tech Stack:** Git, Bash, Markdown, VS Code workspace settings.

## Global Constraints

- Do not modify any file under `repos/*`.
- Do not add dependencies.
- Do not use npm.

### Task 1: Clean root signals

**Files:**
- Modify: `.gitignore`
- Delete: `scripts/test-all.sh`

- [x] Ignore every child repository from the root worktree.
- [x] Remove the script that cannot run a valid cross-project test suite.

### Task 2: Synchronize operating documentation

**Files:**
- Modify: `README.md`, `AGENTS.md`, `docs/collaboration/roles.md`, `docs/architecture/cross-project-rules.md`
- Modify: `tasks/README.md`, `tasks/_template/requirements.md`, `tasks/_template/rollout.md`, `tasks/_template/test-plan.md`
- Modify: `docs/agent/recent-project-changes.md`

- [x] Record that bureau is external until mapped under `repos/bureau`.
- [x] Make task planning, testing, and rollout templates project-agnostic.
- [x] Refresh the recent-project snapshot from current child-repository Git state.
