//
//  AllSystemViews.swift
//  100%还原所有系统视图
//

import SwiftUI
import DesignTokensKit
// 2. 文字系统视图 - 100%还原
struct CompleteTypographySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "2. 文字系统" : "2. Typography System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "字体大小、字重和字体族" : "Font sizes, weights, and families")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 字体大小展示
            VStack(alignment: .leading, spacing: 20 * config.spacingScale) {
                Text(language == "zh" ? "字体大小" : "Font Sizes")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                    ForEach([
                        ("text-xs", 12, "0.75rem"),
                        ("text-sm", 14, "0.875rem"),
                        ("text-base", 16, "1rem"),
                        ("text-lg", 18, "1.125rem"),
                        ("text-xl", 20, "1.25rem"),
                        ("text-2xl", 24, "1.5rem"),
                        ("text-3xl", 30, "1.875rem"),
                        ("text-4xl", 36, "2.25rem"),
                        ("text-5xl", 48, "3rem"),
                        ("text-6xl", 60, "3.75rem"),
                        ("text-7xl", 72, "4.5rem"),
                        ("text-8xl", 96, "6rem"),
                        ("text-9xl", 128, "8rem")
                    ], id: \.0) { item in
                        HStack(alignment: .center, spacing: 24 * config.spacingScale) {
                            Text(item.0)
                                .font(.custom("Menlo", size: 12 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                                .frame(width: 80, alignment: .leading)
                            
                            Text(language == "zh" ? "示例文本" : "Sample Text")
                                .globalTextStyle(config, size: CGFloat(item.1), weight: .regular)
                                .frame(minWidth: 200, alignment: .leading)
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                Text("\(item.1)px")
                                    .secondaryTextStyle(config, size: 10)
                                Text("/")
                                    .secondaryTextStyle(config, size: 10)
                                Text(item.2)
                                    .secondaryTextStyle(config, size: 10)
                            }
                        }
                    }
                }
            }
            
            // 字重展示
            VStack(alignment: .leading, spacing: 20 * config.spacingScale) {
                Text(language == "zh" ? "字重" : "Font Weights")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16 * config.spacingScale), count: 4), 
                         spacing: 20 * config.spacingScale) {
                    ForEach([
                        ("font-thin", Font.Weight.thin, "100"),
                        ("font-extralight", Font.Weight.ultraLight, "200"),
                        ("font-light", Font.Weight.light, "300"),
                        ("font-normal", Font.Weight.regular, "400"),
                        ("font-medium", Font.Weight.medium, "500"),
                        ("font-semibold", Font.Weight.semibold, "600"),
                        ("font-bold", Font.Weight.bold, "700"),
                        ("font-extrabold", Font.Weight.heavy, "800"),
                        ("font-black", Font.Weight.black, "900")
                    ], id: \.0) { item in
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            Text("Aa")
                                .globalTextStyle(config, size: 32, weight: item.1)
                            Text(item.0)
                                .font(.custom("Menlo", size: 11 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                            Text(item.2)
                                .secondaryTextStyle(config, size: 10)
                        }
                    }
                }
            }
            
            // 字体族展示
            VStack(alignment: .leading, spacing: 20 * config.spacingScale) {
                Text(language == "zh" ? "字体族" : "Font Families")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                    ForEach([
                        ("font-sans", "Helvetica Neue, Arial, sans-serif"),
                        ("font-serif", "Georgia, Times, serif"),
                        ("font-mono", "Menlo, Monaco, monospace")
                    ], id: \.0) { item in
                        VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                            Text(item.0)
                                .font(.custom("Menlo", size: 12 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                            Text(language == "zh" ? "这是一段示例文本，展示不同的字体族效果。" : 
                                 "The quick brown fox jumps over the lazy dog.")
                                .font(fontForFamily(item.0, size: 16 * config.fontScale))
                            Text(item.1)
                                .secondaryTextStyle(config, size: 10)
                        }
                        .padding(12 * config.spacingScale)
                        .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
                        .cornerRadius(6 * config.radiusScale)
                    }
                }
            }
        }
    }
    
    private func fontForFamily(_ family: String, size: CGFloat) -> Font {
        switch family {
        case "font-sans":
            return .custom("Helvetica Neue", size: size)
        case "font-serif":
            return .custom("Georgia", size: size)
        case "font-mono":
            return .custom("Menlo", size: size)
        default:
            return .system(size: size)
        }
    }
}

