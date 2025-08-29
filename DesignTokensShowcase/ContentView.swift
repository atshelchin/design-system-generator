//
//  ContentView.swift
//  DesignTokensShowcase
//
//  100% visual replication of showcase.html in SwiftUI
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var config = DesignTokensConfig.shared
    @State private var selectedSection = "colors"
    @State private var language = "zh"
    @State private var controlsExpanded = true
    
    var body: some View {
        ZStack {
            // Background
            Color(config.isDarkMode ? NSColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1) : NSColor.white)
                .ignoresSafeArea()
            
            // Main content with exact HTML structure
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Header section
                    VStack(alignment: .leading, spacing: 12) {
                        Text(language == "zh" ? "跨平台设计系统" : "Cross-Platform Design System")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(Color(config.isDarkMode ? .white : .black))
                        
                        Text(language == "zh" ? "100% SwiftUI 兼容的设计令牌，支持实时自定义" : "100% SwiftUI Compatible Design Tokens with Real-time Customization")
                            .font(.system(size: 20))
                            .foregroundColor(Color(config.isDarkMode ? NSColor(white: 0.7, alpha: 1) : NSColor(white: 0.3, alpha: 1)))
                    }
                    .padding(.horizontal, 48)
                    .padding(.top, 64)
                    .padding(.bottom, 32)
                    
                    // Navigation tabs
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 4) {
                            NavigationButton(title: language == "zh" ? "色彩系统" : "Colors", id: "colors", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "文字系统" : "Typography", id: "typography", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "层级系统" : "Hierarchy", id: "hierarchy", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "间距系统" : "Spacing", id: "spacing", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "圆角系统" : "Radius", id: "radius", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "阴影系统" : "Shadow", id: "shadow", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "无障碍" : "Accessibility", id: "accessibility", selected: $selectedSection)
                            NavigationButton(title: language == "zh" ? "组件示例" : "Components", id: "components", selected: $selectedSection)
                        }
                        .padding(.horizontal, 48)
                    }
                    .padding(.bottom, 32)
                    
                    // Content sections
                    Group {
                        switch selectedSection {
                        case "colors":
                            CompleteColorSection(language: language, config: config)
                        case "typography":
                            CompleteTypographySection(language: language, config: config)
                        case "hierarchy":
                            CompleteHierarchySection(language: language, config: config)
                        case "spacing":
                            SpacingSection(language: language, config: config)
                        case "radius":
                            CompleteRadiusSection(language: language, config: config)
                        case "shadow":
                            ShadowSection(language: language, config: config)
                        case "accessibility":
                            AccessibilitySection(language: language, config: config)
                        case "components":
                            CompleteComponentsSection(language: language, config: config)
                        default:
                            CompleteColorSection(language: language, config: config)
                        }
                    }
                    .padding(.horizontal, 48)
                    .padding(.bottom, 100)
                }
            }
            
            // Floating control panel (exact HTML replication)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingControlPanel(config: config, controlsExpanded: $controlsExpanded, language: $language)
                        .padding(32)
                }
            }
        }
        .frame(minWidth: 1200, minHeight: 800)
        .preferredColorScheme(config.isDarkMode ? .dark : .light)
    }
}

// Navigation button matching HTML
struct NavigationButton: View {
    let title: String
    let id: String
    @Binding var selected: String
    
