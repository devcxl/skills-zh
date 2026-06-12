# 领域文档

`setup-matt-pocock-skills` 会确认本仓库的领域文档布局，并将消费规则写入 `docs/agents/domain.md`。本文件是那个种子模板，在配置过程中会被复制或参考。

## 消费规则

当你被指示"使用项目领域术语表"或"查阅领域文档"时：

1. 找出与当前工作相关的 `CONTEXT.md` 文件
   - 如果是单上下文：仓库根目录下的 `CONTEXT.md`
   - 如果是多上下文：通过 `CONTEXT-MAP.md` 定位到相关上下文

2. 在与用户对话及编写 agent brief 时，使用上下文中定义的术语

3. 对照 `docs/adr/` 检查你的工作，避免违反现有的架构决策

## 上下文布局

### 单上下文

```
CONTEXT.md           ← 整个仓库的领域术语表
docs/adr/            ← 架构决策记录（ADR）
```

大多数仓库都是单上下文。一个 `CONTEXT.md` 文件描述整个项目。

### 多上下文

```
CONTEXT-MAP.md       ← 将区域映射到其上下文文件
src/backend/CONTEXT.md
src/frontend/CONTEXT.md
src/backend/docs/adr/
src/frontend/docs/adr/
```

多上下文适用于各子系统使用不同领域语言的 monorepo 或大型项目。

`CONTEXT-MAP.md` 应包含：

- 每个上下文的名称和路径
- 对每个上下文负责范围的 1–2 句描述
- 如何判断一段代码或议题属于哪个上下文的指南

---

> 此文件在运行 `setup-matt-pocock-skills` 时生成。关于上下文文件内容的详细说明，参见 [CONTEXT-FORMAT.md](../grill-with-docs/CONTEXT-FORMAT.md)。
