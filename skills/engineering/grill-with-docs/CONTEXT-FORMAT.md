# 上下文格式

本文档描述工程技能如何从仓库的上下文文件中获取项目语境。执行 `/setup-matt-pocock-skills` 以配置本仓库的具体设置。

## 领域文档布局

`setup-matt-pocock-skills` 会确认仓库采用的是**单上下文**还是**多上下文**布局，并在 `docs/agents/domain.md` 中记录消费规则。

### 单上下文

```
CONTEXT.md           ← 唯一的上下文来源
docs/adr/            ← 适用于整个项目
```

### 多上下文

```
CONTEXT-MAP.md       ← 指向各个上下文的映射
src/backend/CONTEXT.md
src/frontend/CONTEXT.md
src/backend/docs/adr/
src/frontend/docs/adr/
```

在多上下文仓库中，`CONTEXT-MAP.md` 会列出每个领域包及其对应的 `CONTEXT.md` 路径，以及一个简短的帮助说明，教你如何确定一个新文件属于哪个上下文。

## CONTEXT.md 的内容

`CONTEXT.md` 是面向 agent 的领域术语表，不是架构文档。它通常包含：

- **术语** —— 领域核心词汇的定义以及它们之间的关系
- **模块** —— 主要代码区域的高层地图以及各区域的职责
- **模式** —— 在代码库中反复出现的设计模式和约定

## 如何使用上下文

当某个技能（如 `triage`、`diagnose` 或 `improve-codebase-architecture`）提示你去"使用项目的领域术语表"时，即意味着：

1. 读取与当前任务或区域相关的 `CONTEXT.md` 文件
2. 在与用户对话时，使用上下文中定义的术语（例如：上下文说"任务树（task tree）"而非"依赖图（dependency graph）"）
3. 参照上下文中描述的分层结构，将代码变更对应到正确的模块边界

上下文的目的是让你能够使用与项目维护者一致的词汇，去讨论代码库的结构。
