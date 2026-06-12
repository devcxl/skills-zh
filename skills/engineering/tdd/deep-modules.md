# 深层模块 vs 浅层模块

引自 John Ousterhout《A Philosophy of Software Design》。

## 深层模块

深层模块用一个简单的接口封装了大量复杂的功能。

```
接口：简单（少量方法，直观的行为）
实现：复杂（处理所有边界情况、并发、性能）
```

```ts
// 深层模块示例：用简单的接口隐藏复杂实现
interface SessionStore {
  get(id: string): Session | null;
  set(session: Session): void;
  delete(id: string): void;
}

// 实现内部处理了：
// - 驱逐策略（LRU）
// - 基于磁盘的持久化
// - 并发访问安全
// 但这些复杂度对调用方完全不可见
```

## 浅层模块

浅层模块是"接口复杂、实现简单"的模块。本质上是把本应封装在内部的逻辑泄露给了调用方。

```ts
// 浅层模块示例：把所有复杂度都摊到调用方头上
interface SessionStore {
  loadFromDisk(): Promise<void>;
  evictLRU(): void;
  acquireLock(): Promise<void>;
  releaseLock(): void;
  get(key: Buffer): Session | null;
  set(key: Buffer, session: Session): void;
}

// 调用方必须自己搞定：
// - 先加载再到磁盘
// - 手动管理 LRU 驱逐
// - 手动获取和释放锁
// 所有这些本该是模块内部的职责
```

## 在 TDD 中要注意什么

在对代码做变更时：

- 检查你添加的接口是深层的还是浅层的
- 如果调用方需要执行多个步骤才能完成一件本应是单一的操作，那这就是浅层信号
- 如果调用方需要了解一些它们本不该关心的细节（如锁、缓存驱逐策略等），那这就是浅层信号
- 在这个阶段修复浅层模块是可以的，但不是必须——先把信号记录下来，在重构阶段再做处理
