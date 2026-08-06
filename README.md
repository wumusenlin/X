# X

X 是一个多项目 Agent 工作区。根目录下的源码项目仍然保持各自独立的 Git 历史；协作档案、协作规范和产品文档分别存放在独立仓库中。

## 目录结构

```txt
X/
  AGENTS.md
  agent-workspace/
  agent-sop/
  framework/
  mobile/
  nky/
  out/
  product-docs/
  webapp/
  xiaokong/
```

## 项目角色

- `webapp`：Web 端项目。
- `mobile`：移动端项目。
- `nky`：后端项目。
- `xiaokong`：智能对话项目，通过 iframe 内嵌到 Web 端。
- 绩效平台当前位于工作区外的 `/Users/zhangsenlin/nky/code/2025-02-11/bureauweb`；尚未映射到 `bureau/`。

目录主责、跨项目接管和小控嵌入边界见 [协作角色规则](agent-sop/docs/collaboration/roles.md)。

## 工作流程

1. 在 `agent-workspace/<主责项目>/<任务ID>/` 创建或确认任务档案。
2. 在 `SPEC.md` 写明需求、唯一主责、协作角色、跨域接管、接口约定和验收标准。
3. 在受影响的子项目中实现改动，并按各项目的真实命令验证。
4. 使用 `agent-sop/archive-task-commit.sh <任务ID> <主责项目> <提交项目> HEAD` 记录提交证据。
5. 在 `TASK_LOG.md`、`PLAYBOOK.md` 和 `HANDOVER.md` 更新任务状态、验证和发布顺序。
6. 产品对用户的承诺发生变化时，更新 `product-docs/` 的能力文档和发布记录。
