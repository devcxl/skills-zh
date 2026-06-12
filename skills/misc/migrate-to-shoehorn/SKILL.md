---
name: migrate-to-shoehorn
description: 将测试文件中的 `as` 类型断言迁移到 @total-typescript/shoehorn。当用户提到 shoehorn、想在测试中替换 `as` 或需要部分测试数据时使用。
---

# 迁移到 Shoehorn

## 为什么用 shoehorn？

`shoehorn` 让你在测试中传入部分数据的同时保持 TypeScript 类型安全。它用类型安全的替代方案替换 `as` 断言。

**仅用于测试代码。** 绝不在生产代码中使用 shoehorn。

测试中使用 `as` 的问题：

- 被训练不要使用它
- 必须手动指定目标类型
- 传入故意错误的数据需要双重 `as`（`as unknown as Type`）

## 安装

```bash
npm i @total-typescript/shoehorn
```

## 迁移模式

### 大型对象只需要少数属性

之前：

```ts
type Request = {
  body: { id: string };
  headers: Record<string, string>;
  cookies: Record<string, string>;
  // ...还有 20 个属性
};

it("通过 id 获取用户", () => {
  // 只关心 body.id 但必须伪造整个 Request
  getUser({
    body: { id: "123" },
    headers: {},
    cookies: {},
    // ...伪造全部 20 个属性
  });
});
```

之后：

```ts
import { fromPartial } from "@total-typescript/shoehorn";

it("通过 id 获取用户", () => {
  getUser(
    fromPartial({
      body: { id: "123" },
    }),
  );
});
```

### `as Type` → `fromPartial()`

之前：

```ts
getUser({ body: { id: "123" } } as Request);
```

之后：

```ts
import { fromPartial } from "@total-typescript/shoehorn";

getUser(fromPartial({ body: { id: "123" } }));
```

### `as unknown as Type` → `fromAny()`

之前：

```ts
getUser({ body: { id: 123 } } as unknown as Request); // 故意传错类型
```

之后：

```ts
import { fromAny } from "@total-typescript/shoehorn";

getUser(fromAny({ body: { id: 123 } }));
```

## 何时用哪个

| 函数            | 使用场景                                   |
| --------------- | ------------------------------------------ |
| `fromPartial()` | 传入部分数据但仍需通过类型检查               |
| `fromAny()`     | 传入故意错误的数据（保留自动补全）           |
| `fromExact()`   | 强制传入完整对象（后续可替换为 fromPartial） |

## 工作流

1. **收集需求** - 询问用户：
   - 哪些测试文件中的 `as` 断言导致了问题？
   - 是否在处理大型对象，其中只有部分属性重要？
   - 是否需要传入故意错误的数据来做错误测试？

2. **安装并迁移**：
   - [ ] 安装：`npm i @total-typescript/shoehorn`
   - [ ] 查找带 `as` 断言的测试文件：`grep -r " as [A-Z]" --include="*.test.ts" --include="*.spec.ts"`
   - [ ] 将 `as Type` 替换为 `fromPartial()`
   - [ ] 将 `as unknown as Type` 替换为 `fromAny()`
   - [ ] 添加 `@total-typescript/shoehorn` 的导入
   - [ ] 运行类型检查验证
