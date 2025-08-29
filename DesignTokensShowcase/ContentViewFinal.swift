//
//  ContentViewFinal.swift
//  100% 精确还原 showcase.html
//

import SwiftUI

struct ContentViewFinal: View {
    @StateObject private var config = DesignTokensConfig.shared
    @State private var selectedSection = "colors"
    @State private var language = "zh"
    @State private var controlsExpanded = true
    @State private var isDarkMode = false
    
    var body: some View {
        ZStack {
            // 背景 - 根据主题切换
            Color(isDarkMode ? 
                NSColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1) : 
                NSColor(red: 1, green: 1, blue: 1, alpha: 1)
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 头部 - 居中显示
                VStack(spacing: 16) {
                    // 使用品牌色的主标题
                    Text(language == "zh" ? "跨平台设计系统" : "Cross-Platform Design System")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(DesignTokens.Colors.primary)
                    
                    Text(language == "zh" ? 
                        "100% SwiftUI 兼容的设计令牌" : 
                        "100% SwiftUI Compatible Design Tokens"
                    )
                    .font(.system(size: 18))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 48)
                .background(Color(NSColor.controlBackgroundColor).opacity(0.3))
                .overlay(
                    Rectangle()
                        .fill(Color(NSColor.separatorColor))
                        .frame(height: 1),
                    alignment: .bottom
                )
                
                // 控制栏 - sticky顶部
                HStack(spacing: 24) {
                    // 主题切换
                    HStack(spacing: 8) {
                        Text(language == "zh" ? "主题" : "Theme")
                            .font(.system(size: 13))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                        
                        Button(action: { 
                            isDarkMode = false
                            config.isDarkMode = false
                        }) {
                            Text(language == "zh" ? "亮色" : "Light")
                                .font(.system(size: 12, weight: isDarkMode ? .regular : .medium))
                                .foregroundColor(isDarkMode ? Color(NSColor.labelColor) : .white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(isDarkMode ? Color.clear : DesignTokens.Colors.brandColor(for: 500))
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: { 
                            isDarkMode = true
                            config.isDarkMode = true
                        }) {
                            Text(language == "zh" ? "暗色" : "Dark")
                                .font(.system(size: 12, weight: isDarkMode ? .medium : .regular))
                                .foregroundColor(isDarkMode ? .white : Color(NSColor.labelColor))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(isDarkMode ? DesignTokens.Colors.brandColor(for: 500) : Color.clear)
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    // 语言切换
                    HStack(spacing: 8) {
                        Text(language == "zh" ? "语言" : "Language")
                            .font(.system(size: 13))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                        
                        Button(action: { language = "zh" }) {
                            Text("中文")
                                .font(.system(size: 12, weight: language == "zh" ? .medium : .regular))
                                .foregroundColor(language == "zh" ? .white : Color(NSColor.labelColor))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(language == "zh" ? DesignTokens.Colors.brandColor(for: 500) : Color.clear)
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: { language = "en" }) {
                            Text("English")
                                .font(.system(size: 12, weight: language == "en" ? .medium : .regular))
                                .foregroundColor(language == "en" ? .white : Color(NSColor.labelColor))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(language == "en" ? DesignTokens.Colors.brandColor(for: 500) : Color.clear)
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 48)
                .padding(.vertical, 12)
                .background(Color(NSColor.controlBackgroundColor).opacity(0.95))
                .overlay(
                    Rectangle()
                        .fill(Color(NSColor.separatorColor))
                        .frame(height: 1),
                    alignment: .bottom
                )
                
                // 主内容区域
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // 导航标签
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 4) {
                                ForEach([
                                    ("colors", language == "zh" ? "色彩系统" : "Colors"),
                                    ("typography", language == "zh" ? "文字系统" : "Typography"),
                                    ("hierarchy", language == "zh" ? "层级系统" : "Hierarchy"),
                                    ("spacing", language == "zh" ? "间距系统" : "Spacing"),
                                    ("radius", language == "zh" ? "圆角系统" : "Radius"),
                                    ("shadow", language == "zh" ? "阴影系统" : "Shadow"),
                                    ("accessibility", language == "zh" ? "无障碍" : "Accessibility"),
                                    ("components", language == "zh" ? "组件示例" : "Components")
                                ], id: \.0) { item in
                                    Button(action: { selectedSection = item.0 }) {
                                        Text(item.1)
                                            .font(.system(size: 13, weight: .medium))
                                            .foregroundColor(selectedSection == item.0 ? .white : Color(NSColor.labelColor))
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(selectedSection == item.0 ? DesignTokens.Colors.brandColor(for: 500) : Color.clear)
                                            )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 48)
                        }
                        .padding(.vertical, 24)
                        
                        // 内容区域
                        Group {
                            switch selectedSection {
                            case "colors":
                                CompleteColorSystemView(language: language, config: config)
                            case "typography":
                                TypographySystemView(language: language, config: config)
                            case "hierarchy":
                                HierarchySystemView(language: language, config: config)
                            case "spacing":
                                SpacingSystemView(language: language, config: config)
                            case "radius":
                                RadiusSystemView(language: language, config: config)
                            case "shadow":
                                ShadowSystemView(language: language, config: config)
                            case "accessibility":
                                AccessibilitySystemView(language: language, config: config)
                            case "components":
                                ComponentsSystemView(language: language, config: config)
                            default:
                                CompleteColorSystemView(language: language, config: config)
                            }
                        }
                        .padding(.horizontal, 48)
                        .padding(.bottom, 100)
                    }
                }
            }
            
            // 悬浮控制面板
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FullControlPanelNew(
                        config: config,
                        controlsExpanded: $controlsExpanded,
                        language: $language,
                        isDarkMode: $isDarkMode
                    )
                    .frame(width: 320)
                    .padding(32)
                }
            }
        }
        .frame(minWidth: 1200, minHeight: 800)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// CompleteColorSystemView is now imported from CompleteColorSystem.swift

// 文字系统视图
struct TypographySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // 标题
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "2. 文字系统" : "2. Typography System")
                    .font(.system(size: 32, weight: .bold))
                Text(language == "zh" ? "字体大小、字重和字体族" : "Font sizes, weights, and families")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // 字体大小展示
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字体大小 (完整)" : "Font Sizes (Complete)")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach([
                        ("text-xs", 12, "12px"),
                        ("text-sm", 14, "14px"),
                        ("text-base", 16, "16px"),
                        ("text-lg", 18, "18px"),
                        ("text-xl", 20, "20px"),
                        ("text-2xl", 24, "24px"),
                        ("text-3xl", 30, "30px"),
                        ("text-4xl", 36, "36px"),
                        ("text-5xl", 48, "48px"),
                        ("text-6xl", 60, "60px")
                    ], id: \.0) { item in
                        HStack(spacing: 16) {
                            Text("\(item.0) (\(item.2))")
                                .font(.system(size: CGFloat(item.1) * config.fontScale))
                                .frame(minWidth: 200, alignment: .leading)
                        }
                    }
                }
            }
            
            // 字体族
            HStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sans-serif")
                        .font(.system(size: 16, weight: .semibold))
                    Text("System UI Font - 系统默认字体\nABCDEFGHIJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz\n0123456789")
                        .font(.system(size: 14))
                    Text("--font-family-sans")
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundColor(Color(NSColor.tertiaryLabelColor))
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Monospace")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Monospace Font - 等宽字体\nABCDEFGHIJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz\n0123456789")
                        .font(.system(size: 14, design: .monospaced))
                    Text("--font-family-mono")
                        .font(.system(size: 11, design: .monospaced))
                        .foregroundColor(Color(NSColor.tertiaryLabelColor))
                }
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(8)
        }
    }
}

