//
//  ContentViewNew.swift
//  DesignTokensShowcase
//
//  100% 精确还原 showcase.html
//

import SwiftUI

struct ContentViewNew: View {
    @StateObject private var config = DesignTokensConfig.shared
    @State private var selectedSection = "colors"
    @State private var language = "zh"
    @State private var controlsExpanded = true
    
    var body: some View {
        ZStack {
            // 背景色 - 精确匹配HTML
            Color(config.isDarkMode ? 
                NSColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1) : 
                NSColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
            )
            .ignoresSafeArea()
            
            // 主内容区域
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // 标题部分
                    VStack(alignment: .leading, spacing: 12) {
                        Text(language == "zh" ? "跨平台设计系统" : "Cross-Platform Design System")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color(NSColor.labelColor))
                        
                        Text(language == "zh" ? 
                            "Swift/SwiftUI 原生设计令牌系统" : 
                            "Native Design Token System for Swift/SwiftUI"
                        )
                        .font(.system(size: 18))
                        .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 48)
                    .padding(.bottom, 32)
                    
                    // 导航标签
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2) {
                            ForEach([
                                ("colors", language == "zh" ? "色彩" : "Colors"),
                                ("typography", language == "zh" ? "文字" : "Typography"),
                                ("spacing", language == "zh" ? "间距" : "Spacing"),
                                ("radius", language == "zh" ? "圆角" : "Radius"),
                                ("shadow", language == "zh" ? "阴影" : "Shadow"),
                                ("components", language == "zh" ? "组件" : "Components")
                            ], id: \.0) { item in
                                TabButton(
                                    title: item.1,
                                    isSelected: selectedSection == item.0,
                                    action: { selectedSection = item.0 }
                                )
                            }
                        }
                        .padding(.horizontal, 32)
                    }
                    .padding(.bottom, 24)
                    
                    // 内容区域
                    Group {
                        switch selectedSection {
                        case "colors":
                            ColorSystemView(language: language, config: config)
                        case "typography":
                            TypographySystemView(language: language, config: config)
                        case "spacing":
                            SpacingSystemView(language: language, config: config)
                        case "radius":
                            RadiusSystemView(language: language, config: config)
                        case "shadow":
                            ShadowSystemView(language: language, config: config)
                        case "components":
                            ComponentsView(language: language, config: config)
                        default:
                            ColorSystemView(language: language, config: config)
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 100)
                }
            }
            
            // 悬浮控制面板 - 精确位置和样式
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CompactControlPanel(
                        config: config,
                        controlsExpanded: $controlsExpanded,
                        language: $language
                    )
                    .frame(width: 280)
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                }
            }
        }
        .frame(minWidth: 1200, minHeight: 800)
        .preferredColorScheme(config.isDarkMode ? .dark : .light)
    }
}

// 标签按钮
struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(isSelected ? .white : Color(NSColor.labelColor))
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isSelected ? 
                            Color(red: 59/255, green: 130/255, blue: 246/255) : 
                            Color.clear
                        )
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// 色彩系统视图 - 精确还原HTML网格布局
struct ColorSystemView: View {
    let language: String
    let config: DesignTokensConfig
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 6)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // 品牌色
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "品牌色" : "Brand Colors")
                    .font(.system(size: 18, weight: .semibold))
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach([50, 100, 200, 300, 400, 500, 600, 700, 800, 900], id: \.self) { shade in
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(DesignTokens.Colors.brandColor(for: shade))
                                .frame(height: 60)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
                            
                            Text("brand-\(shade)")
                                .font(.system(size: 11))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
            
            // 中性色
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "中性色" : "Neutral Colors")
                    .font(.system(size: 18, weight: .semibold))
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach([50, 100, 200, 300, 400, 500, 600, 700, 800, 900], id: \.self) { shade in
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(DesignTokens.Colors.grayColor(for: shade))
                                .frame(height: 60)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
                            
                            Text("gray-\(shade)")
                                .font(.system(size: 11))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
            
            // 语义色
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "语义色" : "Semantic Colors")
                    .font(.system(size: 18, weight: .semibold))
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                    ForEach([
                        ("Primary", DesignTokens.Colors.primary),
                        ("Secondary", DesignTokens.Colors.secondary),
                        ("Success", DesignTokens.Colors.success),
                        ("Warning", DesignTokens.Colors.warning),
                        ("Error", DesignTokens.Colors.error),
                        ("Info", DesignTokens.Colors.info),
                        ("Muted", DesignTokens.Colors.muted),
                        ("Accent", DesignTokens.Colors.accent)
                    ], id: \.0) { item in
                        VStack(spacing: 8) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(item.1)
                                .frame(height: 60)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
                            
                            Text(item.0)
                                .font(.system(size: 12, weight: .medium))
                            
                            Text("--color-\(item.0.lowercased())")
                                .font(.system(size: 10))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
        }
    }
}

