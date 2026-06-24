---
name: scaffold-exercises
description: 创建包含 section、problem、solution 和 explainer 的练习目录结构，且能通过 lint 检查。当用户想要搭建练习框架、创建练习模板或设置新的课程章节时使用。
---

# 搭建练习框架

创建能通过 `pnpm ai-hero-cli internal lint` 检查的练习目录结构，然后使用 `git commit` 提交。

## 目录命名规则

- **章节（Sections）**：位于 `exercises/` 下的 `XX-section-name/` 格式（例如 `01-retrieval-skill-building`）
- **练习（Exercises）**：位于章节内的 `XX.YY-exercise-name/` 格式（例如 `01.03-retrieval-with-bm25`）
- 章节编号 = `XX`，练习编号 = `XX.YY`
- 名称使用短横线命名法（小写字母、连字符）

## 练习变体

每个练习至少需要以下子文件夹之一：

- `problem/` — 学生工作区，包含 TODO
- `solution/` — 参考实现
- `explainer/` — 概念讲解材料，不包含 TODO

创建模板时，除非计划另有说明，否则默认使用 `explainer/`。

## 必需文件

每个子文件夹（`problem/`、`solution/`、`explainer/`）需要一个 `readme.md`，要求：

- **不能为空**（必须有实际内容，哪怕只有一行标题也可以）
- 不能有损坏的链接

创建模板时，创建一个包含标题和描述的极简 readme：

```md
# Exercise Title

Description here
```

如果子文件夹包含代码，还需要一个 `main.ts`（超过 1 行）。但对于模板来说，仅有 readme 的练习也是可以的。

## 工作流程

1. **解析计划** — 提取章节名称、练习名称和变体类型
2. **创建目录** — 使用 `mkdir -p` 创建每个路径
3. **创建 readme 模板** — 每个变体文件夹一个 `readme.md`，包含标题
4. **运行 lint** — 执行 `pnpm ai-hero-cli internal lint` 进行验证
5. **修复错误** — 反复修改直到 lint 通过

## Lint 规则摘要

linter（`pnpm ai-hero-cli internal lint`）检查以下内容：

- 每个练习都有子文件夹（`problem/`、`solution/`、`explainer/`）
- 至少存在 `problem/`、`explainer/` 或 `explainer.1/` 其中之一
- 主要子文件夹中存在 `readme.md` 且不为空
- 没有 `.gitkeep` 文件
- 没有 `speaker-notes.md` 文件
- readme 中没有损坏的链接
- readme 中没有 `pnpm run exercise` 命令
- 每个子文件夹需要 `main.ts`，除非仅有 readme

## 移动/重命名练习

在重新编号或移动练习时：

1. 使用 `git mv`（而不是 `mv`）重命名目录 — 这样可以保留 git 历史
2. 更新数字前缀以保持顺序
3. 移动后重新运行 lint

示例：

```bash
git mv exercises/01-retrieval/01.03-embeddings exercises/01-retrieval/01.04-embeddings
```

## 示例：根据计划创建模板

给定一个计划如：

```
Section 05: Memory Skill Building
- 05.01 Introduction to Memory
- 05.02 Short-term Memory (explainer + problem + solution)
- 05.03 Long-term Memory
```

创建：

```bash
mkdir -p exercises/05-memory-skill-building/05.01-introduction-to-memory/explainer
mkdir -p exercises/05-memory-skill-building/05.02-short-term-memory/{explainer,problem,solution}
mkdir -p exercises/05-memory-skill-building/05.03-long-term-memory/explainer
```

然后创建 readme 模板：

```
exercises/05-memory-skill-building/05.01-introduction-to-memory/explainer/readme.md -> "# Introduction to Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/explainer/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/problem/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/solution/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.03-long-term-memory/explainer/readme.md -> "# Long-term Memory"
```
