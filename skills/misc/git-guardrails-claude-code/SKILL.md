---
name: git-guardrails-claude-code
description: 设置 Claude Code hooks 在执行危险 git 命令（push、reset --hard、clean、branch -D 等）之前将其拦截。当用户想要防止破坏性 git 操作、添加 git 安全 hook、或在 Claude Code 中阻止 git push/reset 时使用。
---

# 设置 Git 护栏

设置一个 PreToolUse hook，在 Claude 执行危险 git 命令之前拦截并阻止它们。

## 被阻止的命令

- `git push`（包括 `--force` 在内的所有变体）
- `git reset --hard`
- `git clean -f` / `git clean -fd`
- `git branch -D`
- `git checkout .` / `git restore .`

被阻止时，Claude 会看到一条消息，告知它无权访问这些命令。

## 步骤

### 1. 询问作用域

询问用户：是**仅此项目**安装（`.claude/settings.json`）还是**所有项目**安装（`~/.claude/settings.json`）？

### 2. 复制 hook 脚本

打包的脚本位于：[scripts/block-dangerous-git.sh](scripts/block-dangerous-git.sh)

根据作用域复制到目标位置：

- **项目级**：`.claude/hooks/block-dangerous-git.sh`
- **全局级**：`~/.claude/hooks/block-dangerous-git.sh`

用 `chmod +x` 赋予执行权限。

### 3. 将 hook 添加到设置

添加到对应的 settings 文件：

**项目级**（`.claude/settings.json`）：

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/block-dangerous-git.sh"
          }
        ]
      }
    ]
  }
}
```

**全局级**（`~/.claude/settings.json`）：

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/block-dangerous-git.sh"
          }
        ]
      }
    ]
  }
}
```

如果 settings 文件已经存在，将 hook 合并到现有的 `hooks.PreToolUse` 数组中——不要覆盖其他设置。

### 4. 询问自定义

询问用户是否要在阻止列表中添加或移除任何模式。相应编辑复制的脚本。

### 5. 验证

运行快速测试：

```bash
echo '{"tool_input":{"command":"git push origin main"}}' | <path-to-script>
```

应该以退出码 2 退出，并在 stderr 输出 BLOCKED 消息。
