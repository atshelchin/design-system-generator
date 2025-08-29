//
//  FullControlPanelNew.swift
//  100%还原悬浮控制面板
//

import SwiftUI
import UniformTypeIdentifiers

struct FullControlPanelNew: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    @Binding var language: String
    @Binding var isDarkMode: Bool
    
    @State private var selectedFont = "系统默认"
    @State private var fontSize = "A"
    @State private var contrast = "标准"
    @State private var letterSpacing = "标准"
    @State private var lineHeight = "标准"
    @State private var uploadedFonts: [String] = []
    @State private var showingFontPicker = false
    @State private var showingFontManager = false
    
    // 使用primary色
    private var brandColor: Color {
        DesignTokens.Colors.primary
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // 标题栏 - 更紧凑
            HStack {
                Text(language == "zh" ? "设计系统控制" : "Design System Controls")
                    .font(.system(size: 13, weight: .semibold))
                
                Spacer()
                
                Button(action: { 
                    withAnimation(.easeInOut(duration: 0.2)) { 
                        controlsExpanded.toggle() 
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .rotationEffect(.degrees(controlsExpanded ? 0 : -90))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(DesignTokens.Colors.panel2)
            .overlay(
                Rectangle()
                    .fill(Color(NSColor.separatorColor).opacity(0.3))
                    .frame(height: 0.5),
                alignment: .bottom
            )
            
            if controlsExpanded {
                ScrollView {
                    VStack(spacing: 20) {
                        // 滑块控制组 - 更紧凑的间距
                        VStack(spacing: 16) {
                            // 色调微调 - 使用品牌色
                            BrandColorSlider(
                                icon: "🎯",
                                label: language == "zh" ? "色调微调" : "Fine Tune",
                                value: $config.brandHue,
                                range: 0...360,
                                format: "%.0f°",
                                brandColor: brandColor
                            )
                            
                            // 饱和度 - 使用品牌色
                            BrandColorSlider(
                                icon: "💧",
                                label: language == "zh" ? "饱和度" : "Saturation",
                                value: $config.brandSaturation,
                                range: 0...100,
                                format: "%.0f%%",
                                brandColor: brandColor
                            )
                            
                            // 圆角
                            BrandColorSlider(
                                icon: "⚪",
                                label: language == "zh" ? "圆角" : "Radius",
                                value: $config.radiusScale,
                                range: 0...3,
                                format: "%.1fx",
                                brandColor: brandColor
                            )
                            
                            // 间距
                            BrandColorSlider(
                                icon: "↔️",
                                label: language == "zh" ? "间距" : "Spacing",
                                value: $config.spacingScale,
                                range: 0.5...2,
                                format: "%.1fx",
                                brandColor: brandColor
                            )
                        }
                        .padding(.horizontal, 16)
                        
                        Divider()
                            .padding(.horizontal, 12)
                        
                        // 字体选择区域 - 更紧凑
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 4) {
                                Text("🅰️")
                                    .font(.system(size: 14))
                                Text(language == "zh" ? "字体选择" : "Font Family")
                                    .font(.system(size: 12))
                            }
                            
                            // 字体下拉菜单
                            Menu {
                                Button("系统默认") {
                                    selectedFont = "系统默认"
                                    config.selectedFont = "system"
                                }
                                Button("Sans-serif") {
                                    selectedFont = "Sans-serif"
                                    config.selectedFont = "sans-serif"
                                }
                                Button("Serif") {
                                    selectedFont = "Serif"
                                    config.selectedFont = "serif"
                                }
                                Button("Monospace") {
                                    selectedFont = "Monospace"
                                    config.selectedFont = "monospace"
                                }
                            } label: {
                                HStack {
                                    Text(selectedFont)
                                        .font(.system(size: 11))
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 8))
                                }
                                .foregroundColor(Color(NSColor.labelColor))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Color(NSColor.controlBackgroundColor))
                                .cornerRadius(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 0.5)
                                )
                            }
                            
                            // 上传和管理按钮
                            HStack(spacing: 6) {
                                Button(language == "zh" ? "上传" : "Upload") {
                                    showingFontPicker = true
                                }
                                .buttonStyle(SmallBrandButtonStyle(brandColor: brandColor))
                                
                                Button(language == "zh" ? "管理" : "Manage") {
                                    showingFontManager = true
                                }
                                .buttonStyle(SmallBrandButtonStyle(brandColor: brandColor))
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        // 字体大小 - 使用品牌色
                        BrandButtonGroup(
                            icon: "abc",
                            label: language == "zh" ? "字体大小" : "Font Size",
                            options: ["A-", "A", "A+", "A++"],
                            selected: $fontSize,
                            brandColor: brandColor,
                            action: { option in
                                switch option {
                                case "A-": config.fontScale = 0.875
                                case "A": config.fontScale = 1.0
                                case "A+": config.fontScale = 1.125
                                case "A++": config.fontScale = 1.25
                                default: break
                                }
                            }
                        )
                        
                        // 对比度 - 使用品牌色
                        BrandButtonGroup(
                            icon: "◻️",
                            label: language == "zh" ? "对比度" : "Contrast",
                            options: language == "zh" ? ["标准", "高", "超高"] : ["Normal", "High", "Ultra"],
                            selected: $contrast,
                            brandColor: brandColor,
                            action: { option in
                                switch option {
                                case "高", "High": config.contrast = .high
                                case "超高", "Ultra": config.contrast = .ultra
                                default: config.contrast = .normal
                                }
                            }
                        )
                        
                        // 文字间距 - 使用品牌色
                        BrandButtonGroup(
                            icon: "↔️",
                            label: language == "zh" ? "文字间距" : "Letter Spacing",
                            options: language == "zh" ? ["标准", "宽松", "更宽"] : ["Normal", "Wide", "Wider"],
                            selected: $letterSpacing,
                            brandColor: brandColor,
                            action: { option in
                                switch option {
                                case "宽松", "Wide": config.letterSpacing = .wide
                                case "更宽", "Wider": config.letterSpacing = .wider
                                default: config.letterSpacing = .normal
                                }
                            }
                        )
                        
                        // 行高 - 使用品牌色
                        BrandButtonGroup(
                            icon: "📏",
                            label: language == "zh" ? "行高" : "Line Height",
                            options: language == "zh" ? ["标准", "舒适", "宽松"] : ["Normal", "Relaxed", "Loose"],
                            selected: $lineHeight,
                            brandColor: brandColor,
                            action: { option in
                                switch option {
                                case "舒适", "Relaxed": config.lineHeight = .relaxed
                                case "宽松", "Loose": config.lineHeight = .loose
                                default: config.lineHeight = .normal
                                }
                            }
                        )
                        
                        // 重置所有按钮 - 使用secondary色
                        Button(action: {
                            config.brandHue = 217
                            config.brandSaturation = 91
                            config.radiusScale = 1.0
                            config.spacingScale = 1.0
                            config.fontScale = 1.0
                            config.contrast = .normal
                            config.letterSpacing = .normal
                            config.lineHeight = .normal
                            selectedFont = "系统默认"
                            fontSize = "A"
                            contrast = "标准"
                            letterSpacing = "标准"
                            lineHeight = "标准"
                        }) {
                            Text(language == "zh" ? "重置所有" : "Reset All")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(DesignTokens.Colors.secondaryForeground)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(DesignTokens.Colors.secondary)
                                .cornerRadius(6)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    }
                    .padding(.top, 16)
                }
                .frame(height: 500) // 固定高度
            }
        }
        .frame(width: 340) // 固定宽度
        .background(DesignTokens.Colors.panel1)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
    }
}

