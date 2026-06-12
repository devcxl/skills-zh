# 接口设计

来自 [TDD 技能](./SKILL.md)（阶段：红灯前的范围界定，以及在重构期间检查倒退）。

好的接口设计能在编写测试之前及早暴露不合理的部分。

## 接口设计清单

在设计一个新模块时，可以在心里过一遍这份清单。在红灯阶段编写测试时，这些原则就能帮到你。

### 1. 只暴露最少的表面积

你能移除什么，同时仍然满足需求？每一个多出来的方法都是一项未来的维护负担。

```ts
// 有 5 个方法——真的都需要吗？
interface TaskManager {
  create(t: Task): void;
  get(id: string): Task;
  update(t: Task): void;
  delete(id: string): void;
  list(filter: Filter): Task[];
}
```

### 2. 调用方不用关心内部对象的创建

如果需要先创建一堆内部对象才能调用接口，说明你的接口可能太浅了。

```ts
// 坏：强迫调用方理解内部生命周期
const buffer = new Buffer(1024);
const serializer = new TaskSerializer(encoding);
const store = new TaskStore(buffer, serializer);
const manager = new TaskManager(store);
manager.create(task);

// 好：从调用方视角看，创建过程是自然的
const manager = new TaskManager({ encoding: "utf-8" });
manager.create(task);
```

### 3. 边界情况应被封装，而非泄露

如果一个方法在某项输入为 `0` 时会抛异常，接口文档里没有说明，对调用方来说就成了一个隐形的陷阱。要么对它做防御并给出有意义的处理方式，要么明确地将其定义下来。

### 4. 用一句话描述你的接口

如果你没法用一句话说清楚每个方法做什么——不带"并且"——那这个接口可能承担了太多职责。

### 5. 测试是你的第一个调用方

编写测试时，你是否不得不做很多内部设置？那意味着你的接口不够干净，是时候修改接口本身——而不是测试——来降低耦合。
