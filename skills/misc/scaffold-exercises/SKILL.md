---
name: scaffold-exercises
description: 创建包含章节、问题、解答和说明的练习目录结构，并通过 lint 检查。当用户想要搭建练习框架、创建练习占位或设置新课程章节时使用。
---

# 搭建练习框架

创建能通过 `pnpm ai-hero-cli internal lint` 的练习目录结构，然后用 `git commit` 提交。

## 目录命名

- **章节（Sections）**：`exercises/` 下的 `XX-section-name/`（如 `01-retrieval-skill-building`）
- **练习（Exercises）**：章节下的 `XX.YY-exercise-name/`（如 `01.03-retrieval-with-bm25`）
- 章节编号 = `XX`，练习编号 = `XX.YY`
- 名称使用 dash-case（小写，连字符）

## 练习类型

每个练习需要至少一个以下子目录：

- `problem/` - 学生工作区，包含 TODO
- `solution/` - 参考实现
- `explainer/` - 概念性材料，不含 TODO

占位时默认使用 `explainer/`，除非计划指定了其他类型。

## 必需文件

每个子目录（`problem/`、`solution/`、`explainer/`）需要一个 `readme.md`，满足：

- **不为空**（必须有实际内容，即使只有一行标题也行）
- 没有无效链接

占位时创建最小化的 readme，包含标题和描述：

```md
# 练习标题

这里写描述
```

如果子目录有代码，还需要一个 `main.ts`（>1 行）。但对于占位而言，只含 readme 的练习也可以。

## 工作流

1. **解析计划** - 提取章节名称、练习名称和类型
2. **创建目录** - 为每个路径执行 `mkdir -p`
3. **创建占位 readme** - 每个类型目录下各一个含标题的 `readme.md`
4. **运行 lint** - `pnpm ai-hero-cli internal lint` 验证
5. **修复错误** - 迭代直到 lint 通过

## Lint 规则摘要

Linter（`pnpm ai-hero-cli internal lint`）检查：

- 每个练习有子目录（`problem/`、`solution/`、`explainer/`）
- `problem/`、`explainer/` 或 `explainer.1/` 中至少存在一个
- 主子目录中存在非空的 `readme.md`
- 没有 `.gitkeep` 文件
- 没有 `speaker-notes.md` 文件
- readme 中没有无效链接
- readme 中没有 `pnpm run exercise` 命令
- 除纯 readme 练习外，每个子目录需要 `main.ts`

## 移动/重命名练习

重新编号或移动练习时：

1. 使用 `git mv`（而不是 `mv`）重命名目录——保留 git 历史
2. 更新数字前缀以维持顺序
3. 移动后重新运行 lint

示例：

```bash
git mv exercises/01-retrieval/01.03-embeddings exercises/01-retrieval/01.04-embeddings
```

## 示例：根据计划创建占位

给定计划如下：

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

然后创建 readme 占位：

```
exercises/05-memory-skill-building/05.01-introduction-to-memory/explainer/readme.md -> "# Introduction to Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/explainer/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/problem/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.02-short-term-memory/solution/readme.md -> "# Short-term Memory"
exercises/05-memory-skill-building/05.03-long-term-memory/explainer/readme.md -> "# Long-term Memory"
```
