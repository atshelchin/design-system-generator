//
//  SinglePageShowcaseFixed.swift
//  固定导航栏的单页面展示，确保组件响应配置变化
//

import SwiftUI
import DesignTokensKit

struct SinglePageShowcaseView: View {
    @StateObject private var config = DesignTokensConfig.shared
    @State private var language = "zh"
    @State private var controlsExpanded = true
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // 背景
            DesignTokens.Colors.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 固定的顶部导航栏
                FixedNavigationBar(
                    language: $language,
                    config: config
                )
                .background(DesignTokens.Colors.background)
                .shadow(color: Color.black.opacity(0.1), radius: 2, y: 2)
                .zIndex(100) // 确保导航栏在最上层
                
                // 可滚动的内容区域
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        VStack(spacing: 80) {
                            // 顶部留白（导航栏占位）
                            Color.clear
                                .frame(height: 20)
                            
                            // 1. 色彩系统
                            SystemContentView(
                                id: "colors",
                                title: language == "zh" ? "1. 色彩系统" : "1. Color System",
                                config: config
                            ) {
                                CompleteColorSystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 2. 文字系统
                            SystemContentView(
                                id: "typography",
                                title: language == "zh" ? "2. 文字系统" : "2. Typography System",
                                config: config
                            ) {
                                TypographySystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 3. 层级系统
                            SystemContentView(
                                id: "hierarchy",
                                title: language == "zh" ? "3. 层级系统" : "3. Hierarchy System",
                                config: config
                            ) {
                                HierarchySystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 4. 间距系统
                            SystemContentView(
                                id: "spacing",
                                title: language == "zh" ? "4. 间距系统" : "4. Spacing System",
                                config: config
                            ) {
                                SpacingSystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 5. 圆角系统
                            SystemContentView(
                                id: "radius",
                                title: language == "zh" ? "5. 圆角系统" : "5. Radius System",
                                config: config
                            ) {
                                RadiusSystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 6. 阴影系统
                            SystemContentView(
                                id: "shadow",
                                title: language == "zh" ? "6. 阴影系统" : "6. Shadow System",
                                config: config
                            ) {
                                ShadowSystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 7. 无障碍系统
                            SystemContentView(
                                id: "accessibility",
                                title: language == "zh" ? "7. 无障碍系统" : "7. Accessibility System",
                                config: config
                            ) {
                                AccessibilitySystemView(language: language, config: config)
                            }
                            
                            Divider()
                            
                            // 8. 组件示例 - 使用响应式版本
                            SystemContentView(
                                id: "components",
                                title: language == "zh" ? "8. 组件示例" : "8. Component Examples",
                                config: config
                            ) {
                                // 确保组件响应配置变化
                                ComponentsAll42View(language: language, config: config)
                                    .id(config.fontScale)
                                    .id(config.spacingScale)
                                    .id(config.radiusScale)
                                    .id(config.isDarkMode)
                                    .id(config.brandHue)
                                    .id(config.brandSaturation)
                                    .id(config.lineHeight)
                                    .id(config.letterSpacing)
                                    .id(config.contrast)
                            }
                            
                            // 底部留白
                            Color.clear
                                .frame(height: 100)
                        }
                        .padding(.horizontal, 48)
                    }
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        scrollOffset = value
                    }
                    .coordinateSpace(name: "scroll")
                    .onAppear {
                        // 存储scrollProxy供导航使用
                        NavigationState.shared.scrollProxy = scrollProxy
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
                        isDarkMode: .init(
                            get: { config.isDarkMode },
                            set: { config.isDarkMode = $0 }
                        )
                    )
                    .frame(width: 320)
                    .padding(32)
                }
            }
        }
        .frame(minWidth: 1200, minHeight: 800)
        .preferredColorScheme(config.isDarkMode ? .dark : .light)
    }
}

// MARK: - 固定的顶部导航栏
struct FixedNavigationBar: View {
    @Binding var language: String
    @ObservedObject var config: DesignTokensConfig
    
    let sections: [(String, String, String)] = [
        ("colors", "色彩", "Colors"),
        ("typography", "文字", "Typography"),
        ("hierarchy", "层级", "Hierarchy"),
        ("spacing", "间距", "Spacing"),
        ("radius", "圆角", "Radius"),
        ("shadow", "阴影", "Shadow"),
        ("accessibility", "无障碍", "Accessibility"),
        ("components", "组件", "Components")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 顶部栏
            HStack {
                // Logo和标题
                HStack(spacing: 12) {
                    Image(systemName: "paintbrush.pointed.fill")
                        .font(.system(size: 24))
                        .foregroundColor(DesignTokens.Colors.primary)
                    
                    Text("Design Tokens Showcase")
                        .globalTextStyle(config, size: 20, weight: .bold)
                        .foregroundColor(DesignTokens.Colors.foreground)
                }
                
                Spacer()
                
                // 主题和语言切换
                HStack(spacing: 12) {
                    // 主题切换按钮
                    Button(action: { 
                        config.isDarkMode.toggle()
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: config.isDarkMode ? "moon.fill" : "sun.max.fill")
                                .font(.system(size: 14))
                            Text(config.isDarkMode ? "Dark" : "Light")
                                .globalTextStyle(config, size: 12, weight: .medium)
                        }
                        .foregroundColor(DesignTokens.Colors.foreground)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(DesignTokens.Colors.secondary)
                        .cornerRadius(6)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Divider()
                        .frame(height: 20)
                    
                    // 语言切换
                    HStack(spacing: 4) {
                        Button(action: { language = "zh" }) {
                            Text("中文")
                                .globalTextStyle(config, size: 12, weight: .medium)
                                .foregroundColor(language == "zh" ? .white : DesignTokens.Colors.foreground)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(language == "zh" ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: { language = "en" }) {
                            Text("English")
                                .globalTextStyle(config, size: 12, weight: .medium)
                                .foregroundColor(language == "en" ? .white : DesignTokens.Colors.foreground)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(language == "en" ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                                .cornerRadius(4)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal, 48)
            .padding(.vertical, 16)
            
            Divider()
            
            // 导航按钮栏
            HStack(spacing: 32) {
                ForEach(sections, id: \.0) { section in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            NavigationState.shared.scrollProxy?.scrollTo(section.0, anchor: .top)
                        }
                    }) {
                        Text(language == "zh" ? section.1 : section.2)
                            .globalTextStyle(config, size: 14, weight: .medium)
                            .foregroundColor(DesignTokens.Colors.primary)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .onHover { hovering in
                        if hovering {
                            NSCursor.pointingHand.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
                }
            }
            .padding(.horizontal, 48)
            .padding(.vertical, 12)
            .background(DesignTokens.Colors.card.opacity(0.95))
        }
    }
}

// MARK: - 系统内容视图
struct SystemContentView<Content: View>: View {
    let id: String
    let title: String
    @ObservedObject var config: DesignTokensConfig
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24 * config.spacingScale) {
            // 系统标题
            Text(title)
                .globalTextStyle(config, size: 28, weight: .bold)
                .padding(.bottom, 8)
            
            // 系统内容 - 包裹在面板中
            content
                .padding(32 * config.spacingScale)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(DesignTokens.Colors.card)
            .cornerRadius(12 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
        }
        .id(id)
    }
}

// MARK: - 导航状态管理
class NavigationState {
    static let shared = NavigationState()
    var scrollProxy: ScrollViewProxy?
}

// MARK: - ScrollOffset Preference Key
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}