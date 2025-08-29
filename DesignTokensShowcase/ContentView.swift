//
//  ContentView.swift
//  DesignTokensShowcase
//
//  100% implementation of showcase.html in SwiftUI with reactive updates
//

import SwiftUI
import Combine

struct ContentView: View {
    // Using the shared config for reactive updates
    @StateObject private var config = DesignTokensConfig.shared
    @State private var selectedCategory = "colors"
    @State private var language = "zh" // zh or en
    @State private var controlsExpanded = true
    
    var body: some View {
        ZStack {
            // Background color (reactive)
            DesignTokens.Colors.background
                .ignoresSafeArea()
            
            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
                    // Header (matching HTML)
                    HeaderView(language: $language)
                    
                    // Category Navigation (matching HTML)
                    CategoryNavigation(selectedCategory: $selectedCategory, language: language)
                    
                    // Content sections (100% matching HTML)
                    Group {
                        switch selectedCategory {
                        case "colors":
                            ColorSection(language: language)
                        case "typography":
                            TypographySection(language: language)
                        case "hierarchy":
                            HierarchySection(language: language)
                        case "spacing":
                            SpacingSection(language: language)
                        case "radius":
                            RadiusSection(language: language)
                        case "shadow":
                            ShadowSection(language: language)
                        case "accessibility":
                            AccessibilitySection(language: language)
                        case "components":
                            ComponentsSection(language: language)
                        default:
                            ColorSection(language: language)
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: selectedCategory)
                }
                .padding(DesignTokens.Spacing.space8)
            }
            
            // Floating controls (matching HTML floating-controls)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingControlPanel(config: config, controlsExpanded: $controlsExpanded)
                        .padding(DesignTokens.Spacing.space8)
                }
            }
        }
        .preferredColorScheme(config.isDarkMode ? .dark : .light)
    }
}

