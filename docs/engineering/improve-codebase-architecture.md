快速入门：

```bash
npx skills add mattpocock/skills --skill=improve-codebase-architecture
```

```bash
npx skills update improve-codebase-architecture
```

[源仓库](https://github.com/mattpocock/skills/tree/main/skills/engineering/improve-codebase-architecture)

## 功能

`improve-codebase-architecture` 扫描代码库寻找**深化机会**——浅模块（接口几乎和它隐藏的东西一样复杂）可以变成深度模块的地方——以一份独立的可视化 HTML 报告呈现，然后通过盘问深入你选择的任何一个。

它**不会**给你一个扁平的重构列表。每个候选者必须通过**删除测试**——移除此模块会*将*复杂性*集中*到更小的接口后面，还是仅仅将其搬来搬去？只有"集中"的情况才获得一个卡片。这个过滤器防止报告变成泛泛的清理建议。

## 何时使用

通过输入 `/improve-codebase-architecture` 来调用——Agent 不会自行调用。

作为定期健康检查使用：每隔几天，或者每当一个代码库开始感觉需要太多地在小型模块之间跳转才能理解一个概念时。它读取现有的架构并建议在哪里进行深化。如果你已经知道要重新设计的模块，只需要思考的词汇表，请改用 [codebase-design](https://aihero.dev/skills-codebase-design)——这个技能是找到候选者的勘查；那个是设计的工作台。

## 深化机会

整个技能围绕一个理念展开：**深度**。深度模块将大量功能隐藏在小而稳定的接口后面；浅模块通过几乎和底层代码一样宽的接口泄漏其实现。报告猎寻浅度——仅为了可测试性提取的纯函数，而真正的 bug 隐藏在其调用方式中（没有**局部性**）、跨越**接缝**泄漏的模块、不打开五个文件就无法理解的概念——并提出解决该问题的深化方案。

它使用共享的设计词汇表（**模块**、**接口**、**深度**、**接缝**、**适配器**、**杠杆**、**局部性**）以及来自 `CONTEXT.md` 的项目自身领域语言，因此一个候选者读起来像是"深化 Order intake 模块"，而不是"重构 FooBarHandler"。

## 报告，然后盘问

输出是一个写入操作系统临时目录的浏览器就绪 HTML 文件——不会落在仓库里。每个候选者是一张卡片，包含涉及的文件、摩擦点、通俗易懂的解决方案、在局部性和杠杆方面的收益、前后对比图，以及一个 `Strong` / `Worth exploring` / `Speculative` 徽章。它以它将首先处理哪个候选者作为结尾。

然后它停下来询问你想探索哪一个。选择一个，它就在那个设计上运行 [grilling](https://aihero.dev/skills-grilling) 循环——约束条件、接缝后面的东西、哪些测试能够存活——在决策确定时内联更新领域模型。

## 在生态中的位置

`improve-codebase-architecture` 是**定期维护**——每隔几天运行一次，而不是链中的一个步骤。它的邻居是 [codebase-design](https://aihero.dev/skills-codebase-design)，拥有每个候选者所用的深度与接缝词汇表；[grilling](https://aihero.dev/skills-grilling)，一旦你选择了候选者就遍历设计树；以及 [domain-modeling](https://aihero.dev/skills-domain-modeling)，在重新设计确定时保持 `CONTEXT.md` 和 ADR 的更新。当你不确定哪个技能或流程适合时，[ask-matt](https://aihero.dev/skills-ask-matt) 会引导你。