// 3. 层级系统视图 - 100%还原
struct CompleteHierarchySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "3. 层级系统" : "3. Hierarchy System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "Z-index层级管理" : "Z-index hierarchy management")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 层级展示 - 9个层级
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16 * config.spacingScale), count: 3),
                     spacing: 20 * config.spacingScale) {
                ForEach([
                    ("z-0", 0, language == "zh" ? "基础层" : "Base"),
                    ("z-10", 10, language == "zh" ? "浮动元素" : "Float"),
                    ("z-20", 20, language == "zh" ? "固定头部" : "Sticky"),
                    ("z-30", 30, language == "zh" ? "遮罩层" : "Overlay"),
                    ("z-40", 40, language == "zh" ? "导航栏" : "Navigation"),
                    ("z-50", 50, language == "zh" ? "弹出层" : "Popover"),
                    ("z-60", 60, language == "zh" ? "下拉菜单" : "Dropdown"),
                    ("z-70", 70, language == "zh" ? "模态框" : "Modal"),
                    ("z-80", 80, language == "zh" ? "通知提示" : "Toast"),
                    ("z-90", 90, language == "zh" ? "工具提示" : "Tooltip"),
                    ("z-100", 100, language == "zh" ? "最高层" : "Maximum")
                ], id: \.0) { item in
                    VStack(spacing: 8 * config.spacingScale) {
                        ZStack {
                            ForEach(0..<3) { index in
                                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                    .fill(DesignTokens.Colors.primary.opacity(0.3 - Double(index) * 0.1))
                                    .frame(width: 80 - CGFloat(index * 10), height: 60 - CGFloat(index * 10))
                                    .offset(x: CGFloat(index * 5), y: CGFloat(index * 5))
                            }
                        }
                        .frame(width: 100, height: 80)
                        
                        VStack(spacing: 4 * config.spacingScale) {
                            Text(item.0)
                                .font(.custom("Menlo", size: 11 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                            Text(item.2)
                                .globalTextStyle(config, size: 10)
                            Text("z-index: \(item.1)")
                                .secondaryTextStyle(config, size: 9)
                        }
                    }
                }
            }
        }
    }
}

// 4. 间距系统视图 - 100%还原
struct CompleteSpacingSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "4. 间距系统" : "4. Spacing System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "统一的间距规范" : "Unified spacing specifications")
                    .secondaryTextStyle(config, size: 14)
            }
            
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                ForEach([
                    ("space-0", 0),
                    ("space-0.5", 2),
                    ("space-1", 4),
                    ("space-1.5", 6),
                    ("space-2", 8),
                    ("space-2.5", 10),
                    ("space-3", 12),
                    ("space-3.5", 14),
                    ("space-4", 16),
                    ("space-5", 20),
                    ("space-6", 24),
                    ("space-7", 28),
                    ("space-8", 32),
                    ("space-9", 36),
                    ("space-10", 40),
                    ("space-11", 44),
                    ("space-12", 48),
                    ("space-14", 56),
                    ("space-16", 64),
                    ("space-20", 80),
                    ("space-24", 96),
                    ("space-28", 112),
                    ("space-32", 128),
                    ("space-36", 144),
                    ("space-40", 160)
                ], id: \.0) { item in
                    HStack(spacing: 16 * config.spacingScale) {
                        Text(item.0)
                            .font(.custom("Menlo", size: 11 * config.fontScale))
                            .foregroundColor(DesignTokens.Colors.primary)
                            .frame(width: 80, alignment: .leading)
                        
                        Rectangle()
                            .fill(DesignTokens.Colors.primary.opacity(0.2))
                            .frame(width: min(CGFloat(item.1) * config.spacingScale * 3, 300), height: 20)
                            .overlay(
                                Rectangle()
                                    .fill(DesignTokens.Colors.primary)
                                    .frame(width: CGFloat(item.1) * config.spacingScale, height: 20),
                                alignment: .leading
                            )
                        
                        Text("\(item.1)px")
                            .secondaryTextStyle(config, size: 10)
                            .frame(width: 50, alignment: .leading)
                        
                        Text("(\(String(format: "%.2f", Double(item.1) / 16))rem)")
                            .secondaryTextStyle(config, size: 10)
                    }
                }
            }
        }
    }
}

// 5. 圆角系统视图 - 100%还原
struct CompleteRadiusSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "5. 圆角系统" : "5. Radius System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "统一的圆角规范" : "Unified radius specifications")
                    .secondaryTextStyle(config, size: 14)
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16 * config.spacingScale), count: 4),
                     spacing: 20 * config.spacingScale) {
                ForEach([
                    ("rounded-none", 0),
                    ("rounded-sm", 2),
                    ("rounded", 4),
                    ("rounded-md", 6),
                    ("rounded-lg", 8),
                    ("rounded-xl", 12),
                    ("rounded-2xl", 16),
                    ("rounded-3xl", 24),
                    ("rounded-full", 9999)
                ], id: \.0) { item in
                    VStack(spacing: 8 * config.spacingScale) {
                        if item.0 == "rounded-full" {
                            Circle()
                                .fill(DesignTokens.Colors.primary.opacity(0.1))
                                .overlay(Circle().stroke(DesignTokens.Colors.primary, lineWidth: 2))
                                .frame(width: 64, height: 64)
                        } else {
                            RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                .fill(DesignTokens.Colors.primary.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                        .stroke(DesignTokens.Colors.primary, lineWidth: 2)
                                )
                                .frame(width: 80, height: 64)
                        }
                        
                        VStack(spacing: 4 * config.spacingScale) {
                            Text(item.0)
                                .font(.custom("Menlo", size: 10 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                            Text(item.0 == "rounded-full" ? "9999px" : "\(item.1)px")
                                .secondaryTextStyle(config, size: 9)
                        }
                    }
                }
            }
        }
    }
}