// MARK: - Header View (matching HTML header)
struct HeaderView: View {
    @Binding var language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space4) {
            Text(language == "zh" ? "跨平台设计系统" : "Cross-Platform Design System")
                .textStyle(size: DesignTokens.Typography.text4XL, weight: .bold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Text(language == "zh" ? "100% SwiftUI 兼容的设计令牌" : "100% SwiftUI Compatible Design Tokens")
                .textStyle(size: DesignTokens.Typography.textLG)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            // Theme and Language controls (matching HTML controls)
            HStack(spacing: DesignTokens.Spacing.space6) {
                // Theme control
                HStack(spacing: DesignTokens.Spacing.space2) {
                    Text(language == "zh" ? "主题" : "Theme")
                        .textStyle(size: DesignTokens.Typography.textSM)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Button(action: { DesignTokensConfig.shared.isDarkMode = false }) {
                        Text(language == "zh" ? "亮色" : "Light")
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1)
                            .background(!DesignTokensConfig.shared.isDarkMode ? DesignTokens.Colors.primary : Color.clear)
                            .foregroundColor(!DesignTokensConfig.shared.isDarkMode ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.foreground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { DesignTokensConfig.shared.isDarkMode = true }) {
                        Text(language == "zh" ? "暗色" : "Dark")
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1)
                            .background(DesignTokensConfig.shared.isDarkMode ? DesignTokens.Colors.primary : Color.clear)
                            .foregroundColor(DesignTokensConfig.shared.isDarkMode ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.foreground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                // Language control
                HStack(spacing: DesignTokens.Spacing.space2) {
                    Text(language == "zh" ? "语言" : "Language")
                        .textStyle(size: DesignTokens.Typography.textSM)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Button(action: { language = "zh" }) {
                        Text("中文")
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1)
                            .background(language == "zh" ? DesignTokens.Colors.primary : Color.clear)
                            .foregroundColor(language == "zh" ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.foreground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: { language = "en" }) {
                        Text("English")
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1)
                            .background(language == "en" ? DesignTokens.Colors.primary : Color.clear)
                            .foregroundColor(language == "en" ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.foreground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.top, DesignTokens.Spacing.space4)
        }
        .padding(.vertical, DesignTokens.Spacing.space6)
    }
}

// MARK: - Category Navigation (matching HTML category-nav)
struct CategoryNavigation: View {
    @Binding var selectedCategory: String
    let language: String
    
    let categories = [
        ("colors", "Colors", "色彩系统"),
        ("typography", "Typography", "文字系统"),
        ("hierarchy", "Hierarchy", "层级系统"),
        ("spacing", "Spacing", "间距系统"),
        ("radius", "Radius", "圆角系统"),
        ("shadow", "Shadow", "阴影系统"),
        ("accessibility", "Accessibility", "无障碍"),
        ("components", "Components", "组件示例")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignTokens.Spacing.space2) {
                ForEach(categories, id: \.0) { category in
                    Button(action: { selectedCategory = category.0 }) {
                        Text(language == "zh" ? category.2 : category.1)
                            .textStyle(size: DesignTokens.Typography.textSM, weight: .medium)
                            .padding(.horizontal, DesignTokens.Spacing.space4)
                            .padding(.vertical, DesignTokens.Spacing.space2)
                            .background(selectedCategory == category.0 ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                            .foregroundColor(selectedCategory == category.0 ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.secondaryForeground)
                            .tokenRadius(DesignTokens.Radius.md)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.vertical, DesignTokens.Spacing.space2)
    }
}

// MARK: - Color Section (100% matching HTML colors section)
struct ColorSection: View {
    let language: String
    @ObservedObject private var config = DesignTokensConfig.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "1. 色彩系统" : "1. Color System",
                subtitle: language == "zh" ? "品牌色、中性色和语义色" : "Brand, neutral, and semantic colors"
            )
            
            // Brand Colors (matching HTML)
            Text(language == "zh" ? "品牌色" : "Brand Colors")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                ForEach(0..<10) { i in
                    let colorName = "brand-\(i)00"
                    let color = getBrandColor(index: i)
                    ColorCard(name: colorName, color: color)
                }
            }
            
            // Neutral Colors (matching HTML)
            Text(language == "zh" ? "中性色" : "Neutral Colors")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(.top, DesignTokens.Spacing.space6)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                ForEach(0..<10) { i in
                    let colorName = "gray-\(i)00"
                    let color = getGrayColor(index: i)
                    ColorCard(name: colorName, color: color)
                }
            }
            
            // Semantic Colors (matching HTML)
            Text(language == "zh" ? "语义色" : "Semantic Colors")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(.top, DesignTokens.Spacing.space6)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: DesignTokens.Spacing.space4) {
                ColorCard(name: "primary", color: DesignTokens.Colors.primary)
                ColorCard(name: "secondary", color: DesignTokens.Colors.secondary)
                ColorCard(name: "success", color: DesignTokens.Colors.success)
                ColorCard(name: "danger", color: DesignTokens.Colors.danger)
                ColorCard(name: "warning", color: DesignTokens.Colors.warning)
                ColorCard(name: "info", color: DesignTokens.Colors.info)
                ColorCard(name: "muted", color: DesignTokens.Colors.muted)
                ColorCard(name: "disabled", color: DesignTokens.Colors.disabled)
            }
        }
    }
    
    func getBrandColor(index: Int) -> Color {
        switch index {
        case 0: return DesignTokens.Colors.brand50
        case 1: return DesignTokens.Colors.brand100
        case 2: return DesignTokens.Colors.brand200
        case 3: return DesignTokens.Colors.brand300
        case 4: return DesignTokens.Colors.brand400
        case 5: return DesignTokens.Colors.brand500
        case 6: return DesignTokens.Colors.brand600
        case 7: return DesignTokens.Colors.brand700
        case 8: return DesignTokens.Colors.brand800
        case 9: return DesignTokens.Colors.brand900
        default: return DesignTokens.Colors.brand500
        }
    }
    
    func getGrayColor(index: Int) -> Color {
        switch index {
        case 0: return DesignTokens.Colors.gray50
        case 1: return DesignTokens.Colors.gray100
        case 2: return DesignTokens.Colors.gray200
        case 3: return DesignTokens.Colors.gray300
        case 4: return DesignTokens.Colors.gray400
        case 5: return DesignTokens.Colors.gray500
        case 6: return DesignTokens.Colors.gray600
        case 7: return DesignTokens.Colors.gray700
        case 8: return DesignTokens.Colors.gray800
        case 9: return DesignTokens.Colors.gray900
        default: return DesignTokens.Colors.gray500
        }
    }
}