    var body: some View {
        Button(action: { selected = id }) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(selected == id ? .white : Color(NSColor.labelColor))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(selected == id ? Color(red: 37/255, green: 99/255, blue: 235/255) : Color.clear)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// COMPLETE Color Section with ALL subsections
struct CompleteColorSection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Section header
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "1. 色彩系统" : "1. Color System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "品牌色、中性色和语义色" : "Brand, neutral, and semantic colors")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // Brand Colors
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "品牌色" : "Brand Colors")
                    .font(.system(size: 20, weight: .semibold))
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 6), spacing: 12) {
                    ForEach([50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950], id: \.self) { shade in
                        ColorSwatch(name: "brand-\(shade)", color: DesignTokens.Colors.brandColor(for: shade))
                    }
                }
            }
            
            // Neutral Colors
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "中性色" : "Neutral Colors")
                    .font(.system(size: 20, weight: .semibold))
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 6), spacing: 12) {
                    ForEach([50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950], id: \.self) { shade in
                        ColorSwatch(name: "gray-\(shade)", color: DesignTokens.Colors.grayColor(for: shade))
                    }
                }
            }
            
            // Semantic Colors
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "语义色" : "Semantic Colors")
                    .font(.system(size: 20, weight: .semibold))
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                    SemanticColorItem(name: "Primary", varName: "--color-primary", color: DesignTokens.Colors.primary)
                    SemanticColorItem(name: "Secondary", varName: "--color-secondary", color: DesignTokens.Colors.secondary)
                    SemanticColorItem(name: "Muted", varName: "--color-muted", color: DesignTokens.Colors.muted)
                    SemanticColorItem(name: "Accent", varName: "--color-accent", color: DesignTokens.Colors.accent)
                    SemanticColorItem(name: "Success", varName: "--color-success", color: DesignTokens.Colors.success)
                    SemanticColorItem(name: "Warning", varName: "--color-warning", color: DesignTokens.Colors.warning)
                    SemanticColorItem(name: "Error", varName: "--color-error", color: DesignTokens.Colors.error)
                    SemanticColorItem(name: "Info", varName: "--color-info", color: DesignTokens.Colors.info)
                }
            }
            
            // Functional Colors
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "功能色" : "Functional Colors")
                    .font(.system(size: 20, weight: .semibold))
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                    // Backgrounds
                    FunctionalColorGroup(
                        title: language == "zh" ? "背景" : "Backgrounds",
                        items: [
                            (language == "zh" ? "页面背景" : "Page Background", DesignTokens.Colors.background),
                            (language == "zh" ? "卡片背景" : "Card Background", DesignTokens.Colors.card),
                            (language == "zh" ? "弹出背景" : "Popover Background", DesignTokens.Colors.popover)
                        ]
                    )
                    
                    // Borders
                    FunctionalColorGroup(
                        title: language == "zh" ? "边框" : "Borders",
                        items: [
                            (language == "zh" ? "默认边框" : "Default Border", DesignTokens.Colors.border),
                            (language == "zh" ? "输入框边框" : "Input Border", DesignTokens.Colors.input),
                            (language == "zh" ? "圆环边框" : "Ring Border", DesignTokens.Colors.ring)
                        ]
                    )
                    
                    // Text
                    FunctionalColorGroup(
                        title: language == "zh" ? "文本" : "Text",
                        items: [
                            (language == "zh" ? "前景文本" : "Foreground", DesignTokens.Colors.foreground),
                            (language == "zh" ? "弱化文本" : "Muted Text", DesignTokens.Colors.mutedForeground),
                            (language == "zh" ? "卡片文本" : "Card Text", DesignTokens.Colors.cardForeground)
                        ]
                    )
                }
            }
        }
    }
}

// Color swatch component
struct ColorSwatch: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(NSColor.separatorColor), lineWidth: 1)
                )
            
            Text(name)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
        }
    }
}

// Semantic color item
struct SemanticColorItem: View {
    let name: String
    let varName: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(NSColor.separatorColor), lineWidth: 1)
                )
            
            Text(name)
                .font(.system(size: 14, weight: .medium))
            
            Text(varName)
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
        }
    }
}

// Functional color group
struct FunctionalColorGroup: View {
    let title: String
    let items: [(String, Color)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
            
            VStack(spacing: 8) {
                ForEach(items, id: \.0) { item in
                    HStack {
                        Text(item.0)
                            .font(.system(size: 13))
                        Spacer()
                    }
                    .padding(12)
                    .background(item.1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color(NSColor.separatorColor), lineWidth: 1)
                    )
                    .cornerRadius(6)
                }
            }
        }
    }
}