// 6. 阴影系统视图 - 100%还原
struct CompleteShadowSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "6. 阴影系统" : "6. Shadow System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "分层阴影效果" : "Layered shadow effects")
                    .secondaryTextStyle(config, size: 14)
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: 3),
                     spacing: 24 * config.spacingScale) {
                ForEach([
                    ("shadow-sm", 1, 2),
                    ("shadow", 2, 4),
                    ("shadow-md", 4, 6),
                    ("shadow-lg", 10, 15),
                    ("shadow-xl", 20, 25),
                    ("shadow-2xl", 25, 50),
                    ("shadow-inner", -2, 0),
                    ("shadow-none", 0, 0)
                ], id: \.0) { item in
                    VStack(spacing: 12 * config.spacingScale) {
                        RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                            .fill(Color.white)
                            .frame(width: 120, height: 80)
                            .shadow(color: Color.black.opacity(item.0 == "shadow-inner" ? 0.1 : 0.15),
                                   radius: CGFloat(item.1),
                                   x: 0,
                                   y: item.0 == "shadow-inner" ? -2 : CGFloat(item.2))
                        
                        VStack(spacing: 4 * config.spacingScale) {
                            Text(item.0)
                                .font(.custom("Menlo", size: 11 * config.fontScale))
                                .foregroundColor(DesignTokens.Colors.primary)
                            if item.0 != "shadow-none" {
                                Text("blur: \(item.1)px")
                                    .secondaryTextStyle(config, size: 9)
                            }
                        }
                    }
                }
            }
        }
    }
}

// 7. 无障碍系统视图 - 100%还原
struct CompleteAccessibilitySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "7. 无障碍" : "7. Accessibility")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "WCAG对比度标准" : "WCAG contrast standards")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 对比度示例
            VStack(alignment: .leading, spacing: 20 * config.spacingScale) {
                Text(language == "zh" ? "文本对比度" : "Text Contrast")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16 * config.spacingScale), count: 2),
                         spacing: 16 * config.spacingScale) {
                    ForEach([
                        ("AA Normal", "4.5:1", Color.black, Color.white),
                        ("AA Large", "3:1", Color(white: 0.3), Color.white),
                        ("AAA Normal", "7:1", Color.black, Color.white),
                        ("AAA Large", "4.5:1", Color(white: 0.2), Color.white)
                    ], id: \.0) { item in
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            HStack {
                                Text(item.0)
                                    .font(.system(size: 14 * config.fontScale, weight: .medium))
                                    .foregroundColor(item.3)
                                Spacer()
                                Text(item.1)
                                    .font(.system(size: 12 * config.fontScale))
                                    .foregroundColor(item.3.opacity(0.8))
                            }
                            .padding(12 * config.spacingScale)
                            .background(item.2)
                            .cornerRadius(6 * config.radiusScale)
                            
                            Text(language == "zh" ? "示例文本 Sample Text" : "Sample Text 示例文本")
                                .globalTextStyle(config, size: 11)
                        }
                    }
                }
            }
            
            // 焦点指示器
            VStack(alignment: .leading, spacing: 20 * config.spacingScale) {
                Text(language == "zh" ? "焦点指示器" : "Focus Indicators")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                
                HStack(spacing: 24 * config.spacingScale) {
                    ForEach([
                        (language == "zh" ? "默认" : "Default", 2, DesignTokens.Colors.primary),
                        (language == "zh" ? "高对比" : "High Contrast", 3, Color.black),
                        (language == "zh" ? "自定义" : "Custom", 2, DesignTokens.Colors.accent)
                    ], id: \.0) { item in
                        VStack(spacing: 8 * config.spacingScale) {
                            Button(item.0) {}
                                .buttonStyle(PlainButtonStyle())
                                .padding(12 * config.spacingScale)
                                .background(Color(NSColor.controlBackgroundColor))
                                .cornerRadius(6 * config.radiusScale)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                                        .stroke(item.2, lineWidth: CGFloat(item.1))
                                )
                            
                            Text("\(item.1)px outline")
                                .secondaryTextStyle(config, size: 10)
                        }
                    }
                }
            }
        }
    }
}