// MARK: - Typography Section (100% matching HTML typography section)
struct TypographySection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "2. 文字系统" : "2. Typography System",
                subtitle: language == "zh" ? "字体大小、字重和行高" : "Font sizes, weights, and line heights"
            )
            
            // Font Sizes
            Text(language == "zh" ? "字体大小" : "Font Sizes")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.space3) {
                TypographyRow(name: "text-6xl", size: DesignTokens.Typography.text6XL, sample: "永")
                TypographyRow(name: "text-5xl", size: DesignTokens.Typography.text5XL, sample: "设计")
                TypographyRow(name: "text-4xl", size: DesignTokens.Typography.text4XL, sample: "设计系")
                TypographyRow(name: "text-3xl", size: DesignTokens.Typography.text3XL, sample: "设计系统")
                TypographyRow(name: "text-2xl", size: DesignTokens.Typography.text2XL, sample: "设计系统展")
                TypographyRow(name: "text-xl", size: DesignTokens.Typography.textXL, sample: "设计系统展示")
                TypographyRow(name: "text-lg", size: DesignTokens.Typography.textLG, sample: "跨平台设计系统")
                TypographyRow(name: "text-base", size: DesignTokens.Typography.textBase, sample: "100% SwiftUI 兼容")
                TypographyRow(name: "text-sm", size: DesignTokens.Typography.textSM, sample: "完整的设计令牌系统")
                TypographyRow(name: "text-xs", size: DesignTokens.Typography.textXS, sample: "包含色彩、字体、间距等")
            }
            
            // Font Weights
            Text(language == "zh" ? "字重" : "Font Weights")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(.top, DesignTokens.Spacing.space6)
            
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.space2) {
                FontWeightRow(name: "Thin (100)", weight: .thin)
                FontWeightRow(name: "Light (300)", weight: .light)
                FontWeightRow(name: "Regular (400)", weight: .regular)
                FontWeightRow(name: "Medium (500)", weight: .medium)
                FontWeightRow(name: "Semibold (600)", weight: .semibold)
                FontWeightRow(name: "Bold (700)", weight: .bold)
                FontWeightRow(name: "Heavy (800)", weight: .heavy)
                FontWeightRow(name: "Black (900)", weight: .black)
            }
        }
    }
}

// MARK: - Other Sections (placeholder for now, will implement 100% later)
struct HierarchySection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "3. 层级系统" : "3. Hierarchy System",
                subtitle: language == "zh" ? "视觉层次和面板系统" : "Visual hierarchy and panel system"
            )
            
            // Panel levels
            Text(language == "zh" ? "面板层级" : "Panel Levels")
                .textStyle(size: DesignTokens.Typography.text2XL, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            VStack(spacing: DesignTokens.Spacing.space3) {
                ForEach(0..<6) { level in
                    PanelCard(name: "Panel \(level)", color: DesignTokens.Colors.panel(level))
                }
                PanelCard(name: "Panel Elevated", color: DesignTokens.Colors.panelElevated)
                    .tokenShadow(DesignTokens.Shadows.lg)
                PanelCard(name: "Panel Sunken", color: DesignTokens.Colors.panelSunken)
                PanelCard(name: "Panel Accent", color: DesignTokens.Colors.panelAccent)
                PanelCard(name: "Panel Muted", color: DesignTokens.Colors.panelMuted)
            }
        }
    }
}

struct SpacingSection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "4. 间距系统" : "4. Spacing System",
                subtitle: language == "zh" ? "数学化的间距令牌" : "Mathematical spacing tokens"
            )
            
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.space3) {
                SpacingRow(name: "space-0", value: DesignTokens.Spacing.space0)
                SpacingRow(name: "space-0.5", value: DesignTokens.Spacing.space0_5)
                SpacingRow(name: "space-1", value: DesignTokens.Spacing.space1)
                SpacingRow(name: "space-2", value: DesignTokens.Spacing.space2)
                SpacingRow(name: "space-3", value: DesignTokens.Spacing.space3)
                SpacingRow(name: "space-4", value: DesignTokens.Spacing.space4)
                SpacingRow(name: "space-5", value: DesignTokens.Spacing.space5)
                SpacingRow(name: "space-6", value: DesignTokens.Spacing.space6)
                SpacingRow(name: "space-8", value: DesignTokens.Spacing.space8)
                SpacingRow(name: "space-10", value: DesignTokens.Spacing.space10)
                SpacingRow(name: "space-12", value: DesignTokens.Spacing.space12)
                SpacingRow(name: "space-16", value: DesignTokens.Spacing.space16)
                SpacingRow(name: "space-20", value: DesignTokens.Spacing.space20)
                SpacingRow(name: "space-24", value: DesignTokens.Spacing.space24)
            }
        }
    }
}

