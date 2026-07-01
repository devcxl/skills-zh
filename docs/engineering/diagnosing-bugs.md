快速入门：

```bash
npx skills add mattpocock/skills --skill=diagnosing-bugs
```

```bash
npx skills update diagnosing-bugs
```

[源仓库](https://github.com/mattpocock/skills/tree/main/skills/engineering/diagnosing-bugs)

## 功能

`diagnosing-bugs` 对棘手的 bug 和性能回归运行规范化的诊断循环——构建复现、最小化、排序假设、插桩检测，然后修复并加上回归测试。

它拒绝在你拥有**紧反馈循环**之前做假设——一个已经能在此 bug 上发现红的可运行命令。在存在那个命令之前阅读代码来构建理论，正是这个技能要防止的失败。没有能显红的循环，就没有诊断。

## 何时使用

输入 `/diagnosing-bugs`，或者当任务合适时 Agent 会自动调用——在你说"诊断一下" / "调试这个"时触发，或者当你报告有东西坏了、抛异常、失败或缓慢时。

在疑难杂症上使用它：一眼看不出的 bug、间歇性闪退、在两个已知正常状态之间溜进来的回归。如果你只是想要一个快速的可丢弃工具来验证设计问题而不是追猎缺陷，请改用 [prototype](https://aihero.dev/skills-prototype)。

## 紧循环就是技能本身

其他所有东西——二分查找、假设检验、插桩检测——一旦你有了信号就都是机械性的。因此这个技能将不成比例的精力花在第一阶段：构建一个通过/失败的命令，驱动实际 bug 的代码路径并断言用户的精确症状，然后**收紧**它，直到它快速、确定且 Agent 可运行。一个 30 秒的不稳定循环跟没有差不多；一个 2 秒的确定性循环则是调试的超能力。

它提供了一套构建该循环的方法阶梯——失败的测试、curl 脚本、CLI diff、无头浏览器、回放 trace、可丢弃的 harness、fuzz 循环、`git bisect run`、差异化运行——并且仅作为最后手段，一个人在回路中的 bash 脚本。对于非确定性 bug，目标不是一个干净的复现而是一个**更高的复现率**：循环触发器、并行化、增加压力，直到闪退变得可调试。

## 验证标准

- 它在做假设*之前*构建并运行一个复现命令——并粘贴调用方式和其红色输出。
- 该循环断言你实际报告的症状，而不是一个临近的失败。
- 假设作为一个排序的、可证伪的列表呈现给你，在它们被测试之前。
- 调试检测被标记为（`[DEBUG-...]`）并在声明完成前被 grep 去掉。

## 在生态中的位置

`diagnosing-bugs` 是一个随时可用的独立技能——当有东西坏了时你切入它，然后在修复和回归测试完成后退出。如果真正的发现是没有好的接缝来锁定 bug，其事后分析会交给 [improve-codebase-architecture](https://aihero.dev/skills-improve-codebase-architecture)——代码，而非 bug，才是问题。当你不确定哪个技能适合时，[ask-matt](https://aihero.dev/skills-ask-matt) 会引导你。
