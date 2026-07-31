# 各项目最近修改快照

> 快照时间：2026-07-30 16:08 +0800。每项均为当前分支的 `git log -10`；提交标题保持原文，需追溯具体改动时使用 SHA 查看 diff。本文件是协作上下文，不替代各项目自己的 Git 历史。

## 项目位置与工作区状态

| 项目 | 来源路径 | 分支 | 快照时状态 |
| --- | --- | --- | --- |
| Web | `repos/webapp` | `NKY-2026-07B` | 干净 |
| 移动端 | `repos/mobile` | `NKY-2026-07B` | 干净 |
| 后端 | `repos/nky` | `master` | 干净 |
| 小控 | `repos/xiaokong` | `2026-07` | 干净 |
| 绩效平台 | `/Users/zhangsenlin/nky/code/2025-02-11/bureauweb` | 未核验 | 工作区外，尚未映射到 `repos/bureau` |

## Web

| SHA | 日期 | 修改 |
| --- | --- | --- |
| `617f3ef029` | 2026-07-30 | feat: 优化代码逻辑 |
| `9666d7ef82` | 2026-07-30 | fix:[HKNKY-3367] |
| `45c214bb4b` | 2026-07-30 | fix:[HKNKY-3366] |
| `f4ced4e899` | 2026-07-30 | fix:[HKNKY-3364] |
| `00b81c5fff` | 2026-07-29 | feat:[HKNKY-3238] |
| `5cfab0868a` | 2026-07-27 | feat: 刚师傅说把他修改的东西还原 |
| `6a372db4ca` | 2026-07-26 | 优化agent |
| `625cee4c97` | 2026-07-25 | 优化事申请单查询条件 |
| `9953f46620` | 2026-07-20 | fix: 打包报错的问题 |
| `2796187c8d` | 2026-07-17 | 版本号修改为6.49.0 |

## 移动端

| SHA | 日期 | 修改 |
| --- | --- | --- |
| `da7837ab` | 2026-07-29 | feat:[HKNKY-3238] |
| `0cbdb103` | 2026-07-26 | 优化agents |
| `369b8903` | 2026-07-26 | Merge branch 'NKY-master' of https://codeup.aliyun.com/62e3dad9de1705ebb4f36003/neikongyi/mobile into NKY-master |
| `1e228e31` | 2026-07-26 | 优化agent |
| `220fc53b` | 2026-07-21 | fix:[HKNKY-3359] |
| `4aeba393` | 2026-07-17 | 版本号修改为6.49.0 |
| `9ce81d87` | 2026-07-16 | fix:[HKNKY-3357] |
| `82e865dd` | 2026-07-15 | fix:[HKNKY-3313] |
| `1ea576c5` | 2026-07-14 | fix:[HKNKY-3307] |
| `befc1bde` | 2026-07-14 | docs: agents.md |

## 后端

| SHA | 日期 | 修改 |
| --- | --- | --- |
| `930113b14` | 2026-07-23 | fix 多个采购单的情况 |
| `cfc7fd353` | 2026-06-26 | 6.66.0 |
| `c828b955b` | 2026-06-26 | Merge branch 'dev_2026-06' |
| `d8ba6787d` | 2026-06-25 | 1 |
| `19dc35134` | 2026-06-25 | feat 添加火车票号码字段并更新相关逻辑以支持序列号和号码的重复性检查 |
| `769a2ec17` | 2026-06-24 | Implement reimbursement state reset for 沧职院 delivery node in ApprovalLogServiceImpl |
| `b1e99b719` | 2026-06-24 | 测试 |
| `a8fc892a8` | 2026-06-24 | 修改发送短信 |
| `aa66e1410` | 2026-06-23 | refactor 优化审批短信通知逻辑，确保在事务提交后发送短信 |
| `551063dcb` | 2026-06-23 | feat 审批消息以短信的形式通知 |

## 小控

| SHA | 日期 | 修改 |
| --- | --- | --- |
| `031d6a1` | 2026-07-30 | 修改agents 将GQL 路由添加上 |
| `92b4554` | 2026-07-30 | feat: uploadToRag |
| `2d8aeef` | 2026-07-28 | feat: 优化代码逻辑 |
| `05b20d1` | 2026-07-26 | Merge branch '2026-07' of https://codeup.aliyun.com/62e3dad9de1705ebb4f36003/neikongyi/xiaokong into 2026-07 |
| `4f17f3b` | 2026-07-26 | 优化agent |
| `6087237` | 2026-07-24 | 1. bpmn解析和选择文件提取规则分开请求，选择了才请求，以减少幻觉。 |
| `bd3c6ea` | 2026-07-23 | feat: 新增测试作业层标准（tests/AGENTS.md + 全量测试脚本 + 报告规范） |
| `1b771f5` | 2026-07-22 | feat: 优化代码逻辑 |
| `121d019` | 2026-07-22 | feat：Harness优化 |
| `fe070e8` | 2026-07-22 | feat: 优化一版小控 |