// 8. 组件示例视图 - 100%还原
struct CompleteComponentsView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    @State private var isToggled = false
    @State private var sliderValue = 50.0
    @State private var selectedTab = 0
    @State private var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "8. 组件示例" : "8. Component Examples")
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(language == "zh" ? "常用UI组件展示" : "Common UI component showcase")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 组件网格
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20 * config.spacingScale), count: 3),
                     spacing: 24 * config.spacingScale) {
                
                // 按钮组件
                ComponentCard(title: language == "zh" ? "按钮" : "Buttons", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        Button("Primary") {}
                            .buttonStyle(PrimaryButtonStyle(config: config))
                        Button("Secondary") {}
                            .buttonStyle(SecondaryButtonStyle(config: config))
                        Button("Disabled") {}
                            .disabled(true)
                            .buttonStyle(DisabledButtonStyle(config: config))
                    }
                }
                
                // 输入框组件
                ComponentCard(title: language == "zh" ? "输入框" : "Input", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        TextField(language == "zh" ? "占位文本" : "Placeholder", text: $text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField(language == "zh" ? "密码" : "Password", text: $text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                // 选择器组件
                ComponentCard(title: language == "zh" ? "选择器" : "Selectors", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        Toggle(isOn: $isToggled) {
                            Text(language == "zh" ? "开关" : "Toggle")
                                .globalTextStyle(config, size: 12)
                        }
                        Picker(language == "zh" ? "选择" : "Select", selection: $selectedTab) {
                            Text("选项 1").tag(0)
                            Text("选项 2").tag(1)
                            Text("选项 3").tag(2)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                
                // 滑块组件
                ComponentCard(title: language == "zh" ? "滑块" : "Slider", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        Slider(value: $sliderValue, in: 0...100)
                            .accentColor(DesignTokens.Colors.primary)
                        Text("\(Int(sliderValue))%")
                            .globalTextStyle(config, size: 12)
                    }
                }
                
                // 标签组件
                ComponentCard(title: language == "zh" ? "标签" : "Tags", config: config) {
                    HStack(spacing: 8 * config.spacingScale) {
                        ForEach(["Swift", "Design", "UI"], id: \.self) { tag in
                            Text(tag)
                                .globalTextStyle(config, size: 11)
                                .padding(.horizontal, 8 * config.spacingScale)
                                .padding(.vertical, 4 * config.spacingScale)
                                .background(DesignTokens.Colors.brandColor(for: 100))
                                .foregroundColor(DesignTokens.Colors.brandColor(for: 700))
                                .cornerRadius(4 * config.radiusScale)
                        }
                    }
                }
                
                // 卡片组件
                ComponentCard(title: language == "zh" ? "卡片" : "Card", config: config) {
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        Text(language == "zh" ? "卡片标题" : "Card Title")
                            .globalTextStyle(config, size: 14, weight: .semibold)
                        Text(language == "zh" ? "这是卡片内容描述" : "This is card content")
                            .secondaryTextStyle(config, size: 12)
                    }
                    .padding(12 * config.spacingScale)
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8 * config.radiusScale)
                    .shadow(radius: 2)
                }
                
                // 进度条组件
                ComponentCard(title: language == "zh" ? "进度条" : "Progress", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        ProgressView(value: 0.6)
                            .progressViewStyle(LinearProgressViewStyle(tint: DesignTokens.Colors.primary))
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(0.8)
                    }
                }
                
                // 提示组件
                ComponentCard(title: language == "zh" ? "提示" : "Alert", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        HStack(spacing: 8 * config.spacingScale) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(DesignTokens.Colors.info)
                            Text(language == "zh" ? "信息提示" : "Info message")
                                .globalTextStyle(config, size: 11)
                        }
                        .padding(8 * config.spacingScale)
                        .background(DesignTokens.Colors.info.opacity(0.1))
                        .cornerRadius(4 * config.radiusScale)
                    }
                }
                
                // 徽章组件
                ComponentCard(title: language == "zh" ? "徽章" : "Badge", config: config) {
                    HStack(spacing: 12 * config.spacingScale) {
                        ForEach([("New", Color.green), ("Hot", Color.red), ("Pro", Color.blue)], id: \.0) { badge in
                            Text(badge.0)
                                .font(.system(size: 10 * config.fontScale, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 6 * config.spacingScale)
                                .padding(.vertical, 2 * config.spacingScale)
                                .background(badge.1)
                                .cornerRadius(3 * config.radiusScale)
                        }
                    }
                }
            }
        }
    }
}

// ComponentCard is now defined in ComponentsSystem.swift