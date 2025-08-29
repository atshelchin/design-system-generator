//
//  ContentView.swift
//  DesignTokensShowcase
//
//  100% implementation of showcase.html in SwiftUI
//

import SwiftUI

struct ContentView: View {
    // State for controls matching HTML
    @State private var isDarkMode = false
    @State private var brandHue: Double = 217
    @State private var brandSaturation: Double = 91
    @State private var radiusScale: Double = 1.0
    @State private var spacingScale: Double = 1.0
    @State private var fontScale: Double = 1.0
    @State private var contrastMode: ContrastMode = .normal
    @State private var letterSpacing: LetterSpacingMode = .normal
    @State private var lineHeight: LineHeightMode = .normal
    @State private var showControls = true
    @State private var selectedTab = "colors"
    
    var body: some View {
        ZStack {
            // Main content
            ScrollView {
                VStack(alignment: .leading, spacing: DesignTokens.Spacing.space8) {
                    // Header matching HTML
                    HeaderSection()
                    
                    // Tab selection
                    TabSelector(selectedTab: $selectedTab)
                    
                    // Content based on selected tab
                    switch selectedTab {
                    case "colors":
                        ColorShowcase()
                    case "typography":
                        TypographyShowcase()
                    case "spacing":
                        SpacingShowcase()
                    case "shadows":
                        ShadowShowcase()
                    case "radius":
                        RadiusShowcase()
                    case "panels":
                        PanelShowcase()
                    case "components":
                        ComponentShowcase()
                    default:
                        ColorShowcase()
                    }
                }
                .padding(DesignTokens.Spacing.space8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isDarkMode ? DesignTokens.Colors.Dark.background : DesignTokens.Colors.background)
            
            // Floating controls (matching HTML)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingControls(
                        isDarkMode: $isDarkMode,
                        brandHue: $brandHue,
                        brandSaturation: $brandSaturation,
                        radiusScale: $radiusScale,
                        spacingScale: $spacingScale,
                        fontScale: $fontScale,
                        contrastMode: $contrastMode,
                        letterSpacing: $letterSpacing,
                        lineHeight: $lineHeight,
                        showControls: $showControls
                    )
                    .padding(DesignTokens.Spacing.space8)
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onChange(of: brandHue) { _ in updateConfig() }
        .onChange(of: brandSaturation) { _ in updateConfig() }
        .onChange(of: radiusScale) { _ in updateConfig() }
        .onChange(of: spacingScale) { _ in updateConfig() }
        .onChange(of: fontScale) { _ in updateConfig() }
        .onChange(of: contrastMode) { _ in updateConfig() }
        .onChange(of: letterSpacing) { _ in updateConfig() }
        .onChange(of: lineHeight) { _ in updateConfig() }
    }
    
    func updateConfig() {
        DesignTokens.config.brandHue = brandHue
        DesignTokens.config.brandSaturation = brandSaturation / 100
        DesignTokens.config.radiusScale = radiusScale
        DesignTokens.config.spacingScale = spacingScale
        DesignTokens.config.fontScale = fontScale
        DesignTokens.config.contrastMode = contrastMode
        DesignTokens.config.letterSpacing = letterSpacing
        DesignTokens.config.lineHeight = lineHeight
    }
}

// MARK: - Header Section
struct HeaderSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space4) {
            HStack {
                Text("设计系统展示")
                    .font(.system(size: DesignTokens.Typography.text4XL, weight: .bold))
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                Text("Design System Showcase")
                    .font(.system(size: DesignTokens.Typography.text4XL, weight: .bold))
                    .foregroundColor(DesignTokens.Colors.foreground.opacity(0.7))
            }
            
            Text("100% SwiftUI 兼容的跨平台设计令牌系统")
                .font(.system(size: DesignTokens.Typography.textLG))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(.vertical, DesignTokens.Spacing.space8)
    }
}

// MARK: - Tab Selector
struct TabSelector: View {
    @Binding var selectedTab: String
    
