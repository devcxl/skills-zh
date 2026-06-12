# Matt Pocock 技能集

一组由 Claude Code 加载的智能体技能（斜杠命令和行为）。技能按分类组织，由 `/setup-matt-pocock-skills` 生成的各仓库配置来消费。

## 语言规范

**Issue 跟踪器**：
托管仓库 issues 的工具——GitHub Issues、Linear、本地 `.scratch/` markdown 约定或类似方式。`to-issues`、`to-prd`、`triage`、`qa` 等技能会对其进行读写。
_避免使用_：backlog 管理器、backlog 后端、issue 宿主

**Issue**：
**Issue 跟踪器**中单个被跟踪的工作单元——一个 bug、任务、PRD 或 `to-issues` 生成的切片。
_避免使用_：ticket（仅在引用外部系统中称之为 ticket 时使用）

**分类角色（Triage role）**：
在分类过程中应用于某个 **Issue** 的规范状态机标签（如 `needs-triage`、`ready-for-afk`）。每个角色通过 `docs/agents/triage-labels.md` 映射到 **Issue 跟踪器** 中的实际标签字符串。

## 关系

- 一个 **Issue 跟踪器** 包含多个 **Issue**
- 一个 **Issue** 每次携带一个 **分类角色**

## 已解决的歧义

- "backlog" 之前既用于指代*托管 issues 的工具*又指代*其中的工作内容*——已解决：工具是 **Issue 跟踪器**；"backlog" 不再作为领域术语使用。
- "backlog backend" / "backlog manager"——已解决：统一为 **Issue 跟踪器**。
