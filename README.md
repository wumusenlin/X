# X

X is a multi-project agent workspace.

It stores shared requirements, architecture notes, interface contracts, and task plans for multiple independent business projects. The source projects under `projects/` keep their own git histories.

## Layout

```txt
X/
  AGENTS.md
  contracts/
  docs/
  projects/
  scripts/
  tasks/
```

## Project Roles

- `projects/A-web`: Web frontend project.
- `projects/B-mobile`: Mobile frontend project.
- `projects/C-backend`: Backend project.

Rename these examples after adding real projects.

## Workflow

1. Create one folder under `tasks/<feature-name>/`.
2. Write the shared requirement in `requirements.md`.
3. Update shared contracts in `contracts/`.
4. Implement backend, web, and mobile changes in their own project folders.
5. Run each project's tests.
6. Commit each child project independently.
7. Record rollout notes in `tasks/<feature-name>/rollout.md`.

