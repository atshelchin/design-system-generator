# DesignTokensKit 使用指南

## 概述
DesignTokensKit 是一个 SwiftUI 设计系统框架，提供了完整的设计令牌（Design Tokens）系统，包括颜色、文字、间距、圆角、阴影等设计元素的统一管理。

## 核心组件

### 1. DesignTokensConfig (配置管理)
```swift
@StateObject private var config = DesignTokensConfig.shared

// 可配置的属性
config.isDarkMode        // 暗色模式
config.brandHue          // 品牌色调 (0-360)
config.brandSaturation   // 品牌饱和度 (0-100)
config.fontScale         // 字体缩放 (0.875-1.25)
config.spacingScale      // 间距缩放 (0.5-2)
config.radiusScale       // 圆角缩放 (0-3)
config.contrast          // 对比度 (.normal, .high, .ultra)
config.letterSpacing     // 字间距 (.normal, .wide, .wider)
config.lineHeight        // 行高 (.normal, .relaxed, .loose)
config.selectedFont      // 字体选择 ("system", "serif", "sans-serif", "monospace", 或自定义字体名)
```

### 2. DesignTokens (设计令牌)

#### 颜色系统
```swift
// 基础颜色
DesignTokens.Colors.background       // 背景色
DesignTokens.Colors.foreground       // 前景色
DesignTokens.Colors.card            // 卡片背景
DesignTokens.Colors.border          // 边框色
DesignTokens.Colors.primary         // 主色
DesignTokens.Colors.secondary       // 次要色
DesignTokens.Colors.muted           // 柔和色
DesignTokens.Colors.mutedForeground // 柔和前景色

// 语义颜色
DesignTokens.Colors.success         // 成功色
DesignTokens.Colors.warning         // 警告色
DesignTokens.Colors.danger          // 危险色
DesignTokens.Colors.info            // 信息色

// 品牌色阶
DesignTokens.Colors.brandColor(for: 100) // 100-900 色阶

// 标题颜色
DesignTokens.Colors.heading(1)      // H1-H6 标题颜色
```

#### 文字系统
```swift
// 字体大小
DesignTokens.Typography.textXS      // 12px
DesignTokens.Typography.textSM      // 14px
DesignTokens.Typography.textBase    // 16px
DesignTokens.Typography.textLG      // 18px
DesignTokens.Typography.textXL      // 20px
DesignTokens.Typography.text2XL     // 24px
DesignTokens.Typography.text3XL     // 30px
DesignTokens.Typography.text4XL     // 36px
DesignTokens.Typography.text5XL     // 48px
DesignTokens.Typography.text6XL     // 60px
```

#### 间距系统
```swift
DesignTokens.Spacing.space0         // 0px
DesignTokens.Spacing.space1         // 4px
DesignTokens.Spacing.space2         // 8px
DesignTokens.Spacing.space3         // 12px
DesignTokens.Spacing.space4         // 16px
DesignTokens.Spacing.space5         // 20px
DesignTokens.Spacing.space6         // 24px
DesignTokens.Spacing.space8         // 32px
DesignTokens.Spacing.space10        // 40px
DesignTokens.Spacing.space12        // 48px
DesignTokens.Spacing.space16        // 64px
```

#### 圆角系统
```swift
DesignTokens.Radius.none            // 0px
DesignTokens.Radius.sm              // 2px
DesignTokens.Radius.base            // 4px
DesignTokens.Radius.md              // 6px
DesignTokens.Radius.lg              // 8px
DesignTokens.Radius.xl              // 12px
DesignTokens.Radius.xxl             // 16px
DesignTokens.Radius.full            // 9999px
```

#### 阴影系统
```swift
DesignTokens.Shadows.sm             // 小阴影
DesignTokens.Shadows.base           // 基础阴影
DesignTokens.Shadows.md             // 中等阴影
DesignTokens.Shadows.lg             // 大阴影
DesignTokens.Shadows.xl             // 超大阴影
DesignTokens.Shadows.xxl            // 特大阴影
```

## 文字样式修饰器

### globalTextStyle
应用全局文字样式，包括字体、大小、字重、行高、字间距和颜色：
```swift
Text("Hello World")
    .globalTextStyle(config, size: 16, weight: .semibold)
```

### globalTextStyleNoColor
应用全局文字样式但不设置颜色（用于需要自定义颜色的场景）：
```swift
Text("Custom Color Text")
    .globalTextStyleNoColor(config, size: 14)
    .foregroundColor(DesignTokens.Colors.primary)
```

