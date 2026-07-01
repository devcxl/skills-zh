Quickstart:

```bash
npx skills add mattpocock/skills --skill=resolving-merge-conflicts
```

```bash
npx skills update resolving-merge-conflicts
```

[Source](https://github.com/mattpocock/skills/tree/main/skills/engineering/resolving-merge-conflicts)

## 它的作用

`resolving-merge-conflicts` 逐段处理进行中的 git merge 或 rebase 冲突，并完成整个操作——解析、检查、提交。

它通过**意图**来解析，而非通过文本。在接触一个冲突段之前，它会将每一方追溯回其**原始来源**——commit 消息、PR、原始 issue——以理解该变更的原因，然后在兼容的前提下保留双方的意图。它不会为了掩盖冲突而凭空制造新的行为，也绝不会使用 `--abort`：merge 一定会完成。

## 何时使用

键入 `/resolving-merge-conflicts`，或者当任务符合时代理会自动使用它。

当你正处于 merge 或 rebase 中间，且 git 停在了无法自动解决的冲突上时使用。它适用于你面前的实际冲突——不适用于规划 merge 或调试后续出现的异常行为。如果 merge 已完成但某些功能因你无法查明的原因出现故障，请使用 [diagnosing-bugs](https://aihero.dev/skills-diagnosing-bugs)。

## 按意图解析

冲突的陷阱在于将其视为一个文本问题——选择"我们的"或"他们的"来消除标记。本技能将其视为一个**意图**问题。冲突段的每一方之所以存在，是因为有人想要某个结果；解决方案必须在可能的情况下尊重双方的诉求，并在确实无法兼容时，选择符合 merge 既定目标的一方，并明确说明取舍。

这就是原始来源重要的原因。你无法保留一个连读都没读过的意图，因此工作从历史记录开始——commits、PRs、工单——而不是从 diff 开始。

## 它发挥作用的表现

- 每个已解决的冲突段都保留了双方的行为，或者在无法保留时说明了取舍。
- 不引入任何不在任一方分支上的新行为。
- 项目自身的检查——类型检查、测试、格式化——在提交前会被找到并运行通过（绿灯）。
- merge 或 rebase 完整进行到完成提交，绝不中止。

## 它的定位

一个随时可用的独立技能：在 merge 或 rebase 卡住时调用，它会交还给你一个干净、已提交的树。它的近邻是 [diagnosing-bugs](https://aihero.dev/skills-diagnosing-bugs)，因为一个 merge 虽然干净完成但后续行为异常，这是诊断问题，而非冲突问题。当你不确定适合哪种技能时，[ask-matt](https://aihero.dev/skills-ask-matt) 会为你指引。
