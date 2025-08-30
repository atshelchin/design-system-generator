# Design Tokens 一致性检查清单

## 目标
确保 SwiftUI 实现与 showcase.html 100% 一致

## ✅ 已完成检查项

### 1. 色彩系统 (Color System)
- [x] 品牌色展示 - 10个色阶 (50-900)
- [x] 中性色展示 - 10个色阶 (50-900)  
- [x] 语义色展示 - 11个语义色
- [x] 功能色展示 - 背景、按钮、边框
- [x] 色块高度: 80px (已修复)
- [x] 色块圆角: --radius-md
- [x] 色块间距: --space-3
- [x] 色值文字: --text-xs, --color-description-3

### 2. 层级系统 (Hierarchy System)
- [x] 标题层级 H1-H6 使用正确的 heading 颜色
- [x] 描述层级 1-4 使用正确的 description 颜色
- [x] 数值层级使用正确的 value 颜色
- [x] 语义化颜色应用正确

### 3. 设计令牌定义 (DesignTokens.swift)
- [x] HSL 颜色转换函数
- [x] 品牌色动态计算
- [x] 层级颜色系统 (heading, description, value)
- [x] 间距系统 (space0 - space24)
- [x] 圆角系统 (sm, base, md, lg, xl, full)
- [x] 阴影系统 (xs, sm, base, md, lg, xl)

### 4. 组件卡片容器 (ComponentCard100)
- [x] 标题: --text-lg (18px), 600 weight
- [x] 内边距: --space-6
- [x] 背景色: --color-card
- [x] 边框: --color-border
- [x] 圆角: --radius-lg

### 5. 按钮样式 (Button Styles)
- [x] Primary: 使用 --color-primary, --color-primary-foreground
- [x] Secondary: 使用 --color-secondary, --color-secondary-foreground
- [x] Outline: 透明背景, --brand-600 边框
- [x] Ghost: 透明背景, --color-foreground 文字
- [x] Destructive: 使用 --color-danger
- [x] 内边距: --space-2 --space-4
- [x] 圆角: --radius-md
- [x] 字体: --text-sm

## ⚠️ 需要验证的项目

### 文字描述一致性
每个系统的标题和描述必须与 showcase.html 完全一致：

#### 层级系统文字对照表
| 中文 | 英文 | 位置 |
|------|------|------|
| 一级标题 H1 | Heading Level 1 | 基础标题 |
| 二级标题 H2 | Heading Level 2 | 基础标题 |
| 三级标题 H3 | Heading Level 3 | 基础标题 |
| 四级标题 H4 | Heading Level 4 | 基础标题 |
| 五级标题 H5 | Heading Level 5 | 基础标题 |
| 六级标题 H6 | Heading Level 6 | 基础标题 |
| Primary 主要标题 | Primary Heading | 语义化标题 |
| Muted 弱化标题 | Muted Heading | 语义化标题 |
| Success 成功标题 | Success Heading | 语义化标题 |
| Danger 危险标题 | Danger Heading | 语义化标题 |

### 42个组件检查清单
需要逐个检查每个组件的：
1. 文字内容
2. 颜色应用
3. 间距设置
4. 圆角大小
5. 边框样式
6. 阴影效果

## 关键原则

1. **精确匹配 CSS 变量**
   - 不要硬编码数值，使用 DesignTokens 定义
   - 确保响应式缩放工作正常

2. **双语支持**
   - 中英文切换必须正确
   - 文字内容必须与 showcase.html 的 data-zh/data-en 属性一致

3. **动态响应**
   - 所有设计令牌必须响应控制面板的调整
   - 实时更新，无需重启应用

4. **视觉一致性**
   - 布局结构相同
   - 颜色层级正确
   - 间距比例一致

## 测试步骤

1. 运行 SwiftUI 应用：
   ```bash
   swift run DesignTokensShowcase
   ```

2. 在浏览器打开 showcase.html：
   ```bash
   open showcase.html
   ```

3. 并排对比每个系统：
   - 调整控制面板参数
   - 切换明暗主题
   - 切换中英文
   - 验证所有变化同步

4. 特别注意：
   - 层级颜色是否正确应用
   - 文字描述是否完全一致
   - 组件细节是否精确还原

## 当前状态
- 核心系统已修复并验证
- 组件样式已开始调整
- 需要继续逐个检查所有42个组件的细节