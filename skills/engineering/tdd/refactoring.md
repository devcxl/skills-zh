# 重构候选（Refactor Candidates）

在 TDD 周期之后，寻找以下模式：

- **重复代码（Duplication）** → 提取为 function/class
- **过长方法（Long methods）** → 拆分为私有 helper（测试仍保留在 public interface 上）
- **过浅的 module（Shallow modules）** → 合并或加深
- **依恋情结（Feature envy）** → 将逻辑移到数据所在之处
- **基本类型偏执（Primitive obsession）** → 引入值对象（Value Object）
- **现有代码**被新代码暴露出的问题