// COMPLETE Typography Section
struct CompleteTypographySection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Section header
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "2. 文字系统" : "2. Typography System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "字体大小、字重、字间距和行高" : "Font sizes, weights, letter spacing, and line height")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // Font Families
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字体族" : "Font Families")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("The quick brown fox jumps over the lazy dog")
                            .font(.system(size: 16))
                        Text("敏捷的棕色狐狸跳过懒狗")
                            .font(.system(size: 16))
                        Text("--font-family-sans")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("const code = 'Hello World';")
                            .font(.system(size: 16, design: .monospaced))
                        Text("console.log(code);")
                            .font(.system(size: 16, design: .monospaced))
                        Text("--font-family-mono")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                }
                .padding(16)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(8)
            }
            
            // Font Sizes
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字体大小" : "Font Sizes")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 12) {
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
                        ("text-6xl", 60, "3.75rem")
                    ], id: \.0) { item in
                        HStack(alignment: .center, spacing: 16) {
                            Text(language == "zh" ? "示例文本" : "Sample Text")
                                .font(.system(size: CGFloat(item.1) * config.fontScale))
                                .frame(width: 200, alignment: .leading)
                            
                            Text(item.0)
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(Color(NSColor.secondaryLabelColor))
                                .frame(width: 80)
                            
                            Text(item.2)
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
            
            // Font Weights
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "字重" : "Font Weights")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 24) {
                    ForEach([
                        ("Thin", Font.Weight.thin, "100"),
                        ("Light", Font.Weight.light, "300"),
                        ("Regular", Font.Weight.regular, "400"),
                        ("Medium", Font.Weight.medium, "500"),
                        ("Semibold", Font.Weight.semibold, "600"),
                        ("Bold", Font.Weight.bold, "700"),
                        ("Black", Font.Weight.black, "900")
                    ], id: \.0) { item in
                        VStack(spacing: 8) {
                            Text("Aa")
                                .font(.system(size: 32, weight: item.1))
                            Text(item.0)
                                .font(.system(size: 12))
                            Text(item.2)
                                .font(.system(size: 10, design: .monospaced))
                                .foregroundColor(Color(NSColor.tertiaryLabelColor))
                        }
                    }
                }
            }
        }
    }
}

// COMPLETE Hierarchy Section with ALL 5 categories
struct CompleteHierarchySection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Section header
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "3. 层级系统" : "3. Hierarchy System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "完整的层级系统，包含9大类别" : "Complete hierarchy system with 9 categories")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // 1. Heading Hierarchy
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "1. 标题层级" : "1. Heading Hierarchy")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 32) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(language == "zh" ? "基础标题" : "Basic Headings")
                            .font(.system(size: 14, weight: .medium))
                            .padding(.bottom, 8)
                        
                        Text(language == "zh" ? "一级标题 H1" : "Heading Level 1")
                            .font(.system(size: 48, weight: .bold))
                        Text(language == "zh" ? "二级标题 H2" : "Heading Level 2")
                            .font(.system(size: 36, weight: .bold))
                        Text(language == "zh" ? "三级标题 H3" : "Heading Level 3")
                            .font(.system(size: 30, weight: .semibold))
                        Text(language == "zh" ? "四级标题 H4" : "Heading Level 4")
                            .font(.system(size: 24, weight: .semibold))
                        Text(language == "zh" ? "五级标题 H5" : "Heading Level 5")
                            .font(.system(size: 20, weight: .medium))
                        Text(language == "zh" ? "六级标题 H6" : "Heading Level 6")
                            .font(.system(size: 16, weight: .medium))
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(language == "zh" ? "语义化标题" : "Semantic Headings")
                            .font(.system(size: 14, weight: .medium))
                            .padding(.bottom, 8)
                        
                        Text("Primary " + (language == "zh" ? "主要标题" : "Heading"))
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.primary)
                        Text("Muted " + (language == "zh" ? "弱化标题" : "Heading"))
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                        Text("Success " + (language == "zh" ? "成功标题" : "Heading"))
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.success)
                        Text("Danger " + (language == "zh" ? "危险标题" : "Heading"))
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.error)
                    }
                }
            }
            
            // 2. Description Hierarchy
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "2. 描述层级" : "2. Description Hierarchy")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(language == "zh" ? "主要描述文本，用于重要信息展示" : "Primary description text for important information")
                        .font(.system(size: 16))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    Text(language == "zh" ? "次要描述文本，用于补充说明" : "Secondary description text for supplementary information")
                        .font(.system(size: 14))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Text(language == "zh" ? "辅助描述文本，用于额外信息" : "Auxiliary description text for additional information")
                        .font(.system(size: 12))
                        .foregroundColor(Color(NSColor.tertiaryLabelColor))
                }
            }
            
            // 3. Panel Hierarchy
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "3. 面板层级" : "3. Panel Hierarchy")
                    .font(.system(size: 20, weight: .semibold))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(DesignTokens.Colors.background)
                        .frame(height: 200)
                        .shadow(radius: 0)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(DesignTokens.Colors.card)
                        .frame(height: 160)
                        .shadow(radius: 2)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(DesignTokens.Colors.popover)
                        .frame(height: 120)
                        .shadow(radius: 8)
                    
                    VStack(spacing: 8) {
                        Text(language == "zh" ? "弹出层" : "Popover")
                            .font(.system(size: 14, weight: .medium))
                        Text(language == "zh" ? "卡片层" : "Card")
                            .font(.system(size: 12))
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                        Text(language == "zh" ? "背景层" : "Background")
                            .font(.system(size: 10))
                            .foregroundColor(Color(NSColor.tertiaryLabelColor))
                    }
                }
                .frame(height: 200)
            }
            
            // 4. Visual Hierarchy
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "4. 视觉层级" : "4. Visual Hierarchy")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 16) {
                    ForEach([
                        (language == "zh" ? "强调" : "Emphasis", DesignTokens.Colors.primary, true),
                        (language == "zh" ? "默认" : "Default", DesignTokens.Colors.foreground, false),
                        (language == "zh" ? "弱化" : "Muted", DesignTokens.Colors.mutedForeground, false)
                    ], id: \.0) { item in
                        VStack(spacing: 8) {
                            Circle()
                                .fill(item.2 ? item.1 : Color.clear)
                                .overlay(Circle().stroke(item.1, lineWidth: 2))
                                .frame(width: 60, height: 60)
                            Text(item.0)
                                .font(.system(size: 14))
                                .foregroundColor(item.1)
                        }
                    }
                }
            }
            
            // 5. Information Hierarchy
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "5. 信息层级" : "5. Information Hierarchy")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(DesignTokens.Colors.error)
                        Text(language == "zh" ? "紧急信息 - 需要立即关注" : "Urgent - Requires immediate attention")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(DesignTokens.Colors.warning)
                        Text(language == "zh" ? "重要信息 - 需要注意" : "Important - Needs attention")
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(DesignTokens.Colors.info)
                        Text(language == "zh" ? "一般信息 - 供参考" : "General - For reference")
                            .font(.system(size: 14))
                    }
                    
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(DesignTokens.Colors.success)
                        Text(language == "zh" ? "成功信息 - 操作完成" : "Success - Operation completed")
                            .font(.system(size: 14))
                    }
                }
            }
        }
    }
}