struct RadiusSection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "5. 圆角系统" : "5. Radius System",
                subtitle: language == "zh" ? "9个圆角值" : "9 radius values"
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                RadiusCard(name: "none", radius: DesignTokens.Radius.none)
                RadiusCard(name: "sm", radius: DesignTokens.Radius.sm)
                RadiusCard(name: "base", radius: DesignTokens.Radius.base)
                RadiusCard(name: "md", radius: DesignTokens.Radius.md)
                RadiusCard(name: "lg", radius: DesignTokens.Radius.lg)
                RadiusCard(name: "xl", radius: DesignTokens.Radius.xl)
                RadiusCard(name: "2xl", radius: DesignTokens.Radius.xl2)
                RadiusCard(name: "3xl", radius: DesignTokens.Radius.xl3)
                RadiusCard(name: "full", radius: min(DesignTokens.Radius.full, 30))
            }
        }
    }
}

struct ShadowSection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "6. 阴影系统" : "6. Shadow System",
                subtitle: language == "zh" ? "8个阴影层级" : "8 shadow levels"
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: DesignTokens.Spacing.space4) {
                ShadowCard(name: "shadow-xs", shadow: DesignTokens.Shadows.xs)
                ShadowCard(name: "shadow-sm", shadow: DesignTokens.Shadows.sm)
                ShadowCard(name: "shadow", shadow: DesignTokens.Shadows.base)
                ShadowCard(name: "shadow-md", shadow: DesignTokens.Shadows.md)
                ShadowCard(name: "shadow-lg", shadow: DesignTokens.Shadows.lg)
                ShadowCard(name: "shadow-xl", shadow: DesignTokens.Shadows.xl)
                ShadowCard(name: "shadow-2xl", shadow: DesignTokens.Shadows.xl2)
                ShadowCard(name: "shadow-inner", shadow: DesignTokens.Shadows.inner)
            }
        }
    }
}

