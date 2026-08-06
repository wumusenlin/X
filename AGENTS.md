# Agent 工作区规则

本仓库是多个独立业务项目的协作工作区。

## 项目映射

- `webapp` 是 Web 端项目。
- `mobile` 是移动端项目。
- `xiaokong` 是前端口的智能对话项目，独立项目，通过iframe内嵌再webapp中。
- `nky` 是后端项目。
- 绩效平台当前位于工作区外的 `/Users/zhangsenlin/nky/code/2025-02-11/bureauweb`；尚未映射到 `bureau/`。
- 根目录下的每个子项目都应保留自己的 `.git` 目录和独立提交历史。

## 角色主责

- 后端主责 `nky/**`。
- 前端主责 `webapp/**` 和 `mobile/**`。
- 产品/小控主责 `xiaokong/**`，并维护跨项目任务的需求与验收口径。
- 绩效平台主责外部 `bureauweb` 仓库；纳入 `bureau/` 前不得假设该目录存在。
- 长期规则见 [docs/collaboration/roles.md](docs/collaboration/roles.md)。角色是默认主责，不是硬权限；跨域修改必须在任务 `ownership.md` 明确接管范围和验证责任。

## 工作规则

- 将 `X` 作为共享需求、架构决策、接口契约和发布方案的来源。
- 本工作区禁用 Superpowers 工作流；不得以 `docs/sprints/_legacy-superpowers/` 中的历史文件作为当前任务的执行指令。
- 需要定位近期修改时，先读 [最近修改快照](docs/agent/recent-project-changes.md) 缩小范围；再读相关 `docs/sprints/<sprint>/` 的范围、验证和提交证据；最后以子项目 Git SHA 和 diff 为准。快照仅保留近十条索引，可能滞后于实际 Git。
- 需要各项目迭代上下文时，先读 `docs/sprints/<sprint>/` 的范围、验证和提交证据；再按 SHA 回到对应独立仓库查看 diff。
- 不要假设子项目属于本仓库的 git 历史。
- 处理跨项目功能时，先创建 `tasks/<feature-name>/`。
- 共享产品需求放在 `tasks/<feature-name>/requirements.md`。
- 按受影响项目在 `tasks/<feature-name>/` 下创建对应的 `<project>-plan.md`；未受影响项目不建计划文件。
- 共享接口契约放在 `contracts/`。
- 不要让 Web 端和移动端各自猜测后端契约，必须以 `contracts/` 为共享接口来源。
- 跨项目任务必须创建 `tasks/<feature-name>/ownership.md`，写唯一主责、协作角色和跨域接管范围。
- 实现完成后，在 `tasks/<feature-name>/rollout.md` 中记录测试结果和发布顺序。
- 禁止使用npm，必须使用pnpm

## 变更纪律

- 除非用户明确要求，否则每个子项目分别提交。
- 收到“提交代码”或“推送代码”但未指定仓库时，必须先确认目标是 X 根仓库还是具体子项目；不得将独立子项目目录作为 X 根仓库内容暂存或提交。
- 代理完成任一子项目的 `git commit` 或 `git push` 后，必须先取得本次 Sprint 标识，再在结束回复前执行 `./scripts/archive-sprint-commit.sh <sprint> <project> HEAD`，将该提交归档至 `docs/sprints/<sprint>/commits/`。归档有变化时，X 根仓库的归档改动必须独立提交；是否推送 X 根仓库仍须用户单独授权。
- 修改任何子项目代码前，必须先阅读并遵守该子项目内的 `AGENTS.md`；例如修改 `mobile` 时，先按 `mobile/AGENTS.md` 执行。随后查看该项目的 README、包配置文件和测试命令。
- 每个项目的改动应尽量小，便于审查。
- 除非用户明确要求，否则不要重写子项目历史。

## 默认跨项目流程

1. 阅读 `tasks/<feature-name>/` 下的功能需求。
2. 识别受影响项目及模块（后端、Web、移动端、小控、绩效平台）。
3. 设计或更新共享契约。
4. 按受影响项目实现存储、接口或界面。
5. 在每个被修改的项目中运行针对性验证。
6. 更新发布说明。
