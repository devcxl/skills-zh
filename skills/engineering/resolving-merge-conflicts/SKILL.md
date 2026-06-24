---
name: resolving-merge-conflicts
description: "当你需要解决正在进行的 git merge/rebase 冲突时使用。"
---

1. **查看当前状态** 查看 merge/rebase 的当前状态。检查 git 历史记录和冲突文件。

2. **找到每个冲突的主要来源** 深入理解每个变更的原因以及原始的意图。阅读 commit 消息，查看 PR，查看原始的 issues/tickets。

3. **解决每个冲突块（hunk）** 尽可能保留双方的意图。如果不兼容，选择符合 merge 所述目标的一方，并记录权衡。**不要**发明新行为。始终解决冲突；永远不要 `--abort`。

4. 发现项目的**自动化检查**并运行它们 —— 通常是类型检查，然后是测试，最后是格式化。修复 merge 破坏的任何内容。

5. **完成 merge/rebase** 暂存所有内容并提交。如果是 rebase，继续 rebase 过程直到所有 commit 都 rebase 完成。
