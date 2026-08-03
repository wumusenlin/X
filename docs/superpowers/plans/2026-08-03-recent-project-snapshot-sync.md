# 子项目最近修改快照自动同步 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 让任一子项目提交或推送后的最新提交自动进入 X 根最近修改快照。

**Architecture:** 在 X 根 `AGENTS.md` 固化代理收口规则；`docs/agent/recent-project-changes.md` 保持所有纳管子项目的分支、工作区状态和最新十条提交。本次重建四个纳管子项目的快照，因此全局时间与内容一致。

**Tech Stack:** Git、Markdown。

## Global Constraints

- 不修改 `repos/*` 的业务代码、分支或历史。
- 不新增 Git Hook、脚本或依赖。
- 快照提交与子项目提交保持独立；不自动推送 X 根仓库。
- 只记录提交 SHA、标题、日期和工作区是否干净；不写入未提交改动的内容。

---

### Task 1: 固化子项目提交后的快照收口规则

**Files:**
- Modify: `AGENTS.md`

**Interfaces:**
- Consumes: `repos/<project>` 的独立 Git 历史。
- Produces: 代理在子项目 `git commit` 或 `git push` 后必须执行的快照更新规则。

- [x] **Step 1: 写入规则**

在“变更纪律”中增加：子项目提交或推送完成后，代理必须在结束回复前刷新 `docs/agent/recent-project-changes.md`；快照有变化时，须经用户授权在 X 根仓库独立提交；不得将嵌套子项目暂存到 X 根。

- [x] **Step 2: 核验规则入口**

Run:

```bash
rg -n "recent-project-changes|提交或推送|独立提交" AGENTS.md
```

Expected: 命中快照文件、触发条件和 X 根独立提交责任。

### Task 2: 刷新最近修改快照

**Files:**
- Modify: `docs/agent/recent-project-changes.md`

**Interfaces:**
- Consumes: `git -C repos/<project> status --short --branch` 与 `git log -10 --date=short --pretty=format:'%h|%ad|%s'`。
- Produces: 当前纳管子项目的分支、工作区状态和最近十条提交，包含小控 `386d36d`。

- [x] **Step 1: 更新快照时间和项目状态表**

使用本次读取时刻，更新 Web、移动端、后端、小控的当前分支与干净/有未提交修改状态。

- [x] **Step 2: 更新四个项目的最近十条提交**

按各子项目 `git log -10` 的时间倒序更新表格。小控首条必须为：

```text
386d36d | 2026-08-03 | feat(rag): split generated files by source
```

- [x] **Step 3: 核验快照**

Run:

```bash
rg -n "386d36d|5228cdecbd|2a20e514|1aa1f710d" docs/agent/recent-project-changes.md
```

Expected: 四个项目当前最新提交均存在。

### Task 3: 收口记录与验证

**Files:**
- Modify: `tasks/recent-project-snapshot-sync/rollout.md`

**Interfaces:**
- Consumes: Task 1、Task 2 的改动和验证结果。
- Produces: 本次快照更新时间、验证命令、X 根提交/推送边界。

- [x] **Step 1: 写入发布记录**

记录本次仅更新 X 根规则和协作快照；未修改任何子项目代码；X 根未提交、未推送。

- [x] **Step 2: 运行最终验证**

Run:

```bash
git diff --check
rg -n "386d36d|git commit|git push" AGENTS.md docs/agent/recent-project-changes.md
```

Expected: 无空白错误，自动同步规则和小控最新提交均可检索。
