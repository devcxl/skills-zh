Quickstart:

```bash
npx skills add mattpocock/skills --skill=ask-matt
```

```bash
npx skills update ask-matt
```

[Source](https://github.com/mattpocock/skills/tree/main/skills/engineering/ask-matt)

## 它的作用

`ask-matt` 是一个路由器——它读取你对当前情况的描述，并告诉你接下来应该使用哪个 Matt Pocock 技能。

它**不会**替你运行这些技能——它只是指引方向。你告诉它你想要做什么，它查看所有可用技能的目录，并推荐正确的一个（或流程）。因为它知道每项技能是做什么的以及它们如何组合在一起，所以它可以在你不知道某项技能存在的情况下为你指引方向。

## 何时使用

你通过键入 `/ask-matt` 来调用它——代理不会主动使用它。

当你遇到问题但不确定从哪个技能开始时使用。当你脑子里有一个目标（"我想让代码更安全"）但不知道哪个技能与之对应时。当你知道一个技能，但不确定它是否适合这个任务时。当一段跨技能的工作流程需要一个起点时。`ask-matt` 有意成为认知负载的减压阀——当你无法脑内保留整个目录时，你问这个路由器。

## 路由器而非数据库

`ask-matt` 不是一个工具列表。它理解技能之间的关系——哪些先运行，哪些产生后续所需的产物，哪些是替代方案。当你问"我想重构这个模块"时，它知道 [improve-codebase-architecture](https://aihero.dev/skills-improve-codebase-architecture) 是走访式的选项，而 [prototype](https://aihero.dev/skills-prototype) 是尝试性的选项。它用一个方向来回答，而不是一行行的列表。

## 它的定位

`ask-matt` 是跨越整个技能集合的路由器——当你不确定使用哪个技能或流程时使用它。它本身不在任何构建链中，它位于它们之上。它的近邻是你正在阅读的文档页面——每页底部都链接到它，所以无论你从哪个文档页面开始，你总能找到方向。每项技能的文档页面底部都有 `[ask-matt](https://aihero.dev/skills-ask-matt)` 链接，这是你从单页视图进入整个系统的入口。