    let tabs = [
        ("colors", "🎨", "色彩"),
        ("typography", "🔤", "字体"),
        ("spacing", "📐", "间距"),
        ("shadows", "🎭", "阴影"),
        ("radius", "🔘", "圆角"),
        ("panels", "🏗️", "面板"),
        ("components", "🧩", "组件")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignTokens.Spacing.space2) {
                ForEach(tabs, id: \.0) { tab in
                    Button(action: { selectedTab = tab.0 }) {
                        HStack(spacing: DesignTokens.Spacing.space2) {
                            Text(tab.1)
                            Text(tab.2)
                                .font(.system(size: DesignTokens.Typography.textSM))
                        }
                        .padding(.horizontal, DesignTokens.Spacing.space4)
                        .padding(.vertical, DesignTokens.Spacing.space2)
                        .background(selectedTab == tab.0 ? DesignTokens.Colors.primary : Color.clear)
                        .foregroundColor(selectedTab == tab.0 ? DesignTokens.Colors.primaryForeground : DesignTokens.Colors.foreground)
                        .cornerRadius(DesignTokens.Radius.md)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

// MARK: - Color Showcase
struct ColorShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "品牌色 Brand Colors", subtitle: "10级色阶系统")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                ColorCard(name: "brand-50", color: DesignTokens.Colors.brand50)
                ColorCard(name: "brand-100", color: DesignTokens.Colors.brand100)
                ColorCard(name: "brand-200", color: DesignTokens.Colors.brand200)
                ColorCard(name: "brand-300", color: DesignTokens.Colors.brand300)
                ColorCard(name: "brand-400", color: DesignTokens.Colors.brand400)
                ColorCard(name: "brand-500", color: DesignTokens.Colors.brand500)
                ColorCard(name: "brand-600", color: DesignTokens.Colors.brand600)
                ColorCard(name: "brand-700", color: DesignTokens.Colors.brand700)
                ColorCard(name: "brand-800", color: DesignTokens.Colors.brand800)
                ColorCard(name: "brand-900", color: DesignTokens.Colors.brand900)
            }
            
            SectionTitle(title: "中性色 Neutral Colors", subtitle: "灰度色阶")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                ColorCard(name: "gray-50", color: DesignTokens.Colors.gray50)
                ColorCard(name: "gray-100", color: DesignTokens.Colors.gray100)
                ColorCard(name: "gray-200", color: DesignTokens.Colors.gray200)
                ColorCard(name: "gray-300", color: DesignTokens.Colors.gray300)
                ColorCard(name: "gray-400", color: DesignTokens.Colors.gray400)
                ColorCard(name: "gray-500", color: DesignTokens.Colors.gray500)
                ColorCard(name: "gray-600", color: DesignTokens.Colors.gray600)
                ColorCard(name: "gray-700", color: DesignTokens.Colors.gray700)
                ColorCard(name: "gray-800", color: DesignTokens.Colors.gray800)
                ColorCard(name: "gray-900", color: DesignTokens.Colors.gray900)
            }
            
            SectionTitle(title: "语义色 Semantic Colors", subtitle: "功能性颜色")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: DesignTokens.Spacing.space4) {
                ColorCard(name: "primary", color: DesignTokens.Colors.primary)
                ColorCard(name: "secondary", color: DesignTokens.Colors.secondary)
                ColorCard(name: "success", color: DesignTokens.Colors.success)
                ColorCard(name: "danger", color: DesignTokens.Colors.danger)
                ColorCard(name: "warning", color: DesignTokens.Colors.warning)
                ColorCard(name: "info", color: DesignTokens.Colors.info)
            }
        }
    }
}

// MARK: - Typography Showcase
struct TypographyShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "字体大小 Font Sizes", subtitle: "10个层级")
            
            VStack(alignment: .leading, spacing: DesignTokens.Spacing.space4) {
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
        }
    }
}

// MARK: - Spacing Showcase
struct SpacingShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "间距系统 Spacing System", subtitle: "数学化的间距令牌")
            
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

// MARK: - Shadow Showcase
struct ShadowShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "阴影系统 Shadow System", subtitle: "8个阴影层级")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: DesignTokens.Spacing.space4) {
                ShadowCard(name: "shadow-xs", shadow: DesignTokens.Shadows.xs)
                ShadowCard(name: "shadow-sm", shadow: DesignTokens.Shadows.sm)
                ShadowCard(name: "shadow", shadow: DesignTokens.Shadows.base)
                ShadowCard(name: "shadow-md", shadow: DesignTokens.Shadows.md)
                ShadowCard(name: "shadow-lg", shadow: DesignTokens.Shadows.lg)
                ShadowCard(name: "shadow-xl", shadow: DesignTokens.Shadows.xl)
            }
        }
    }
}

// MARK: - Radius Showcase
struct RadiusShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "圆角系统 Radius System", subtitle: "9个圆角值")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: DesignTokens.Spacing.space4) {
                RadiusCard(name: "none", radius: DesignTokens.Radius.none)
                RadiusCard(name: "sm", radius: DesignTokens.Radius.sm)
                RadiusCard(name: "base", radius: DesignTokens.Radius.base)
                RadiusCard(name: "md", radius: DesignTokens.Radius.md)
                RadiusCard(name: "lg", radius: DesignTokens.Radius.lg)
                RadiusCard(name: "xl", radius: DesignTokens.Radius.xl)
                RadiusCard(name: "2xl", radius: DesignTokens.Radius.xl2)
                RadiusCard(name: "3xl", radius: DesignTokens.Radius.xl3)
                RadiusCard(name: "full", radius: DesignTokens.Radius.full)
            }
        }
    }
}

