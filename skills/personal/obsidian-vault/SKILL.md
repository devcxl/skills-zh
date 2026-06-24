---
name: obsidian-vault
description: 在 Obsidian 知识库中搜索、创建和管理笔记，支持 wikilinks 和索引笔记。当用户想要在 Obsidian 中查找、创建或组织笔记时使用。
---

# Obsidian 知识库

## 知识库位置

`/mnt/d/Obsidian Vault/AI Research/`

大部分笔记平铺在根层级。

## 命名规范

- **索引笔记（Index notes）**：汇总相关主题（例如 `Ralph Wiggum Index.md`、`Skills Index.md`、`RAG Index.md`）
- 所有笔记名称使用**标题大小写（Title Case）**
- 不使用文件夹来组织——而是使用链接和索引笔记

## 链接

- 使用 Obsidian 的 `[[wikilinks]]` 语法：`[[Note Title]]`
- 笔记在底部链接到依赖项/相关笔记
- 索引笔记就是 `[[wikilinks]]` 的列表

## 工作流程

### 搜索笔记

```bash
# 按文件名搜索
find "/mnt/d/Obsidian Vault/AI Research/" -name "*.md" | grep -i "keyword"

# 按内容搜索
grep -rl "keyword" "/mnt/d/Obsidian Vault/AI Research/" --include="*.md"
```

或者直接对知识库路径使用 Grep/Glob 工具。

### 创建新笔记

1. 文件名使用**标题大小写（Title Case）**
2. 按照知识库规则，以"学习单元"的形式编写内容
3. 在底部添加指向相关笔记的 `[[wikilinks]]`
4. 如果是编号序列的一部分，使用层级编号方案

### 查找相关笔记

在整个知识库中搜索 `[[Note Title]]` 以查找反向链接：

```bash
grep -rl "\\[\\[Note Title\\]\\]" "/mnt/d/Obsidian Vault/AI Research/"
```

### 查找索引笔记

```bash
find "/mnt/d/Obsidian Vault/AI Research/" -name "*Index*"
```
