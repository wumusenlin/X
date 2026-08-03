# Sprint 归档

一个 Sprint 聚合一次交付涉及的多个子项目提交。当前需求材料留在 `tasks/<feature>/`；收口后将范围、验证和提交证据固化到 `sprints/<sprint>/`。

子项目完成提交或推送后，在 X 根目录执行：

```bash
./scripts/archive-sprint-commit.sh <sprint> <project> HEAD
```

例如：

```bash
./scripts/archive-sprint-commit.sh 260803-hknky-3371 webapp HEAD
```

Sprint 标识由用户或任务名称确定，脚本不会猜测；可使用 `YYMMDD[branch]`，如 `260803[hknky-3371]`。首次归档会创建 `README.md` 和 `rollout.md` 模板；提交证据保存到 `commits/<project>-<date>-<sha>.md`，重复执行不会覆盖。当前工作区状态仍通过 `scripts/status.sh` 查看。