// MARK: - Panel Showcase
struct PanelShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "面板层级 Panel Hierarchy", subtitle: "视觉层次系统")
            
            VStack(spacing: DesignTokens.Spacing.space4) {
                PanelCard(name: "Panel 0", level: 0)
                PanelCard(name: "Panel 1", level: 1)
                PanelCard(name: "Panel 2", level: 2)
                PanelCard(name: "Panel 3", level: 3)
                PanelCard(name: "Panel Elevated", level: -1)
                PanelCard(name: "Panel Sunken", level: -2)
            }
        }
    }
}

// MARK: - Component Showcase
struct ComponentShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space6) {
            SectionTitle(title: "组件示例 Components", subtitle: "使用设计令牌的组件")
            
            // Buttons
            Text("按钮 Buttons")
                .font(.system(size: DesignTokens.Typography.textLG, weight: .semibold))
            
            HStack(spacing: DesignTokens.Spacing.space4) {
                Button("Primary") {}
                    .buttonStyle(PrimaryButtonStyle())
                
                Button("Secondary") {}
                    .buttonStyle(SecondaryButtonStyle())
                
                Button("Disabled") {}
                    .buttonStyle(DisabledButtonStyle())
            }
            
            // Input
            Text("输入框 Input")
                .font(.system(size: DesignTokens.Typography.textLG, weight: .semibold))
                .padding(.top, DesignTokens.Spacing.space4)
            
            TextField("请输入文本...", text: .constant(""))
                .textFieldStyle(CustomTextFieldStyle())
            
            // Card
            Text("卡片 Card")
                .font(.system(size: DesignTokens.Typography.textLG, weight: .semibold))
                .padding(.top, DesignTokens.Spacing.space4)
            
            CardExample()
        }
    }
}

// MARK: - Floating Controls
struct FloatingControls: View {
    @Binding var isDarkMode: Bool
    @Binding var brandHue: Double
    @Binding var brandSaturation: Double
    @Binding var radiusScale: Double
    @Binding var spacingScale: Double
    @Binding var fontScale: Double
    @Binding var contrastMode: ContrastMode
    @Binding var letterSpacing: LetterSpacingMode
    @Binding var lineHeight: LineHeightMode
    @Binding var showControls: Bool
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            // Control bubble
            VStack(spacing: DesignTokens.Spacing.space3) {
                // Header
                HStack {
                    Text("控制面板")
                        .font(.system(size: DesignTokens.Typography.textSM, weight: .semibold))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    Spacer()
                    
                    Button(action: { withAnimation { showControls.toggle() }}) {
                        Image(systemName: showControls ? "chevron.down" : "chevron.up")
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, DesignTokens.Spacing.space2)
                
                if showControls {
                    Divider()
                    
                    // Controls
                    VStack(spacing: DesignTokens.Spacing.space3) {
                        // Dark mode toggle
                        ControlRow(icon: "🌙", label: "深色模式") {
                            Toggle("", isOn: $isDarkMode)
                                .toggleStyle(SwitchToggleStyle())
                        }
                        
                        // Brand hue slider
                        ControlRow(icon: "🎨", label: "品牌色相") {
                            Slider(value: $brandHue, in: 0...360)
                                .frame(width: 140)
                            Text("\(Int(brandHue))°")
                                .font(.system(size: DesignTokens.Typography.textXS))
                                .frame(width: 40)
                        }
                        
                        // Saturation slider
                        ControlRow(icon: "💧", label: "饱和度") {
                            Slider(value: $brandSaturation, in: 0...100)
                                .frame(width: 140)
                            Text("\(Int(brandSaturation))%")
                                .font(.system(size: DesignTokens.Typography.textXS))
                                .frame(width: 40)
                        }
                        
                        // Radius scale
                        ControlRow(icon: "🔘", label: "圆角缩放") {
                            Slider(value: $radiusScale, in: 0.5...2.0)
                                .frame(width: 140)
                            Text(String(format: "%.1fx", radiusScale))
                                .font(.system(size: DesignTokens.Typography.textXS))
                                .frame(width: 40)
                        }
                        
                        // Spacing scale
                        ControlRow(icon: "📐", label: "间距缩放") {
                            Slider(value: $spacingScale, in: 0.5...2.0)
                                .frame(width: 140)
                            Text(String(format: "%.1fx", spacingScale))
                                .font(.system(size: DesignTokens.Typography.textXS))
                                .frame(width: 40)
                        }
                        
                        // Font scale
                        ControlRow(icon: "🔤", label: "字体缩放") {
                            Slider(value: $fontScale, in: 0.875...1.5)
                                .frame(width: 140)
                            Text(String(format: "%.2fx", fontScale))
                                .font(.system(size: DesignTokens.Typography.textXS))
                                .frame(width: 40)
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
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 2)
        }
        .frame(width: 320)
    }
}

// MARK: - Helper Views
struct SectionTitle: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space1) {
            Text(title)
                .font(.system(size: DesignTokens.Typography.text2XL, weight: .bold))
                .foregroundColor(DesignTokens.Colors.foreground)
            Text(subtitle)
                .font(.system(size: DesignTokens.Typography.textSM))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(.top, DesignTokens.Spacing.space4)
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
                .font(.system(size: DesignTokens.Typography.textXS))
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
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 80, alignment: .leading)
            
