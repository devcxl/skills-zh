---
name: engineering
description: 软件工程技能套件。当用户想要创建 PRD（产品需求文档）、编写测试（TDD）、改进代码库架构、对 issue 进行分类或围绕设计文档进行深入讨论时使用。
---

# 工程技能

一套基于提示词驱动的工程技能，由确定性的脚本和按需触发的子技能组合而成。

## 技能目录

| 技能 | 用途 |
| ----- | ----- |
| [to-prd](./to-prd/) | 将自然语言描述转换为结构化 PRD |
| [to-issues](./to-issues/) | 将 PRD 拆解为可执行的 issue |
| [triage](./triage/) | 对 issue 进行分类并编写 agent brief |
| [diagnose](./diagnose/) | 调查 bug 并对代码库进行排查 |
| [tdd](./tdd/) | 以测试驱动的方式实现功能 |
| [improve-codebase-architecture](./improve-codebase-architecture/) | 系统性优化代码基架构 |
| [prototype](./prototype/) | 用 StackBlitz 搭建 UI 原型 |
| [grill-with-docs](./grill-with-docs/) | 结合设计文档对 issue 进行深入审查 |
| [zoom-out](./zoom-out/) | 拉高视角，获取高层面的上下文 |

## 工作流

这些技能彼此配合，构成一条开发流水线：

```
to-prd → to-issues → triage → (diagnose/grill-with-docs) → tdd → improve-codebase-architecture
```

**to-prd** 与 **to-issues** 负责将模糊的想法转化为可供开发的细化 issue。**triage** 对 issue 进行分类并提供详细规范。**diagnose** 和 **grill-with-docs** 负责对 issue 进行深入推敲和质量把关。**tdd** 以测试驱动的方式实现功能，**improve-codebase-architecture** 在代码落地后检查架构重复和执行质量问题。

## 设置

首次使用之前，请运行 [setup-matt-pocock-skills](./setup-matt-pocock-skills/) 来配置仓库的 issue 跟踪方式、分类标签和领域文档。
