# X

X 是一个多项目 Agent 工作区。

它用于统一管理多个独立业务项目的共享需求、架构说明、接口契约和任务方案。`projects/` 下的源码项目仍然保持各自独立的 git 历史。

## 目录结构

```txt
X/
  AGENTS.md
  contracts/
  docs/
  projects/
  scripts/
  tasks/
```

## 项目角色

- `projects/webapp`：Web 端项目。
- `projects/mobile`：移动端项目。
- `projects/nky`：后端项目。
- `projects/bureau`：独立项目，绩效管理平台（绩效通）。

## 工作流程

1. 在 `tasks/<feature-name>/` 下创建一个任务目录。
2. 在 `requirements.md` 中编写共享需求。
3. 在 `contracts/` 中更新共享契约。
4. 分别在后端、Web 端、移动端项目中实现改动。
5. 分别运行各项目的测试。
6. 分别在各子项目中独立提交代码。
7. 在 `tasks/<feature-name>/rollout.md` 中记录发布说明。
