快速入门：

```bash
npx skills add mattpocock/skills --skill=to-prd
```

```bash
npx skills update to-prd
```

[源仓库](https://github.com/mattpocock/skills/tree/main/skills/engineering/to-prd)

## 功能

`to-prd` 将当前对话和你的代码库理解转化为一份产品需求文档，然后发布到你的 issue 跟踪器中。

它**不会再次盘问你**。当你调用它时，对齐工作已经完成——`to-prd` 综合已知信息，而不是提出新一轮问题。

## 何时使用

通过输入 `/to-prd` 来调用——Agent 不会自行调用。

在变更已经被充分讨论、领域语言已经确定，并且你希望在编写任何代码之前将共享理解作为规格说明记录下来时使用。如果你*尚未*对齐，先进行盘问——可以使用 [grill-with-docs](https://aihero.dev/skills-grill-with-docs)。要将完成的 PRD 拆分为 ticket，使用 [to-issues](https://aihero.dev/skills-to-issues)。

## 前置条件

`to-prd` 发布到你的 issue 跟踪器中，因此 [setup-matt-pocock-skills](https://aihero.dev/skills-setup-matt-pocock-skills) 必须先为此仓库配置好跟踪器和分类标签。它会自行应用 `ready-for-agent` 标签——无需单独的分类步骤。

## PRD 包含的内容

- **问题陈述**——什么被破坏或缺失，以及为什么值得解决，用项目自身的语言表述。
- **解决方案**——修复的高层形态，在进入实现细节之前。
- **用户故事**——一个详尽的、编号的行为列表，变更必须支持这些行为，每个都可独立检查。
- **实现决策**——对话中已经确定的方案选择，以避免后续重新争执。
- **测试决策**——该功能将在哪些接缝处进行测试，以及"完成"的标准。
- **范围外项目**——此次变更有意*不*涵盖的内容，以保持 ticket 边界清晰。
- **进一步说明**——任何值得传达但不属于上述类别的其他内容。

## 深度模块

在编写 PRD 之前，`to-prd` 会勾勒功能将在哪些**接缝**处进行测试，并寻找**深度模块**机会——大量功能隐藏在小型稳定接口之后。它偏好现有的接缝而非新的，并选择尽可能高的接缝，理想情况下整个变更只需要一个。

这对智能体驱动开发很重要：一个好的接口为测试提供了持久的目标，因此底层代码可以变动而测试无需更改。

## 验证标准

- 它开始在 PRD 中写作，而不是提出新一轮问题。
- 它在编写前与你确认接缝，并建议尽可能少。
- PRD 使用你项目的领域语言返回，而非通用模板。

## 在生态中的位置

`to-prd` 是主构建链中的一环：

```txt
grill-with-docs → to-prd → to-issues → implement → code-review
```

在计划与领域语言已确定之后、将工作拆分为实现 ticket 之前调用。它的关键邻居是 [grill-with-docs](https://aihero.dev/skills-grill-with-docs)，用于锤炼上下文以使 PRD 更加精确；以及 [to-issues](https://aihero.dev/skills-to-issues)，将 PRD 转化为 [implement](https://aihero.dev/skills-implement) 可构建的独立 issue。当你不确定哪个技能或流程适合时，[ask-matt](https://aihero.dev/skills-ask-matt) 会引导你。
