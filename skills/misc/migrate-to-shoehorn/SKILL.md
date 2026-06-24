---
name: migrate-to-shoehorn
description: 将测试文件从 `as` 类型断言迁移到 @total-typescript/shoehorn。当用户提到 shoehorn、想要在测试中替换 `as`、或需要部分测试数据时使用。
---

# 迁移到 Shoehorn

## 为什么使用 shoehorn？

`shoehorn` 让你在测试中传递部分数据，同时保持 TypeScript 类型正确。它用类型安全的替代方案取代了 `as` 断言。

**仅限测试代码。** 切勿在生产代码中使用 shoehorn。

`as` 在测试中的问题：

- 习惯上被训练不要使用它
- 必须手动指定目标类型
- 双重 `as`（`as unknown as Type`）用于传递故意错误的数据

## 安装

```bash
npm i @total-typescript/shoehorn
```

## 迁移模式

### 大型对象，只用到少数属性

迁移前：

```ts
type Request = {
  body: { id: string };
  headers: Record<string, string>;
  cookies: Record<string, string>;
  // ...还有 20 个属性
};

it("gets user by id", () => {
  // 只关心 body.id，但必须伪造整个 Request
  getUser({
    body: { id: "123" },
    headers: {},
    cookies: {},
    // ...伪造所有 20 个属性
  });
});
```

迁移后：

```ts
import { fromPartial } from "@total-typescript/shoehorn";

it("gets user by id", () => {
  getUser(
    fromPartial({
      body: { id: "123" },
    }),
  );
});
```

### `as Type` → `fromPartial()`

迁移前：

```ts
getUser({ body: { id: "123" } } as Request);
```

迁移后：

```ts
import { fromPartial } from "@total-typescript/shoehorn";

getUser(fromPartial({ body: { id: "123" } }));
```

### `as unknown as Type` → `fromAny()`

迁移前：

```ts
getUser({ body: { id: 123 } } as unknown as Request); // 故意传错类型
```

迁移后：

```ts
import { fromAny } from "@total-typescript/shoehorn";

getUser(fromAny({ body: { id: 123 } }));
```

## 各函数的适用场景

| 函数            | 使用场景                                |
| --------------- | --------------------------------------- |
| `fromPartial()` | 传递部分数据，仍能通过类型检查          |
| `fromAny()`     | 传递故意错误的数据（保留自动补全）      |
| `fromExact()`   | 强制传入完整对象（后续可替换为 fromPartial） |

## 工作流程

1. **收集需求** — 询问用户：
   - 哪些测试文件中的 `as` 断言造成了问题？
   - 是否涉及大型对象，只有部分属性是重要的？
   - 是否需要传递故意错误的数据用于错误测试？

2. **安装并迁移**：
   - [ ] 安装：`npm i @total-typescript/shoehorn`
   - [ ] 查找含有 `as` 断言的测试文件：`grep -r " as [A-Z]" --include="*.test.ts" --include="*.spec.ts"`
   - [ ] 将 `as Type` 替换为 `fromPartial()`
   - [ ] 将 `as unknown as Type` 替换为 `fromAny()`
   - [ ] 从 `@total-typescript/shoehorn` 添加 import
   - [ ] 运行类型检查以验证
