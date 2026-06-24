# 何时使用 Mock

仅在**系统边界**处使用 Mock：

- 外部 API（支付、邮件等）
- 数据库（有时——优先使用测试数据库）
- 时间/随机数
- 文件系统（有时）

不要 Mock：

- 你自己的 class/module
- 内部协作组件
- 任何你控制范围内的东西

## 为可 Mock 性而设计

在系统边界处，设计易于 mock 的 interface：

**1. 使用依赖注入（Dependency Injection）**

将外部依赖作为参数传入，而非在内部创建：

```typescript
// 易于 mock
function processPayment(order, paymentClient) {
  return paymentClient.charge(order.total);
}

// 难以 mock
function processPayment(order) {
  const client = new StripeClient(process.env.STRIPE_KEY);
  return client.charge(order.total);
}
```

**2. 优先使用 SDK 风格的 interface，而非通用 fetcher**

为每个外部操作创建特定函数，而不是一个带有条件逻辑的通用函数：

```typescript
// GOOD：每个函数可独立 mock
const api = {
  getUser: (id) => fetch(`/users/${id}`),
  getOrders: (userId) => fetch(`/users/${userId}/orders`),
  createOrder: (data) => fetch('/orders', { method: 'POST', body: data }),
};

// BAD：Mock 需要在内部编写条件逻辑
const api = {
  fetch: (endpoint, options) => fetch(endpoint, options),
};
```

SDK 方式意味着：
- 每个 mock 返回一个特定的数据形状
- 测试设置中无需条件逻辑
- 更容易看出测试覆盖了哪些 endpoint
- 每个 endpoint 都有类型安全（Type Safety）
