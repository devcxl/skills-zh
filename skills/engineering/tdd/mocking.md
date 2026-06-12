# Mock

mock 是测试中的一根拐杖。只有在真实实现会带来副作用，且该副作用会破坏测试时，才使用 mock。对于纯逻辑，永远通过真实接口测试。

## 何时 mock

```ts
// 值得 mock：有副作用的操作会破坏测试
// - 网络调用
// - 文件系统写操作
// - 数据库变更
// - 外部 API 调用
// - 定时器 / 时钟
```

## 何时不 mock

```ts
// 不应 mock：纯数据变换
// - 验证逻辑
// - 数据映射 / 转换
// - 排序算法
// - 状态机
// - 大部分工具函数
```

## 替代方案

在你 mock 之前，先考虑：

- **直接使用真实实现**。它是否实际就是一个纯函数？
- **参数化输入**。与其 mock `process.env.CONFIG_PATH`，不如把 config path 作为参数传入。
- **使用测试替身（fakes）**。给出一个真实实现，但使用测试专用后端（如内存数据库替代 PostgreSQL）。
- **按现有方式测试**。这个副作用是否真的破坏测试，还是只是比较慢？

## Mock 指南

当你确实需要 mock 时：

```ts
// 好：mock 在测试中的使用最少，且符合逻辑
test("retryOnFailure retries 3 times then throws", async () => {
  let attempts = 0;
  const fallible = async () => {
    attempts++;
    throw new Error("fail");
  };
  
  await expect(retryOnFailure(fallible, 3)).rejects.toThrow();
  expect(attempts).toBe(3);
});

// 坏：mock 了内部模块并以特定顺序断言内部调用
test("processOrder calls validate then save", async () => {
  const mockValidate = jest.spyOn(validator, "validate");
  const mockSave = jest.spyOn(db, "save");
  
  await processOrder(order);
  
  expect(mockValidate).toHaveBeenCalledBefore(mockSave);
});
```

第二个例子的问题是：它对实现细节做了过度约束——它断言了 `processOrder` 的**运作方式**而非**行为结果**。如果开发者重构了顺序或合并了调用，测试就会失败——即使最终结果仍然是正确的。
