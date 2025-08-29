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
                ScrollViewReader { proxy in
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
                                    Button(action: { 
                                        selectedSection = item.0
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            proxy.scrollTo(item.0, anchor: .top)
                                        }
                                    }) {
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
                                    .id("colors")
                            case "typography":
                                TypographySystemView(language: language, config: config)
                                    .id("typography")
                            case "hierarchy":
                                HierarchySystemView(language: language, config: config)
                                    .id("hierarchy")
                            case "spacing":
                                SpacingSystemView(language: language, config: config)
                                    .id("spacing")
                            case "radius":
                                RadiusSystemView(language: language, config: config)
                                    .id("radius")
                            case "shadow":
                                ShadowSystemView(language: language, config: config)
                                    .id("shadow")
                            case "accessibility":
                                AccessibilitySystemView(language: language, config: config)
                                    .id("accessibility")
                            case "components":
                                ComponentsSystemView(language: language, config: config)
                                    .id("components")
                            default:
                                CompleteColorSystemView(language: language, config: config)
                                    .id("colors")
                            }
                        }
                        .padding(.horizontal, 48)
                        .padding(.bottom, 100)
                    }
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

// TypographySystemView is now imported from TypographySystem.swift

// SpacingSystemView is now imported from SpacingSystem.swift

// RadiusSystemView is now imported from RadiusSystem.swift

// ShadowSystemView is now imported from ShadowSystem.swift

// HierarchySystemView is now imported from HierarchySystem.swift

// AccessibilitySystemView is now imported from AccessibilitySystem.swift

// ComponentsSystemView is now imported from ComponentsSystem.swift