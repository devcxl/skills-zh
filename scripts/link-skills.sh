#!/usr/bin/env bash
set -euo pipefail

# 将仓库中的所有技能链接到 ~/.claude/skills，
# 以便本地 Claude CLI 可以使用它们。

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HOME/.claude/skills"

# 如果 ~/.claude/skills 是一个指向本仓库的符号链接，
# 我们会把每个技能的符号链接写回仓库自身的 skills/ 目录。
# 检测到这种情况则直接退出，避免污染工作副本。
if [ -L "$DEST" ]; then
  resolved="$(readlink -f "$DEST")"
  case "$resolved" in
    "$REPO"|"$REPO"/*)
      echo "错误: $DEST 是指向本仓库的符号链接 ($resolved)。" >&2
      echo "请先将其删除 (rm \"$DEST\") 再重新运行；脚本将重新创建它为一个真实目录。" >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$DEST"

# 查找所有技能目录（排除 node_modules 和 deprecated），
# 并逐个创建符号链接
find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/deprecated/*' -print0 |
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  target="$DEST/$name"

  # 如果目标已存在且不是符号链接，先删除
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -sfn "$src" "$target"
  echo "已链接 $name -> $src"
done
