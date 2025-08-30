# 设计令牌系统

> 一个全面的、兼容 SwiftUI 的 CSS 设计系统，内置深色模式、无障碍功能和双语支持

🎨 **[在线演示](https://atshelchin.github.io/design-tokens/showcase.html)** | 📚 **[文档指南](DESIGN_SYSTEM_GUIDE.md)** | 🚀 **[快速参考](QUICK_REFERENCE.md)**

## 概述

这是一个生产级的设计令牌系统，为 Web 和 SwiftUI 应用程序提供完整的视觉基础。该系统强调一致性、可访问性和跨平台兼容性，采用"60分及格"的视觉理念——专注于解决问题而非完美的美学。

## 功能特性

### 核心系统
- 🎨 **动态色彩系统** - 品牌色和中性色的10级色阶，带语义映射
- 🌗 **深色模式支持** - 完整的深色主题，优化的文本亮度控制
- 📐 **数学间距系统** - 20+个间距令牌，可配置缩放因子
- 🔤 **字体排版系统** - 10个字号、9个字重，使用系统字体栈
- 🎭 **阴影系统** - 从 xs 到 2xl 的8个阴影级别
- 🔘 **圆角系统** - 9个圆角值，支持缩放因子

### 层级与组织
- 📊 **6级视觉层级** - 用于标题、描述、数值和面板
- 🏗️ **面板系统** - 6个面板级别，带特殊变体（elevated、sunken、accent、muted）
- 🎯 **语义化颜色** - 用于UI状态和操作的目的驱动颜色令牌
- 🔲 **边框系统** - 5级边框层级，用于视觉分隔

### 无障碍功能
- ♿ **高对比度模式** - 支持普通、高对比度和超高对比度
- 🔍 **字体缩放** - 全局字体大小调整（0.875倍到1.5倍）
- 📏 **可调行高** - 四个预设：紧凑、正常、宽松、极宽松
- 🔤 **字间距** - 四个宽度选项，提高可读性
- 🎬 **动画偏好** - 遵循 prefers-reduced-motion

## 安装

### 直接下载
```html
<link rel="stylesheet" href="design-tokens.css">
```

### NPM（即将推出）
```sh
npm install @shelchin/design-tokens
```

## 使用方法

### 基础设置
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <link rel="stylesheet" href="design-tokens.css">
</head>
<body>
    <!-- 你的内容 -->
</body>
</html>
```

### 自定义配置
覆盖核心配置变量来自定义你的设计系统：

```css
:root {
  /* 核心配置 */
  --brand-hue: 217;        /* 主品牌色色相 (0-360) */
  --brand-saturation: 91%; /* 品牌色饱和度 (0-100%) */
  --radius-scale: 1;       /* 圆角倍数 */
  --spacing-scale: 1;      /* 间距倍数 */
  
  /* 无障碍 */
  --font-scale: 1;         /* 全局字体大小倍数 */
  --contrast-mode: normal; /* normal | high | ultra */
  --letter-spacing: normal;/* normal | wide | wider | widest */
  --line-height: 1.6;      /* 基础行高 */
}
```

### 深色模式

#### 自动（系统偏好）
系统会自动响应用户操作系统的深色模式偏好设置。

#### 手动控制
```html
<!-- 强制深色模式 -->
<html data-theme="dark">

<!-- 通过 JavaScript 切换 -->
<script>
document.documentElement.setAttribute('data-theme', 'dark');
</script>
```

### 无障碍功能

#### 高对比度模式
```html
<html data-contrast="high">  <!-- 高对比度 -->
<html data-contrast="ultra"> <!-- 超高对比度 -->
```

#### 字体大小调整
```html
<html data-font-size="large">    <!-- 1.125倍 -->
<html data-font-size="x-large">  <!-- 1.25倍 -->
<html data-font-size="xx-large"> <!-- 1.5倍 -->
```

#### 行高调整
```html
<html data-line-height="relaxed"> <!-- 1.8 -->
<html data-line-height="loose">   <!-- 2.2 -->
```

## SwiftUI 版本

包含完整的 SwiftUI 实现，提供一个镜像 Web 展示的原生 macOS 应用程序：

- 🎨 完整的设计令牌系统
- 🌍 双语支持（中文/英文）
- 🌓 深色模式支持
- ♿ 完整的无障碍功能
- 🧩 54个组件示例

### 如何运行 SwiftUI 展示

```bash
# 导航到 SwiftUI 包目录
cd DesignTokensShowcase

# 运行展示演示应用
swift run ShowcaseDemo

# 或在 Xcode 中打开
open Package.swift
# 然后选择 "ShowcaseDemo" scheme 并点击运行 (⌘R)
```

**系统要求：**
- macOS 13.0 或更高版本
- Xcode 14.0 或更高版本
- Swift 5.7 或更高版本

### SwiftUI 集成

设计令牌作为 Swift Package 提供：

```swift
import DesignTokensKit

// 在 SwiftUI 视图中使用设计令牌
Text("你好世界")
    .foregroundColor(DesignTokens.Colors.primary)
    .padding(DesignTokens.Spacing.space4)
```

## 交互式展示

查看交互式展示来探索所有设计令牌并测试不同的配置：

```bash
# 在浏览器中打开 showcase.html
open showcase.html
```

展示包括：
- 实时主题切换
- 颜色调色板查看器
- 字体排版示例
- 间距演示
- 组件示例
- 无障碍控制
- 字体上传系统

## 设计理念

该系统遵循"60分及格"的视觉理念：
- **实用优于完美** - 专注于解决问题，而非像素级完美
- **默认可访问** - 内置支持各种无障碍需求
- **跨平台** - 在Web和原生平台上无缝工作
- **可维护** - 所有设计决策的单一真相来源
- **可扩展** - 易于扩展和自定义

## 浏览器支持

- Chrome（最新3个版本）
- Firefox（最新3个版本）
- Safari（最新3个版本）
- Edge（最新3个版本）

## 文件结构

```
design-token/
├── design-tokens.css    # 核心设计系统
├── showcase.html        # 交互式文档
├── README.md           # 英文文档
└── README_zh.md        # 中文文档
```

## 贡献

欢迎贡献！请确保任何更改都保持：
- SwiftUI 兼容性
- 无障碍标准
- 双语文档
- "60分及格"理念

## 许可证

MIT 许可证 - 可在个人和商业项目中自由使用。

## 致谢

专注于实用、可访问的设计，跨平台工作。