struct AccessibilitySection: View {
    let language: String
    @ObservedObject private var config = DesignTokensConfig.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "7. 无障碍系统" : "7. Accessibility System",
                subtitle: language == "zh" ? "对比度、字体缩放和行高调整" : "Contrast, font scaling, and line height"
            )
            
            // Contrast Mode
            Text(language == "zh" ? "对比度模式" : "Contrast Mode")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
            
            HStack(spacing: DesignTokens.Spacing.space2) {
                ForEach(ContrastMode.allCases, id: \.self) { mode in
                    Button(action: { config.contrastMode = mode }) {
                        Text(mode.rawValue.capitalized)
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1_5)
                            .background(config.contrastMode == mode ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                            .foregroundColor(config.contrastMode == mode ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.secondaryForeground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            // Letter Spacing
            Text(language == "zh" ? "字间距" : "Letter Spacing")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
                .padding(.top, DesignTokens.Spacing.space4)
            
            HStack(spacing: DesignTokens.Spacing.space2) {
                ForEach(LetterSpacingMode.allCases, id: \.self) { mode in
                    Button(action: { config.letterSpacing = mode }) {
                        Text(mode.rawValue.capitalized)
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1_5)
                            .background(config.letterSpacing == mode ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                            .foregroundColor(config.letterSpacing == mode ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.secondaryForeground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            // Line Height
            Text(language == "zh" ? "行高" : "Line Height")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
                .padding(.top, DesignTokens.Spacing.space4)
            
            HStack(spacing: DesignTokens.Spacing.space2) {
                ForEach(LineHeightMode.allCases, id: \.self) { mode in
                    Button(action: { config.lineHeight = mode }) {
                        Text(mode.rawValue.capitalized)
                            .textStyle(size: DesignTokens.Typography.textSM)
                            .padding(.horizontal, DesignTokens.Spacing.space3)
                            .padding(.vertical, DesignTokens.Spacing.space1_5)
                            .background(config.lineHeight == mode ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
                            .foregroundColor(config.lineHeight == mode ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.secondaryForeground)
                            .tokenRadius(DesignTokens.Radius.sm)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct ComponentsSection: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionHeader(
                title: language == "zh" ? "8. 组件示例" : "8. Component Examples",
                subtitle: language == "zh" ? "使用设计令牌的组件" : "Components using design tokens"
            )
            
            // Buttons
            Text(language == "zh" ? "按钮" : "Buttons")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
            
            HStack(spacing: DesignTokens.Spacing.space4) {
                Button("Primary") {}
                    .buttonStyle(PrimaryButtonStyle())
                
                Button("Secondary") {}
                    .buttonStyle(SecondaryButtonStyle())
                
                Button("Disabled") {}
                    .disabled(true)
                    .buttonStyle(DisabledButtonStyle())
            }
            
            // Cards
            Text(language == "zh" ? "卡片" : "Cards")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
                .padding(.top, DesignTokens.Spacing.space4)
            
            CardExample(language: language)
        }
    }
}

// MARK: - Floating Control Panel (100% matching HTML floating-controls)
struct FloatingControlPanel: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            VStack(spacing: DesignTokens.Spacing.space3) {
                // Header
                HStack {
                    Text("控制面板")
                        .textStyle(size: DesignTokens.Typography.textSM, weight: .semibold)
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    Spacer()
                    
                    Button(action: { withAnimation { controlsExpanded.toggle() }}) {
                        Image(systemName: controlsExpanded ? "chevron.down" : "chevron.up")
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if controlsExpanded {
                    Divider()
                        .background(DesignTokens.Colors.border)
                    
                    // Controls
                    VStack(spacing: DesignTokens.Spacing.space3) {
                        // Dark mode toggle
                        ControlRow(icon: "🌙", label: "深色模式") {
                            Toggle("", isOn: $config.isDarkMode)
                                .toggleStyle(SwitchToggleStyle(tint: DesignTokens.Colors.primary))
                                .labelsHidden()
                        }
                        
                        // Brand hue slider
                        ControlRow(icon: "🎨", label: "品牌色相") {
                            HStack {
                                Slider(value: $config.brandHue, in: 0...360)
                                    .frame(width: 140)
                                Text("\(Int(config.brandHue))°")
                                    .textStyle(size: DesignTokens.Typography.textXS)
                                    .frame(width: 40)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                        }
                        
                        // Saturation slider
                        ControlRow(icon: "💧", label: "饱和度") {
                            HStack {
                                Slider(value: $config.brandSaturation, in: 0...100)
                                    .frame(width: 140)
                                Text("\(Int(config.brandSaturation))%")
                                    .textStyle(size: DesignTokens.Typography.textXS)
                                    .frame(width: 40)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                        }
                        
                        // Radius scale
                        ControlRow(icon: "🔘", label: "圆角缩放") {
                            HStack {
                                Slider(value: $config.radiusScale, in: 0.5...2.0)
                                    .frame(width: 140)
                                Text(String(format: "%.1fx", config.radiusScale))
                                    .textStyle(size: DesignTokens.Typography.textXS)
                                    .frame(width: 40)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                        }
                        
                        // Spacing scale
                        ControlRow(icon: "📐", label: "间距缩放") {
                            HStack {
                                Slider(value: $config.spacingScale, in: 0.5...2.0)
                                    .frame(width: 140)
                                Text(String(format: "%.1fx", config.spacingScale))
                                    .textStyle(size: DesignTokens.Typography.textXS)
                                    .frame(width: 40)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                        }
                        
                        // Font scale
                        ControlRow(icon: "🔤", label: "字体缩放") {
                            HStack {
                                Slider(value: $config.fontScale, in: 0.875...1.5)
                                    .frame(width: 140)
                                Text(String(format: "%.2fx", config.fontScale))
                                    .textStyle(size: DesignTokens.Typography.textXS)
                                    .frame(width: 40)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                        }
                    }
                }
            }
            .padding(DesignTokens.Spacing.space4)
            .background(DesignTokens.Colors.card.opacity(0.95))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .cornerRadius(24)
            .tokenShadow(DesignTokens.Shadows.lg)
        }
        .frame(width: 320)
    }
}

// MARK: - Helper Views

struct SectionHeader: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space2) {
            Text(title)
                .textStyle(size: DesignTokens.Typography.text3XL, weight: .bold)
                .foregroundColor(DesignTokens.Colors.foreground)
            Text(subtitle)
                .textStyle(size: DesignTokens.Typography.textBase)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(.vertical, DesignTokens.Spacing.space4)
    }
}

struct ColorCard: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: DesignTokens.Spacing.space2) {
            RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                )
            
            Text(name)
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct TypographyRow: View {
    let name: String
    let size: CGFloat
    let sample: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: DesignTokens.Spacing.space4) {
            Text(name)
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 80, alignment: .leading)
            
            Text("\(Int(size))pt")
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 40)
            
            Text(sample)
                .textStyle(size: size)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Spacer()
        }
        .padding(.vertical, DesignTokens.Spacing.space2)
    }
}

struct FontWeightRow: View {
    let name: String
    let weight: Font.Weight
    
    var body: some View {
        Text(name)
            .textStyle(size: DesignTokens.Typography.textBase, weight: weight)
            .foregroundColor(DesignTokens.Colors.foreground)
    }
}

struct SpacingRow: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        HStack(spacing: DesignTokens.Spacing.space4) {
            Text(name)
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 80, alignment: .leading)
            
            Text("\(Int(value))pt")
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 40)
            
            Rectangle()
                .fill(DesignTokens.Colors.primary)
                .frame(width: value, height: 24)
                .tokenRadius(DesignTokens.Radius.sm)
            
            Spacer()
        }
    }
}

struct RadiusCard: View {
    let name: String
    let radius: CGFloat
    
    var body: some View {
        VStack(spacing: DesignTokens.Spacing.space2) {
            RoundedRectangle(cornerRadius: radius)
                .fill(DesignTokens.Colors.primary)
                .frame(height: 60)
            
            Text(name)
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct ShadowCard: View {
    let name: String
    let shadow: ShadowStyle
    
    var body: some View {
        VStack(spacing: DesignTokens.Spacing.space2) {
            RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                .fill(DesignTokens.Colors.card)
                .frame(height: 80)
                .tokenShadow(shadow)
            
            Text(name)
                .textStyle(size: DesignTokens.Typography.textXS)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct PanelCard: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .textStyle(size: DesignTokens.Typography.textSM)
                .foregroundColor(DesignTokens.Colors.foreground)
            Spacer()
        }
        .padding(DesignTokens.Spacing.space4)
        .background(color)
        .tokenRadius(DesignTokens.Radius.md)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct ControlRow<Content: View>: View {
    let icon: String
    let label: String
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        HStack(spacing: DesignTokens.Spacing.space3) {
            HStack(spacing: DesignTokens.Spacing.space2) {
                Text(icon)
                    .font(.system(size: 16))
                Text(label)
                    .textStyle(size: DesignTokens.Typography.textXS, weight: .medium)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            .frame(width: 100, alignment: .leading)
            
            content()
        }
    }
}

struct CardExample: View {
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space3) {
            Text(language == "zh" ? "示例卡片" : "Example Card")
                .textStyle(size: DesignTokens.Typography.textLG, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.cardForeground)
            
            Text(language == "zh" ? "这是一个使用设计令牌系统的卡片组件示例" : "This is an example card component using the design token system")
                .textStyle(size: DesignTokens.Typography.textSM)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            HStack(spacing: DesignTokens.Spacing.space2) {
                Button(language == "zh" ? "操作" : "Action") {}
                    .buttonStyle(PrimaryButtonStyle())
                
                Button(language == "zh" ? "取消" : "Cancel") {}
                    .buttonStyle(SecondaryButtonStyle())
            }
        }
        .padding(DesignTokens.Spacing.space6)
        .background(DesignTokens.Colors.card)
        .tokenRadius(DesignTokens.Radius.lg)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .tokenShadow(DesignTokens.Shadows.sm)
    }
}

// MARK: - Button Styles
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.buttonPrimary)
            .foregroundColor(DesignTokens.Colors.buttonPrimaryForeground)
            .tokenRadius(DesignTokens.Radius.md)
            .textStyle(size: DesignTokens.Typography.textSM, weight: .medium)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.buttonSecondary)
            .foregroundColor(DesignTokens.Colors.buttonSecondaryForeground)
            .tokenRadius(DesignTokens.Radius.md)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .textStyle(size: DesignTokens.Typography.textSM, weight: .medium)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct DisabledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.buttonDisabled)
            .foregroundColor(DesignTokens.Colors.buttonDisabledForeground)
            .tokenRadius(DesignTokens.Radius.md)
            .textStyle(size: DesignTokens.Typography.textSM, weight: .medium)
            .opacity(0.6)
    }
}