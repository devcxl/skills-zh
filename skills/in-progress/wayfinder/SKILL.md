---
name: wayfinder
description: 在充满迷雾的问题中规划路线——将松散的想法转化为一系列调研 Ticket，然后逐个驱动它们直至解决。当用户给出一个模糊的想法、PRD 或目标并询问如何让它变得可操作时使用。
disable-model-invocation: true
---

当你的思路清晰但不确定如何将想法转化为行动时，可以调用此技能。它在一个 Markdown 文件中创建一个有状态的路径图（path map），并引导用户依次处理一系列 Ticket，以解决悬而未决的问题——这些问题可能涉及原型开发、调研、盘问或手工作业。路径图与领域无关：它可用于规划工程工作、课程内容或任何其他适用同样结构的事项。

路径图的前端之外**有意地**不完整。你的任务是探索前沿，深入迷雾，解决节点以推动边界前进——一次推进一个节点，直到终点路径清晰且没有剩余 Ticket。

## 路径图（Path Map）

路径图是一个紧凑的 Markdown 文件，每个规划工作对应一个文件，与项目一起进行 git 追踪。它是规范性制品——**每个会话都会将整个路径图加载为上下文**，因此必须保持紧凑。

Ticket 期间创建的资产应从路径图中链接引用，而非复制到其中。

### 结构

条目（"Ticket"），每个条目以其简短的 dash-case 标识符（slug）为键，该标识符读起来像一个微型标题（例如 `relational-db`、`auth-strategy`、`cache-layer`）——足够简洁以节约 token，在路径图内唯一。

```markdown
## relational-db: 关系型还是非关系型数据库？

Blocked by: <slug>, <slug>
Status: open | in-progress | resolved
Type: Research | Prototype | Grilling | Task

### Question

<question-here>

### Answer

<answer-here>
```

slug 是规范 ID，用于每条 `Blocked by` 边和文内引用；冒号后的标题是可选的。当某个 Ticket 的 `Blocked by` 列表中所有 Ticket 均为 `resolved` 状态时，该 Ticket **解除阻塞（unblocked）**。会话在开始工作前，应先**认领（claim）**其 Ticket：将 `Status` 设为 `in-progress` 并保存路径图，以便并发会话跳过它。

每个 Ticket 的大小必须适配一个 100K token 的 Agent 会话。

## Ticket 类型

共有四种类型的 Ticket：

- **Research（调研）**：阅读文档、第三方 API 或本地资源（如知识库）。创建一个 Markdown 摘要作为资产。当需要当前工作目录之外的知识时使用此类型。
- **Prototype（原型）**：通过制作廉价、粗略、具体的可接触制成品来提升讨论的保真度——一个提纲、一个粗糙的初稿、一个桩代码（stub），或通过 /prototype 技能生成 UI/逻辑代码。创建一个原型作为资产。当核心问题是"应该长什么样"或"应该怎么表现"时使用此类型。
- **Grilling（盘问）**：与 Agent 进行对话。使用 /grilling 和 /domain-modeling 技能。一次只问一个问题。这是默认类型。
- **Task（任务）**：在讨论继续之前需要完成的纯手工作业——比如"拆完那些线缆之后我们才能讨论替代数据库方案"。没有调研、原型或决策要做；只是把事情做完。

验证（Validation）不是第五种类型——它是贯穿所有四种类型的红线。

## 调用方式

两个分支。无论哪种方式，**每个会话都以[交接（Handoff）](#交接handoff)结束**——每个会话最多解决一个 Ticket。

### 创建路径图

用户用一个松散的想法发起调用。

1. 运行一个 `/grilling` + `/domain-modeling` 会话，以揭示未解决的决策。一次只问一个问题。
2. 编写一个新的路径图——大部分是迷雾，前沿已被识别，可简单决定的条目已内联解决。
3. 交接（Handoff）。构建路径图是一个会话的工作量；不要同时解决 Ticket。

### 推进路径图

用户传入现有路径图的路径来发起调用。Ticket slug **可选**——不传时，由你选择下一个决策，而非用户。

1. 将**整个路径图**加载为上下文。
2. 选择 Ticket。如果用户指定了 slug，使用它。否则选择文档顺序中第一个 `open` 且已[解除阻塞](#结构)的 Ticket。[认领它](#结构)：将 `Status` 设为 `in-progress` 并在任何工作开始前保存。
3. 解决它，根据需要调用其他技能——包括 `## Notes` 块中列出的任何技能。如有疑问，使用 `/grilling` 和 `/domain-modeling`。
4. 在 Ticket 正文中记录答案，将 `Status` 设为 `resolved`。
5. 添加新发现的 Ticket（附带正确的 `Blocked by` 边）。如果所做的决策使路径图的其他部分失效，更新或删除那些节点。
6. 交接（Handoff）。

用户可能会并行运行已解除阻塞的 Ticket，因此需预期其他 Agent 会在各自的会话中编辑路径图。

## 交接（Handoff）

每个会话结束时，清理上下文并打开一个或多个新会话。以一个 **Next steps** 块结尾，供用户复制粘贴。分两种情况：

**仍有未关闭的 Ticket。** 列出当前已解除阻塞的 Ticket，然后提供两个复制粘贴选项：一个裸命令用于单会话（你负责选下一个 Ticket），以及每个已解除阻塞的 Ticket 对应的固定命令，用于并行运行。每行粘贴到一个新的窗口——可以只开一个、开部分，或全部打开。

> **Next steps** — 3张 Ticket 已解除阻塞: `auth-strategy`, `cache-layer`, `rate-limits`.
> 清理上下文，然后打开新的会话。
>
> **单会话** — 解决下一个已解除阻塞的 Ticket：
> ```
> 调用 /wayfinder，路径图位于 <path>。
> ```
>
> **并行** — 每行一个窗口，最多 3 个：
> ```
> 调用 /wayfinder，路径图位于 <path>，ticket auth-strategy。
> 调用 /wayfinder，路径图位于 <path>，ticket cache-layer。
> 调用 /wayfinder，路径图位于 <path>，ticket rate-limits。
> ```

**没有未关闭的 Ticket 了。** 迷雾已被推回到足够远的位置，终点路径已然清晰——路径图已完成。（初始的盘问环节也可能没有产生任何迷雾，这种情况下从一开始就没有路径图需要构建。）建议直接实现，或使用 `/to-prd` 来安排多会话的实现。

## Notes

一个可选块，用于声明**领域**、每个会话应`consult`的技能，以及规划过程中浮现的自由格式固定偏好。