// COMPLETE Radius Section with proper full radius
struct CompleteRadiusSection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // Section header
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "5. 圆角系统" : "5. Radius System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "统一的圆角规范" : "Unified radius specifications")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // Radius examples
            let radiusItems = [
                ("none", 0.0),
                ("sm", 4.0),
                ("base", 6.0),
                ("md", 8.0),
                ("lg", 12.0),
                ("xl", 16.0),
                ("2xl", 24.0),
                ("full", 9999.0)
            ]
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 24) {
                ForEach(radiusItems, id: \.0) { item in
                    VStack(spacing: 12) {
                        if item.0 == "full" {
                            // Full radius should be circular
                            Circle()
                                .fill(DesignTokens.Colors.primary.opacity(0.1))
                                .overlay(Circle().stroke(DesignTokens.Colors.primary, lineWidth: 2))
                                .frame(width: 80, height: 80)
                        } else {
                            RoundedRectangle(cornerRadius: item.1 * config.radiusScale)
                                .fill(DesignTokens.Colors.primary.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: item.1 * config.radiusScale)
                                        .stroke(DesignTokens.Colors.primary, lineWidth: 2)
                                )
                                .frame(width: 80, height: 80)
                        }
                        
                        Text(item.0)
                            .font(.system(size: 14, weight: .medium))
                        
                        Text(item.0 == "full" ? "9999px" : "\(Int(item.1))px")
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                }
            }
        }
    }
}

// Other sections (Spacing, Shadow, Accessibility)
struct SpacingSection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "4. 间距系统" : "4. Spacing System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "统一的间距规范" : "Unified spacing specifications")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            VStack(alignment: .leading, spacing: 16) {
                let spacingItems = [
                    ("space-0", 0.0),
                    ("space-0.5", 2.0),
                    ("space-1", 4.0),
                    ("space-2", 8.0),
                    ("space-3", 12.0),
                    ("space-4", 16.0),
                    ("space-5", 20.0),
                    ("space-6", 24.0),
                    ("space-8", 32.0),
                    ("space-10", 40.0),
                    ("space-12", 48.0),
                    ("space-16", 64.0),
                    ("space-20", 80.0),
                    ("space-24", 96.0)
                ]
                
                ForEach(spacingItems, id: \.0) { item in
                    HStack(spacing: 16) {
                        Rectangle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: item.1 * config.spacingScale, height: 24)
                        
                        Text(item.0)
                            .font(.system(size: 12, design: .monospaced))
                            .frame(width: 80, alignment: .leading)
                        
                        Text("\(Int(item.1))px")
                            .font(.system(size: 12))
                            .foregroundColor(Color(NSColor.secondaryLabelColor))
                    }
                }
            }
        }
    }
}

