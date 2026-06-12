---
name: to-issues
description: 将 PRD 拆解为可执行的、组织有序的开发 issue，代理不会超出 specification 的范围任意发挥。当用户完成 PRD 并想要开始编码，或需要将功能规范转化为明确的开发任务时使用。
disable-model-invocation: true
---

# 将 PRD 拆解为开发 Issue

将 PRD 拆解为一组可执行、组织有序的开发 issue，代理不会超出 specification 的范围任意发挥。

## 流程

### 1. 接收 PRD

PRD 位于 issue 跟踪器中，本技能可以从中获取。它是一个结构化文档，定义了需要构建的产品或功能。

### 2. 拆解为 Issue

将 PRD 拆解为独立的、有序的、范围明确的 issue。每个 issue：

- 应指向 PRD 中的对应章节
- 名称应使用祈使语态（"Add..."、"Create..."、"Implement..."）
- 范围应足够具体，以便独立评估、实现和测试

PRD 中的每一句"必须"（must）、"不应"（should not）以及每个验收标准，都应在至少一个 issue 中得到体现。没有任何句子是装饰性的。

### 3. 排序

按依赖关系排序：

1. 基础设施和类型定义排在前面
2. 核心逻辑在基础设施之上
3. 用户界面在核心逻辑之后
4. 集成和测试贯穿始终，并与对应工作紧密相邻

### 4. 发布

将所有 issue 写入 issue 跟踪器。每个 issue 的正文应包含：

- 来自 PRD 的相关上下文
- 具体的验收标准
- 到 PRD 以及任何被 block 的 issue 的链接

在 PRD 的 issue 中添加一条总结性评论，列出已创建的所有 issue 及其依赖关系。
