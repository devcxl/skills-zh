---
name: improve-codebase-architecture
description: 审视最近合并的 PR 和 issue，从中提取对仓库架构的理解，然后在最终的 HTML 报告中优先列出高价值的架构改进项，并附上实际的代码示例。
disable-model-invocation: true
---

# 改进代码基架构

从最近合并的 PR 和 issue 中系统性提炼架构洞察，并以可视化 HTML 报告的形式输出。它的目标不是给出笼统的改进建议，而是找出**重复的模式**，再利用这个模式去**识别其他有类似问题的地方**，最后在报告中优先列出那些**影响面最广的修改**。

本技能分为五个阶段：

1. **采集**（deepening）—— 挖掘最近的工作，理解现状
2. **识别**（deepening）—— 找出反复出现的模式以识别问题
3. **反馈**（interface design）—— 将模式转化为接口设计
4. **输出**（HTML report）—— 生成 HTML 报告
5. **实施**（language.md）—— 用一种能将破坏性降到最低的语言与用户交流

这五个阶段的文档分布在以下文件中：
- [deepening.md](DEEPENING.md)
- [interface-design.md](INTERFACE-DESIGN.md)
- [language.md](LANGUAGE.md)
- [html-report.md](HTML-REPORT.md)