struct ShadowSection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "6. 阴影系统" : "6. Shadow System")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "多层次的阴影效果" : "Multi-level shadow effects")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 24), count: 3), spacing: 24) {
                ForEach([
                    ("shadow-sm", 2.0),
                    ("shadow-base", 4.0),
                    ("shadow-md", 6.0),
                    ("shadow-lg", 10.0),
                    ("shadow-xl", 15.0),
                    ("shadow-2xl", 25.0)
                ], id: \.0) { item in
                    VStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: 120, height: 80)
                            .shadow(color: Color.black.opacity(0.1), radius: item.1, y: item.1 / 2)
                        
                        Text(item.0)
                            .font(.system(size: 12, design: .monospaced))
                    }
                }
            }
        }
    }
}

struct AccessibilitySection: View {
    let language: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "7. 无障碍" : "7. Accessibility")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "确保设计对所有用户友好" : "Ensuring design is friendly to all users")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            VStack(alignment: .leading, spacing: 24) {
                // Contrast examples
                VStack(alignment: .leading, spacing: 16) {
                    Text(language == "zh" ? "对比度示例" : "Contrast Examples")
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack(spacing: 24) {
                        ContrastExample(
                            title: "AA " + (language == "zh" ? "标准" : "Standard"),
                            foreground: Color(white: 0.3),
                            background: Color.white,
                            ratio: "4.5:1"
                        )
                        
                        ContrastExample(
                            title: "AAA " + (language == "zh" ? "增强" : "Enhanced"),
                            foreground: Color.black,
                            background: Color.white,
                            ratio: "21:1"
                        )
                    }
                }
                
                // Focus indicators
                VStack(alignment: .leading, spacing: 16) {
                    Text(language == "zh" ? "焦点指示器" : "Focus Indicators")
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack(spacing: 16) {
                        Button(language == "zh" ? "默认按钮" : "Default Button") {}
                            .buttonStyle(.borderedProminent)
                        
                        Button(language == "zh" ? "次要按钮" : "Secondary Button") {}
                            .buttonStyle(.bordered)
                    }
                }
            }
        }
    }
}

struct ContrastExample: View {
    let title: String
    let foreground: Color
    let background: Color
    let ratio: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(background)
                    .frame(width: 150, height: 60)
                
                Text("Sample Text")
                    .foregroundColor(foreground)
                    .font(.system(size: 16))
            }
            
            Text(title)
                .font(.system(size: 14, weight: .medium))
            
            Text(ratio)
                .font(.system(size: 12, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
        }
    }
}

// COMPLETE Components Section
struct CompleteComponentsSection: View {
    let language: String
    let config: DesignTokensConfig
    @State private var sliderValue: Double = 50
    @State private var switchOn: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text(language == "zh" ? "8. 组件示例" : "8. Component Examples")
                    .font(.system(size: 32, weight: .bold))
                