### secondaryTextStyle
应用次要文字样式（自动使用柔和颜色）：
```swift
Text("Secondary text")
    .secondaryTextStyle(config, size: 12)
```

### monoTextStyle
应用等宽字体样式（用于代码显示）：
```swift
Text("console.log('Hello')")
    .monoTextStyle(config, size: 14)
```

## 实际使用示例

### 1. 创建响应式卡片
```swift
struct MyCard: View {
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            Text("Card Title")
                .globalTextStyle(config, size: 18, weight: .semibold)
            
            Text("Card content goes here")
                .globalTextStyle(config, size: 14)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(20 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}
```

### 2. 创建响应式按钮
```swift
struct MyButton: View {
    @ObservedObject var config: DesignTokensConfig
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .globalTextStyle(config, size: 14, weight: .medium)
                .foregroundColor(DesignTokens.Colors.primaryForeground)
                .padding(.horizontal, 16 * config.spacingScale)
                .padding(.vertical, 8 * config.spacingScale)
                .background(DesignTokens.Colors.primary)
                .cornerRadius(6 * config.radiusScale)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
```

### 3. 创建响应式网格布局
```swift
struct MyGrid: View {
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: 24 * config.spacingScale),
                GridItem(.flexible(), spacing: 24 * config.spacingScale),
                GridItem(.flexible(), spacing: 24 * config.spacingScale)
            ],
            spacing: 24 * config.spacingScale
        ) {
            ForEach(items) { item in
                ItemView(item: item, config: config)
            }
        }
    }
}
```

### 4. 实现暗色模式支持
```swift
struct ContentView: View {
    @StateObject private var config = DesignTokensConfig.shared
    
    var body: some View {
        VStack {
            // 切换按钮
            Button("Toggle Dark Mode") {
                config.isDarkMode.toggle()
            }
            
            // 内容会自动响应主题变化
            Text("自适应主题的文字")
                .globalTextStyle(config, size: 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignTokens.Colors.background)
    }
}
```

### 5. 动态调整设计参数
```swift
struct ControlPanel: View {
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack {
            // 字体大小调整
            Slider(value: $config.fontScale, in: 0.875...1.25)
            
            // 间距调整
            Slider(value: $config.spacingScale, in: 0.5...2)
            
            // 圆角调整
            Slider(value: $config.radiusScale, in: 0...3)
            
            // 品牌色调整
            Slider(value: $config.brandHue, in: 0...360)
        }
    }
}
```

## 最佳实践

1. **始终使用 config 参数**：确保所有尺寸值都乘以相应的缩放系数
   ```swift
   .padding(16 * config.spacingScale)  // 正确
   .padding(16)                         // 错误
   ```

2. **使用语义化颜色**：优先使用语义化的颜色而不是硬编码
   ```swift
   .foregroundColor(DesignTokens.Colors.primary)     // 正确
   .foregroundColor(Color.blue)                      // 避免
   ```

3. **响应式文字**：使用 globalTextStyle 而不是 .font()
   ```swift
   .globalTextStyle(config, size: 14)                // 正确
   .font(.system(size: 14))                          // 避免
   ```

4. **保持一致性**：在整个应用中使用相同的设计令牌
   ```swift
   DesignTokens.Spacing.space4                       // 统一的间距
   DesignTokens.Radius.md                            // 统一的圆角
   ```

5. **支持无障碍**：利用对比度模式提升可访问性
   ```swift
   if config.contrast == .ultra {
       // 超高对比度下的特殊处理
   }
   ```

## 注意事项

- DesignTokensConfig 使用单例模式 (`.shared`)，确保全局状态一致
- 所有设计令牌都会根据配置自动调整，无需手动处理
- 字体上传功能需要 CoreText 框架支持
- 行高计算：SwiftUI 的 lineSpacing = (lineHeight - 1) * fontSize
- 确保在根视图设置背景色：`.background(DesignTokens.Colors.background)`

## 完整示例应用
```swift
import SwiftUI
import DesignTokensKit

@main
struct MyApp: App {
    @StateObject private var config = DesignTokensConfig.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(config)
                .background(DesignTokens.Colors.background)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 24 * config.spacingScale) {
            Text("Welcome to DesignTokensKit")
                .globalTextStyle(config, size: 24, weight: .bold)
            
            Text("A complete design system for SwiftUI")
                .secondaryTextStyle(config, size: 16)
            
            Button("Get Started") {
                // Action
            }
            .buttonStyle(PrimaryButtonStyle(config: config))
        }
        .padding(32 * config.spacingScale)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignTokens.Colors.background)
    }
}
```