# Agent Workspace Rules

This repository is a coordination workspace for multiple independent business projects.

## Project Map

- `projects/webapp` is the Web frontend project.
- `projects/mobile` is the mobile frontend project.
- `projects/nky` is the backend project.
- Each project under `projects/` is expected to keep its own `.git` directory and independent commit history.

## Working Rules

- Treat `X` as the source of shared requirements, architecture decisions, interface contracts, and rollout plans.
- Do not assume that child projects are part of this repository's git history.
- For cross-project features, create `tasks/<feature-name>/` first.
- Put shared product requirements in `tasks/<feature-name>/requirements.md`.
- Put backend design in `tasks/<feature-name>/backend-plan.md`.
- Put Web design in `tasks/<feature-name>/web-plan.md`.
- Put mobile design in `tasks/<feature-name>/mobile-plan.md`.
- Put shared interface contracts in `contracts/`.
- Do not let Web and mobile projects invent backend contracts independently. Use `contracts/` as the shared interface source.
- After implementation, record test results and release order in `tasks/<feature-name>/rollout.md`.

## Change Discipline

- Keep commits separate per child project unless the user explicitly asks otherwise.
- Before editing a child project, inspect its own README, AGENTS.md, package files, and test commands.
- Prefer small, reviewable changes per project.
- Do not rewrite child project history unless explicitly requested.

## Default Cross-Project Flow

1. Read the feature requirement under `tasks/<feature-name>/`.
2. Identify affected backend, Web, and mobile modules.
3. Design or update shared contracts.
4. Implement backend storage and interfaces.
5. Implement Web data fetching and UI.
6. Implement mobile data fetching and UI.
7. Run focused verification in each changed project.
8. Update rollout notes.
