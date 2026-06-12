# Issue 跟踪器：本地 Markdown

本仓库的 issue 和 PRD 以 markdown 文件的形式存放在 `.scratch/` 中。

## 约定

- 一个功能对应一个目录：`.scratch/<feature-slug>/`
- PRD 文件：`.scratch/<feature-slug>/PRD.md`
- 实现 issue：`.scratch/<feature-slug>/issues/<NN>-<slug>.md`，从 `01` 开始编号
- 分类状态以 `Status:` 行的形式记录在每个 issue 文件顶部附近（角色字符串见 `triage-labels.md`）
- 评论和对话历史追加到文件末尾的 `## Comments` 标题下

## 当技能说"发布到 issue 跟踪器"

在 `.scratch/<feature-slug>/` 下创建新文件（如目录不存在则先创建）。

## 当技能说"获取相关票"

读取所引用路径下的文件。用户通常会直接传递路径或 issue 编号。
