#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"

cd "$REPO"
# 递归查找所有 SKILL.md 文件，排除 node_modules
find . -name SKILL.md -not -path '*/node_modules/*' | sed 's|^\./||' | sort
