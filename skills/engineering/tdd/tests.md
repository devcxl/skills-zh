# 好的测试与坏的测试

## 好的测试

**集成风格**：通过真实接口测试，而不是 mock 内部组件。

```typescript
// 好：测试的是可观察行为
test("user can checkout with valid cart", async () => {
  const cart = createCart();
  cart.add(product);
  const result = await checkout(cart, paymentMethod);
  expect(result.status).toBe("confirmed");
});
```

特征：

- 测试用户/调用方关心的行为
- 仅使用公共 API
- 经得起内部重构
- 描述"是什么"，而非"怎么做"
- 每个测试只验证一个逻辑断言

## 坏的测试

**实现细节测试**：与内部结构紧耦合。

```typescript
// 坏：测试的是实现细节
test("checkout calls paymentService.process", async () => {
  const mockPayment = jest.mock(paymentService);
  await checkout(cart, payment);
  expect(mockPayment.process).toHaveBeenCalledWith(cart.total);
});
```

危险信号：

- Mock 了内部协作者
- 测试了私有方法
- 断言调用次数/调用顺序
- 不改行为只做重构时测试就挂了
- 测试名称描述的是"怎么做"而非"是什么"
- 绕过接口，用外部手段来验证

```typescript
// 坏：绕过接口来验证
test("createUser saves to database", async () => {
  await createUser({ name: "Alice" });
  const row = await db.query("SELECT * FROM users WHERE name = ?", ["Alice"]);
  expect(row).toBeDefined();
});

// 好：通过接口来验证
test("createUser makes user retrievable", async () => {
  const user = await createUser({ name: "Alice" });
  const retrieved = await getUser(user.id);
  expect(retrieved.name).toBe("Alice");
});
```
