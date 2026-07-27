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
- `projects/xiaokong`：智能对话项目，通过 iframe 内嵌到 Web 端。
- `projects/bureau`：独立项目，绩效管理平台（绩效通）。

目录主责、跨项目接管和小控嵌入边界见 [协作角色规则](docs/collaboration/roles.md)。

## 工作流程

1. 在 `tasks/<feature-name>/` 下创建一个任务目录。
2. 在跨项目任务的 `ownership.md` 中指定唯一主责、协作角色和跨域接管范围。
3. 在 `requirements.md` 中编写共享需求。
4. 在 `contracts/` 中更新共享契约。
5. 分别在后端、Web 端、移动端项目中实现改动。
6. 分别运行各项目的测试。
7. 分别在各子项目中独立提交代码。
8. 在 `tasks/<feature-name>/rollout.md` 中记录发布说明。
