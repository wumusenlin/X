# 发布记录

## 本次范围

- 更新 X 根 `AGENTS.md`：子项目提交或推送后的快照刷新和 X 根独立提交规则。
- 刷新 `docs/agent/recent-project-changes.md`：Web、移动端、后端、小控的当前分支、工作区状态和最近十条提交。
- 已登记小控提交 `386d36d feat(rag): split generated files by source`。

## 验证

- `git diff --check`
- `rg -n "386d36d|提交或推送" AGENTS.md docs/agent/recent-project-changes.md`

## 发布顺序

1. 经用户授权提交 X 根仓库的规则、快照和任务记录。
2. 经用户单独授权推送 X 根仓库。

本次未修改任何子项目代码、分支或历史；X 根仓库已提交，未推送。
