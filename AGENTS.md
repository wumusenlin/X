# Agent 工作区规则

本仓库是多个独立业务项目的协作工作区。

## 项目映射

- `projects/webapp` 是 Web 端项目。
- `projects/mobile` 是移动端项目。
- `projects/xiaokong` 是前端口的智能对话项目，独立项目，通过iframe内嵌再webapp中。
- `projects/nky` 是后端项目。
- `projects/bureau` 是独立项目，绩效管理平台（绩效通）。
- `projects/` 下的每个项目都应保留自己的 `.git` 目录和独立提交历史。

## 角色主责

- 后端主责 `projects/nky/**`。
- 前端主责 `projects/webapp/**` 和 `projects/mobile/**`。
- 产品/小控主责 `projects/xiaokong/**`，并维护跨项目任务的需求与验收口径。
- 绩效平台主责 `projects/bureau/**`。
- 长期规则见 [docs/collaboration/roles.md](docs/collaboration/roles.md)。角色是默认主责，不是硬权限；跨域修改必须在任务 `ownership.md` 明确接管范围和验证责任。

## 工作规则

- 将 `X` 作为共享需求、架构决策、接口契约和发布方案的来源。
- 需要各项目近期修改上下文时，先读 [最近修改快照](docs/agent/recent-project-changes.md)；再按其中 SHA 回到对应独立仓库查看 diff。
- 不要假设子项目属于本仓库的 git 历史。
- 处理跨项目功能时，先创建 `tasks/<feature-name>/`。
- 共享产品需求放在 `tasks/<feature-name>/requirements.md`。
- 后端设计放在 `tasks/<feature-name>/backend-plan.md`。
- Web 端设计放在 `tasks/<feature-name>/web-plan.md`。
- 移动端设计放在 `tasks/<feature-name>/mobile-plan.md`。
- 共享接口契约放在 `contracts/`。
- 不要让 Web 端和移动端各自猜测后端契约，必须以 `contracts/` 为共享接口来源。
- 跨项目任务必须创建 `tasks/<feature-name>/ownership.md`，写唯一主责、协作角色和跨域接管范围。
- 实现完成后，在 `tasks/<feature-name>/rollout.md` 中记录测试结果和发布顺序。
- 禁止使用npm，必须使用pnpm

## 变更纪律

- 除非用户明确要求，否则每个子项目分别提交。
- 修改任何子项目代码前，必须先阅读并遵守该子项目内的 `AGENTS.md`；例如修改 `projects/mobile` 时，先按 `projects/mobile/AGENTS.md` 执行。随后查看该项目的 README、包配置文件和测试命令。
- 每个项目的改动应尽量小，便于审查。
- 除非用户明确要求，否则不要重写子项目历史。

## 默认跨项目流程

1. 阅读 `tasks/<feature-name>/` 下的功能需求。
2. 识别受影响的后端、Web 端、移动端模块。
3. 设计或更新共享契约。
4. 实现后端存储和接口。
5. 实现 Web 端数据获取和界面。
6. 实现移动端数据获取和界面。
7. 在每个被修改的项目中运行针对性验证。
8. 更新发布说明。