// 文字系统视图
struct TypographySystemView: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // 字体大小
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字体大小" : "Font Sizes")
                    .font(.system(size: 18, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach([
                        ("text-xs", 12),
                        ("text-sm", 14),
                        ("text-base", 16),
                        ("text-lg", 18),
                        ("text-xl", 20),
                        ("text-2xl", 24),
                        ("text-3xl", 30),
                        ("text-4xl", 36)
                    ], id: \.0) { item in
                        HStack(spacing: 24) {
                            Text(language == "zh" ? "示例文本" : "Sample Text")
                                .font(.system(size: CGFloat(item.1) * config.fontScale))
                                .frame(width: 150, alignment: .leading)
                            
                            Text(item.0)
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundColor(Color(NSColor.secondaryLabelColor))
                                .frame(width: 80)
                            
                            Text("\(item.1)px")
                                .font(.system(size: 11))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
            
            // 字重
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字重" : "Font Weights")
                    .font(.system(size: 18, weight: .semibold))
                
                HStack(spacing: 24) {
                    ForEach([
                        ("Thin", Font.Weight.thin),
                        ("Light", Font.Weight.light),
                        ("Regular", Font.Weight.regular),
                        ("Medium", Font.Weight.medium),
                        ("Semibold", Font.Weight.semibold),
                        ("Bold", Font.Weight.bold),
                        ("Black", Font.Weight.black)
                    ], id: \.0) { item in
                        VStack(spacing: 8) {
                            Text("Aa")
                                .font(.system(size: 28, weight: item.1))
                            Text(item.0)
                                .font(.system(size: 11))
                                .foregroundColor(Color(NSColor.secondaryLabelColor))
                        }
                    }
                }
            }
        }
    }
}

// 间距系统视图
struct SpacingSystemView: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(language == "zh" ? "间距系统" : "Spacing System")
                .font(.system(size: 18, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach([
                    ("space-1", 4),
                    ("space-2", 8),
                    ("space-3", 12),
                    ("space-4", 16),
                    ("space-5", 20),
                    ("space-6", 24),
                    ("space-8", 32),
                    ("space-10", 40),
                    ("space-12", 48)
                ], id: \.0) { item in
                    HStack(spacing: 16) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: CGFloat(item.1) * config.spacingScale * 2, height: 24)
                            .overlay(
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: CGFloat(item.1) * config.spacingScale, height: 24),
                                alignment: .leading
                            )
                        
                        Text(item.0)
                            .font(.system(size: 12, design: .monospaced))
                            .frame(width: 70, alignment: .leading)
                        
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
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(language == "zh" ? "圆角系统" : "Radius System")
                .font(.system(size: 18, weight: .semibold))
            
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
                                .fill(Color.blue.opacity(0.1))
                                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                                .frame(width: 64, height: 64)
                        } else {
                            RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                .fill(Color.blue.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: CGFloat(item.1) * config.radiusScale)
                                        .stroke(Color.blue, lineWidth: 2)
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
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(language == "zh" ? "阴影系统" : "Shadow System")
                .font(.system(size: 18, weight: .semibold))
            
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

// 组件视图
struct ComponentsView: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // 按钮
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "按钮" : "Buttons")
                    .font(.system(size: 18, weight: .semibold))
                
                HStack(spacing: 12) {
                    Button(language == "zh" ? "主要按钮" : "Primary") {}
                        .buttonStyle(NewPrimaryButtonStyle())
                    
                    Button(language == "zh" ? "次要按钮" : "Secondary") {}
                        .buttonStyle(SecondaryButtonStyle())
                    
                    Button(language == "zh" ? "轮廓按钮" : "Outline") {}
                        .buttonStyle(NewOutlineButtonStyle())
                    
                    Button(language == "zh" ? "文本按钮" : "Text") {}
                        .buttonStyle(NewTextButtonStyle())
                }
            }
            
            // 卡片
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "卡片" : "Cards")
                    .font(.system(size: 18, weight: .semibold))
                
                HStack(spacing: 16) {
                    CardView(
                        title: language == "zh" ? "卡片标题" : "Card Title",
                        content: language == "zh" ? "这是卡片内容示例" : "This is card content example"
                    )
                    .frame(width: 200)
                }
            }
        }
    }
}

// 卡片组件
struct CardView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
            Text(content)
                .font(.system(size: 12))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
        }
        .padding(16)
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}

// 按钮样式
struct NewPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(red: 59/255, green: 130/255, blue: 246/255))
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct NewOutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Color(red: 59/255, green: 130/255, blue: 246/255))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(red: 59/255, green: 130/255, blue: 246/255), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct NewTextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Color(red: 59/255, green: 130/255, blue: 246/255))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(configuration.isPressed ? Color.blue.opacity(0.05) : Color.clear)
            .cornerRadius(6)
    }
}