                Text(language == "zh" ? "常用UI组件展示" : "Common UI component showcase")
                    .font(.system(size: 16))
                    .foregroundColor(Color(NSColor.secondaryLabelColor))
            }
            
            // Buttons
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "按钮" : "Buttons")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 16) {
                    Button(language == "zh" ? "主要按钮" : "Primary") {}
                        .buttonStyle(PrimaryButtonStyle())
                    
                    Button(language == "zh" ? "次要按钮" : "Secondary") {}
                        .buttonStyle(SecondaryButtonStyle())
                    
                    Button(language == "zh" ? "幽灵按钮" : "Ghost") {}
                        .buttonStyle(GhostButtonStyle())
                    
                    Button(language == "zh" ? "危险按钮" : "Danger") {}
                        .buttonStyle(DangerButtonStyle())
                }
            }
            
            // Cards
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "卡片" : "Cards")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 16) {
                    CardExample(
                        title: language == "zh" ? "基础卡片" : "Basic Card",
                        description: language == "zh" ? "这是一个基础卡片示例" : "This is a basic card example"
                    )
                    
                    CardExample(
                        title: language == "zh" ? "交互卡片" : "Interactive Card",
                        description: language == "zh" ? "带有悬停效果的卡片" : "Card with hover effect"
                    )
                }
            }
            
            // Form Controls
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "表单控件" : "Form Controls")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(alignment: .leading, spacing: 12) {
                    // Slider
                    HStack {
                        Text(language == "zh" ? "滑块" : "Slider")
                            .frame(width: 100, alignment: .leading)
                        Slider(value: $sliderValue, in: 0...100)
                            .frame(width: 200)
                        Text("\(Int(sliderValue))")
                            .frame(width: 40)
                            .font(.system(size: 14, design: .monospaced))
                    }
                    
                    // Switch
                    HStack {
                        Text(language == "zh" ? "开关" : "Switch")
                            .frame(width: 100, alignment: .leading)
                        Toggle("", isOn: $switchOn)
                            .toggleStyle(.switch)
                            .labelsHidden()
                    }
                }
            }
            
            // Badges
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "徽章" : "Badges")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 12) {
                    Badge(text: language == "zh" ? "新" : "New", color: DesignTokens.Colors.info)
                    Badge(text: language == "zh" ? "热门" : "Hot", color: DesignTokens.Colors.error)
                    Badge(text: language == "zh" ? "推荐" : "Featured", color: DesignTokens.Colors.warning)
                    Badge(text: language == "zh" ? "完成" : "Done", color: DesignTokens.Colors.success)
                }
            }
            
            // Progress
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "进度条" : "Progress")
                    .font(.system(size: 20, weight: .semibold))
                
                VStack(spacing: 12) {
                    ProgressBar(value: 0.7, label: "70%")
                    ProgressBar(value: 0.3, label: "30%", color: DesignTokens.Colors.warning)
                }
            }
            
            // Tabs
            VStack(alignment: .leading, spacing: 16) {
                Text(language == "zh" ? "标签页" : "Tabs")
                    .font(.system(size: 20, weight: .semibold))
                
                HStack(spacing: 4) {
                    ForEach(0..<3) { index in
                        Button(action: { selectedTab = index }) {
                            Text(language == "zh" ? "标签 \(index + 1)" : "Tab \(index + 1)")
                                .font(.system(size: 14, weight: selectedTab == index ? .medium : .regular))
                                .foregroundColor(selectedTab == index ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(
                                    VStack(spacing: 0) {
                                        Spacer()
                                        if selectedTab == index {
                                            Rectangle()
                                                .fill(DesignTokens.Colors.primary)
                                                .frame(height: 2)
                                        }
                                    }
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

// Component helper views
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(DesignTokens.Colors.primary)
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(NSColor.controlBackgroundColor))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct GhostButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(configuration.isPressed ? Color(NSColor.controlBackgroundColor) : Color.clear)
            .cornerRadius(6)
    }
}

struct DangerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(DesignTokens.Colors.error)
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct CardExample: View {
    let title: String
    let description: String
    @State private var isHovered = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            Text(description)
                .font(.system(size: 14))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(16)
        .frame(width: 200)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .shadow(radius: isHovered ? 4 : 2)
        .scaleEffect(isHovered ? 1.02 : 1)
        .onHover { hovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                isHovered = hovering
            }
        }
    }
}

struct Badge: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color)
            .cornerRadius(9999)
    }
}

struct ProgressBar: View {
    let value: Double
    let label: String
    var color: Color = DesignTokens.Colors.primary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .font(.system(size: 12))
                Spacer()
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 9999)
                        .fill(Color(NSColor.controlBackgroundColor))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 9999)
                        .fill(color)
                        .frame(width: geometry.size.width * value, height: 8)
                }
            }
            .frame(height: 8)
        }
    }
}