            Text("\(Int(size))pt")
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 40)
            
            Text(sample)
                .font(.system(size: size))
                .foregroundColor(DesignTokens.Colors.foreground)
                .tracking(DesignTokens.Typography.letterSpacing)
                .lineSpacing(DesignTokens.Typography.lineSpacing(for: size))
            
            Spacer()
        }
        .padding(.vertical, DesignTokens.Spacing.space2)
    }
}

struct SpacingRow: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        HStack(spacing: DesignTokens.Spacing.space4) {
            Text(name)
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 80, alignment: .leading)
            
            Text("\(Int(value))pt")
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(width: 40)
            
            Rectangle()
                .fill(DesignTokens.Colors.primary)
                .frame(width: value, height: 24)
                .cornerRadius(DesignTokens.Radius.sm)
            
            Spacer()
        }
    }
}

struct ShadowCard: View {
    let name: String
    let shadow: Shadow
    
    var body: some View {
        VStack(spacing: DesignTokens.Spacing.space2) {
            RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                .fill(DesignTokens.Colors.card)
                .frame(height: 80)
                .shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
            
            Text(name)
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
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
                .font(.system(size: DesignTokens.Typography.textXS))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct PanelCard: View {
    let name: String
    let level: Int
    
    var panelColor: Color {
        switch level {
        case 0: return DesignTokens.Colors.background
        case 1: return DesignTokens.Colors.gray50
        case 2: return DesignTokens.Colors.gray100
        case 3: return DesignTokens.Colors.gray200
        case -1: return DesignTokens.Colors.card // elevated
        case -2: return DesignTokens.Colors.gray50 // sunken
        default: return DesignTokens.Colors.background
        }
    }
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: DesignTokens.Typography.textSM))
                .foregroundColor(DesignTokens.Colors.foreground)
            Spacer()
        }
        .padding(DesignTokens.Spacing.space4)
        .background(panelColor)
        .cornerRadius(DesignTokens.Radius.md)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .shadow(color: level == -1 ? Color.black.opacity(0.1) : Color.clear,
                radius: level == -1 ? 10 : 0,
                x: 0, y: level == -1 ? 5 : 0)
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
                    .font(.system(size: DesignTokens.Typography.textXS, weight: .medium))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            .frame(width: 100, alignment: .leading)
            
            content()
        }
    }
}

struct CardExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space3) {
            Text("示例卡片")
                .font(.system(size: DesignTokens.Typography.textLG, weight: .semibold))
                .foregroundColor(DesignTokens.Colors.cardForeground)
            
            Text("这是一个使用设计令牌系统的卡片组件示例")
                .font(.system(size: DesignTokens.Typography.textSM))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            HStack(spacing: DesignTokens.Spacing.space2) {
                Button("操作") {}
                    .buttonStyle(PrimaryButtonStyle())
                
                Button("取消") {}
                    .buttonStyle(SecondaryButtonStyle())
            }
        }
        .padding(DesignTokens.Spacing.space6)
        .background(DesignTokens.Colors.card)
        .cornerRadius(DesignTokens.Radius.lg)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

// MARK: - Button Styles
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.primary)
            .foregroundColor(DesignTokens.Colors.primaryForeground)
            .cornerRadius(DesignTokens.Radius.md)
            .font(.system(size: DesignTokens.Typography.textSM, weight: .medium))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.secondary)
            .foregroundColor(DesignTokens.Colors.secondaryForeground)
            .cornerRadius(DesignTokens.Radius.md)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .font(.system(size: DesignTokens.Typography.textSM, weight: .medium))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct DisabledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, DesignTokens.Spacing.space5)
            .padding(.vertical, DesignTokens.Spacing.space2_5)
            .background(DesignTokens.Colors.disabled)
            .foregroundColor(DesignTokens.Colors.disabledForeground)
            .cornerRadius(DesignTokens.Radius.md)
            .font(.system(size: DesignTokens.Typography.textSM, weight: .medium))
            .opacity(0.6)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, DesignTokens.Spacing.space3)
            .padding(.vertical, DesignTokens.Spacing.space2)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
            )
            .font(.system(size: DesignTokens.Typography.textSM))
    }
}

