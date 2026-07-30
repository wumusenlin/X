# 任务

每个跨项目功能或变更创建一个独立目录。

推荐结构：

```txt
tasks/<feature-name>/
  requirements.md
  ownership.md
  domain-model.md
  <project>-plan.md
  test-plan.md
  rollout.md
```

跨项目任务必须填写 `ownership.md`：指定唯一任务主责、协作角色，以及任何跨域代码修改的接管范围和验证责任。