// 品牌色滑块
struct BrandColorSlider: View {
    let icon: String
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let format: String
    let brandColor: Color
    
    var body: some View {
        HStack(spacing: 10) {
            HStack(spacing: 4) {
                Text(icon)
                    .font(.system(size: 13))
                Text(label)
                    .font(.system(size: 11))
            }
            .frame(width: 80, alignment: .leading)
            
            Slider(value: $value, in: range)
                .accentColor(brandColor)
                .controlSize(.small)
            
            Text(String(format: format, value))
                .font(.system(size: 10, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
                .frame(width: 40, alignment: .trailing)
        }
    }
}

// 品牌色按钮组
struct BrandButtonGroup: View {
    let icon: String
    let label: String
    let options: [String]
    @Binding var selected: String
    let brandColor: Color
    let action: (String) -> Void
    
    // 根据主题和对比度模式选择合适的前景色
    private func selectedForegroundColor(isSelected: Bool) -> Color {
        if isSelected {
            let config = DesignTokensConfig.shared
            // 在暗色模式下，如果是超高对比度，使用黑色文字
            if config.isDarkMode && config.contrast == .ultra {
                return Color.black
            }
            // 其他情况使用白色
            return .white
        } else {
            return Color(NSColor.labelColor)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 4) {
                Text(icon)
                    .font(.system(size: 13))
                Text(label)
                    .font(.system(size: 11))
            }
            
            HStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selected = option
                        action(option)
                    }) {
                        Text(option)
                            .font(.system(size: 10, weight: selected == option ? .medium : .regular))
                            .foregroundColor(selectedForegroundColor(isSelected: selected == option))
                            .frame(maxWidth: .infinity, minHeight: 24) // 增加最小高度
                            .contentShape(Rectangle()) // 确保整个区域可点击
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(selected == option ? brandColor : Color.clear)
                    
                    if option != options.last {
                        Divider()
                            .frame(height: 14)
                            .background(Color(NSColor.separatorColor).opacity(0.3))
                    }
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 0.5)
            )
        }
        .padding(.horizontal, 16)
    }
}

// 小按钮样式 - 使用品牌色
struct SmallBrandButtonStyle: ButtonStyle {
    let brandColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 11))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(brandColor)
            .cornerRadius(4)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}