// Removed - using FloatingPanel.swift instead
/*
struct FloatingControlBubble: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    @Binding var language: String
    @State private var selectedFont: String = "system"
    @State private var fontSize: String = "A"
    @State private var contrast: String = "标准"
    @State private var letterSpacing: String = "标准"
    @State private var lineHeight: String = "标准"
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with exact HTML styling
            HStack {
                Text(language == "zh" ? "设计系统控制" : "Design System Controls")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                Spacer()
                
                Button(action: { withAnimation(.easeInOut(duration: 0.3)) { controlsExpanded.toggle() } }) {
                    Image(systemName: controlsExpanded ? "chevron.down" : "chevron.up")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                        .rotationEffect(.degrees(controlsExpanded ? 0 : 180))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.clear)
            .overlay(
                Rectangle()
                    .fill(DesignTokens.Colors.border)
                    .frame(height: 1),
                alignment: .bottom
            )
            
            if controlsExpanded {
                ScrollView {
                    VStack(spacing: 0) {
                        // Main controls section
                        VStack(spacing: 12) {
                            // Brand Hue
                            HStack(spacing: 12) {
                                HStack(spacing: 6) {
                                    Text("🎯")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "色调微调" : "Fine Tune")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                CustomSlider(value: $config.brandHue, in: 0...360)
                                    .frame(width: 140, height: 6)
                                
                                Text("\(Int(config.brandHue))°")
                                    .font(.system(size: 12, design: .monospaced))
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .frame(width: 40, alignment: .trailing)
                            }
                            
                            // Saturation
                            HStack(spacing: 12) {
                                HStack(spacing: 6) {
                                    Text("💧")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "饱和度" : "Saturation")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                CustomSlider(value: $config.brandSaturation, in: 0...100)
                                    .frame(width: 140, height: 6)
                                
                                Text("\(Int(config.brandSaturation))%")
                                    .font(.system(size: 12, design: .monospaced))
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .frame(width: 40, alignment: .trailing)
                            }
                            
                            // Radius
                            HStack(spacing: 12) {
                                HStack(spacing: 6) {
                                    Text("⚪")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "圆角" : "Radius")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                CustomSlider(value: $config.radiusScale, in: 0...3)
                                    .frame(width: 140, height: 6)
                                
                                Text(String(format: "%.1fx", config.radiusScale))
                                    .font(.system(size: 12, design: .monospaced))
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .frame(width: 40, alignment: .trailing)
                            }
                            
                            // Spacing
                            HStack(spacing: 12) {
                                HStack(spacing: 6) {
                                    Text("↔️")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "间距" : "Spacing")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                CustomSlider(value: $config.spacingScale, in: 0.5...2)
                                    .frame(width: 140, height: 6)
                                
                                Text(String(format: "%.1fx", config.spacingScale))
                                    .font(.system(size: 12, design: .monospaced))
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    .frame(width: 40, alignment: .trailing)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Divider
                        Rectangle()
                            .fill(DesignTokens.Colors.border)
                            .frame(height: 1)
                            .padding(.horizontal, 16)
                        
                        // Font Size button group
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("🔤")
                                    .font(.system(size: 16))
                                Text(language == "zh" ? "字体大小" : "Font Size")
                                    .font(.system(size: 13))
                                    .foregroundColor(DesignTokens.Colors.foreground)
                            }
                            
                            HStack(spacing: 4) {
                                ControlButton(text: "A-", value: "small", current: $fontSize) {
                                    config.fontScale = 0.9
                                }
                                ControlButton(text: "A", value: "normal", current: $fontSize) {
                                    config.fontScale = 1.0
                                }
                                ControlButton(text: "A+", value: "large", current: $fontSize) {
                                    config.fontScale = 1.2
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Contrast button group
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("🔲")
                                    .font(.system(size: 16))
                                Text(language == "zh" ? "对比度" : "Contrast")
                                    .font(.system(size: 13))
                                    .foregroundColor(DesignTokens.Colors.foreground)
                            }
                            
                            HStack(spacing: 4) {
                                ControlButton(text: language == "zh" ? "标准" : "Normal", value: "normal", current: $contrast) {
                                    // Normal contrast
                                }
                                ControlButton(text: language == "zh" ? "高" : "High", value: "high", current: $contrast) {
                                    // High contrast
                                }
                                ControlButton(text: language == "zh" ? "超高" : "Ultra", value: "ultra", current: $contrast) {
                                    // Ultra contrast
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Letter Spacing button group
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("↔️")
                                    .font(.system(size: 16))
                                Text(language == "zh" ? "文字间距" : "Letter Spacing")
                                    .font(.system(size: 13))
                                    .foregroundColor(DesignTokens.Colors.foreground)
                            }
                            
                            HStack(spacing: 4) {
                                ControlButton(text: language == "zh" ? "标准" : "Normal", value: "normal", current: $letterSpacing) {}
                                ControlButton(text: language == "zh" ? "宽松" : "Wide", value: "wide", current: $letterSpacing) {}
                                ControlButton(text: language == "zh" ? "更宽" : "Wider", value: "wider", current: $letterSpacing) {}
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Line Height button group
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("📏")
                                    .font(.system(size: 16))
                                Text(language == "zh" ? "行高" : "Line Height")
                                    .font(.system(size: 13))
                                    .foregroundColor(DesignTokens.Colors.foreground)
                            }
                            
                            HStack(spacing: 4) {
                                ControlButton(text: language == "zh" ? "标准" : "Normal", value: "normal", current: $lineHeight) {}
                                ControlButton(text: language == "zh" ? "舒适" : "Relaxed", value: "relaxed", current: $lineHeight) {}
                                ControlButton(text: language == "zh" ? "宽松" : "Loose", value: "loose", current: $lineHeight) {}
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Divider
                        Rectangle()
                            .fill(DesignTokens.Colors.border)
                            .frame(height: 1)
                            .padding(.horizontal, 16)
                        
                        // Theme and Language controls
                        VStack(spacing: 12) {
                            // Theme toggle
                            HStack {
                                HStack(spacing: 6) {
                                    Text("🌓")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "主题" : "Theme")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                
                                Spacer()
                                
                                Toggle("", isOn: $config.isDarkMode)
                                    .toggleStyle(.switch)
                                    .scaleEffect(0.8)
                                    .labelsHidden()
                            }
                            
                            // Language toggle
                            HStack {
                                HStack(spacing: 6) {
                                    Text("🌐")
                                        .font(.system(size: 16))
                                    Text(language == "zh" ? "语言" : "Language")
                                        .font(.system(size: 13))
                                        .foregroundColor(DesignTokens.Colors.foreground)
                                }
                                
                                Spacer()
                                
                                Picker("", selection: $language) {
                                    Text("中文").tag("zh")
                                    Text("EN").tag("en")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 80)
                                .scaleEffect(0.9)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                }
                .frame(maxHeight: 400)
            }
        }
        .frame(width: 320)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(config.isDarkMode ? 
                    Color(NSColor(white: 0.117, alpha: 0.95)) : 
                    Color(NSColor(white: 1, alpha: 0.95))
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(config.isDarkMode ? 
                    Color(white: 1, opacity: 0.1) : 
                    DesignTokens.Colors.border, 
                    lineWidth: 1
                )
        )
        .shadow(color: Color.black.opacity(0.1), radius: 40, x: 0, y: 10)
        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 2)
        .scaleEffect(1.0)
        .onHover { hovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                // Hover effect
            }
        }
    }
}

// Custom Slider matching HTML exactly
struct CustomSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    
    init(value: Binding<Double>, in range: ClosedRange<Double>) {
        self._value = value
        self.range = range
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Track
                RoundedRectangle(cornerRadius: 3)
                    .fill(DesignTokensConfig.shared.isDarkMode ? 
                        Color(NSColor(white: 0.3, alpha: 1)) : 
                        Color(NSColor(white: 0.878, alpha: 1))
                    )
                
                // Fill
                RoundedRectangle(cornerRadius: 3)
                    .fill(DesignTokens.Colors.primary.opacity(0.3))
                    .frame(width: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)))
                
                // Thumb
                Circle()
                    .fill(DesignTokens.Colors.primary)
                    .frame(width: 18, height: 18)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    .offset(x: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) - 9)
                    .gesture(
                        DragGesture()
                            .onChanged { drag in
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Double(drag.location.x / geometry.size.width)
                                value = min(max(newValue, range.lowerBound), range.upperBound)
                            }
                    )
            }
        }
    }
}

// Control Button matching HTML button-group
struct ControlButton: View {
    let text: String
    let value: String
    @Binding var current: String
    let action: () -> Void
    
    var isActive: Bool {
        current == value
    }
    
    var body: some View {
        Button(action: {
            current = value
            action()
        }) {
            Text(text)
                .font(.system(size: 12, weight: isActive ? .medium : .regular))
                .foregroundColor(isActive ? .white : DesignTokens.Colors.foreground)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(isActive ? DesignTokens.Colors.primary : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(isActive ? Color.clear : DesignTokens.Colors.border, lineWidth: 1)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
*/

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}