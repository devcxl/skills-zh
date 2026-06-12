---
name: obsidian-vault
description: 在 Obsidian 知识库中搜索、创建和管理笔记，支持 wikilinks 和索引笔记。当用户想在 Obsidian 中查找、创建或整理笔记时使用。
---

# Obsidian 知识库

## 知识库位置

`/mnt/d/Obsidian Vault/AI Research/`

根目录下基本是扁平结构。

## 命名规范

- **索引笔记**：聚合相关主题（如 `Ralph Wiggum Index.md`、`Skills Index.md`、`RAG Index.md`）
- 所有笔记名称使用**标题大写**
- 不使用文件夹来组织——改用链接和索引笔记

## 链接

- 使用 Obsidian 的 `[[wikilinks]]` 语法：`[[笔记标题]]`
- 笔记底部链接到依赖/相关笔记
- 索引笔记本质上就是 `[[wikilinks]]` 列表

## 工作流

### 搜索笔记

```bash
# 按文件名搜索
find "/mnt/d/Obsidian Vault/AI Research/" -name "*.md" | grep -i "关键词"

# 按内容搜索
grep -rl "关键词" "/mnt/d/Obsidian Vault/AI Research/" --include="*.md"
```

或者直接对知识库路径使用 Grep/Glob 工具。

### 创建新笔记

1. 文件名使用**标题大写**
2. 按知识库规定将内容写为一个学习单元
3. 在底部添加指向相关笔记的 `[[wikilinks]]`
4. 如果属于编号序列的一部分，沿用分层编号规则

### 查找相关笔记

在整个知识库中搜索 `[[笔记标题]]` 可找到反向链接：

```bash
grep -rl "\\[\\[笔记标题\\]\\]" "/mnt/d/Obsidian Vault/AI Research/"
```

### 查找索引笔记

```bash
find "/mnt/d/Obsidian Vault/AI Research/" -name "*Index*"
```