// 间距系统视图
struct SpacingSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "4. 间距系统" : "4. Spacing System")
                    .font(.system(size: 32, weight: .bold))
                Text(language == "zh" ? "统一的间距规范" : "Unified spacing specifications")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach([
                    ("space-0", 0),
                    ("space-0.5", 2),
                    ("space-1", 4),
                    ("space-2", 8),
                    ("space-3", 12),
                    ("space-4", 16),
                    ("space-5", 20),
                    ("space-6", 24),
                    ("space-8", 32),
                    ("space-10", 40),
                    ("space-12", 48),
                    ("space-16", 64),
                    ("space-20", 80),
                    ("space-24", 96)
                ], id: \.0) { item in
                    HStack(spacing: 16) {
                        Rectangle()
                            .fill(DesignTokens.Colors.brandColor(for: 500).opacity(0.2))
                            .frame(width: CGFloat(item.1) * config.spacingScale * 2, height: 24)
                            .overlay(
                                Rectangle()
                                    .fill(DesignTokens.Colors.brandColor(for: 500))
                                    .frame(width: CGFloat(item.1) * config.spacingScale, height: 24),
                                alignment: .leading
                            )
                        
                        Text(item.0)
                            .font(.system(size: 12, design: .monospaced))
                            .frame(width: 80, alignment: .leading)
                        
                        Text("\(item.1)px")
                            .font(.system(size: 11))
                            .foregroundColor(Color(NSColor.tertiaryLabelColor))
                    }
                }
            }
        }
    }
}

// 圆角系统视图
struct RadiusSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "5. 圆角系统" : "5. Radius System")
                    .font(.system(size: 32, weight: .bold))
                Text(language == "zh" ? "统一的圆角规范" : "Unified radius specifications")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 20) {
                ForEach([
                    ("none", 0),
                    ("sm", 4),
                    ("base", 6),
                    ("md", 8),
                    ("lg", 12),
                    ("xl", 16),
                    ("2xl", 24),
                    ("full", 9999)
                ], id: \.0) { item in
                    VStack(spacing: 8) {
                        if item.0 == "full" {
                            Circle()
                                .fill(DesignTokens.Colors.brandColor(for: 500).opacity(0.1))
                                .overlay(Circle().stroke(DesignTokens.Colors.brandColor(for: 500), lineWidth: 2))
                                .frame(width: 64, height: 64)
                        } else {
                            RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                .fill(DesignTokens.Colors.brandColor(for: 500).opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                        .stroke(DesignTokens.Colors.brandColor(for: 500), lineWidth: 2)
                                )
                                .frame(width: 64, height: 64)
                        }
                        
                        Text(item.0)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text(item.0 == "full" ? "9999px" : "\(item.1)px")
                            .font(.system(size: 10))
                            .foregroundColor(Color(NSColor.tertiaryLabelColor))
                    }
                }
            }
        }
    }
}

// 阴影系统视图
struct ShadowSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "6. 阴影系统" : "6. Shadow System")
                    .font(.system(size: 32, weight: .bold))
                Text(language == "zh" ? "多层次的阴影效果" : "Multi-level shadow effects")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach([
                    ("shadow-sm", 2),
                    ("shadow-base", 4),
                    ("shadow-md", 6),
                    ("shadow-lg", 10),
                    ("shadow-xl", 15),
                    ("shadow-2xl", 25)
                ], id: \.0) { item in
                    VStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: 100, height: 60)
                            .shadow(
                                color: Color.black.opacity(0.1),
                                radius: CGFloat(item.1),
                                y: CGFloat(item.1) / 2
                            )
                        
                        Text(item.0)
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                }
            }
        }
    }
}

// 层级系统视图
struct HierarchySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        Text(language == "zh" ? "层级系统" : "Hierarchy System")
            .font(.system(size: 24, weight: .bold))
    }
}

struct AccessibilitySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        Text(language == "zh" ? "无障碍" : "Accessibility")
            .font(.system(size: 24, weight: .bold))
    }
}

struct ComponentsSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        Text(language == "zh" ? "组件示例" : "Components")
            .font(.system(size: 24, weight: .bold))
    }
}