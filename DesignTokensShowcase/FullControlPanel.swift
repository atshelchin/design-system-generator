//
//  FullControlPanel.swift
//  完整的悬浮控制面板 - 100%还原HTML功能
//

import SwiftUI
import UniformTypeIdentifiers

struct FullControlPanel: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    @Binding var language: String
    @Binding var isDarkMode: Bool
    
    @State private var selectedFont = "系统默认"
    @State private var fontSize = "A"  // A-、A、A+、A++ 四个层级
    @State private var contrast = "标准"
    @State private var letterSpacing = "标准"
    @State private var lineHeight = "标准"
    @State private var uploadedFonts: [String] = []
    @State private var showingFontPicker = false
    @State private var showingFontManager = false
    
    var body: some View {
        VStack(spacing: 0) {
            // 标题栏
            HStack {
                Text(language == "zh" ? "设计系统控制" : "Design System Controls")
                    .font(.system(size: 14, weight: .semibold))
                
                Spacer()
                
                Button(action: { 
                    withAnimation(.easeInOut(duration: 0.2)) { 
                        controlsExpanded.toggle() 
                    }
                }) {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 11))
                        .rotationEffect(.degrees(controlsExpanded ? 0 : -90))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color(NSColor.controlBackgroundColor))
            .overlay(
                Rectangle()
                    .fill(Color(NSColor.separatorColor).opacity(0.5))
                    .frame(height: 1),
                alignment: .bottom
            )
            
            if controlsExpanded {
                ScrollView {
                    VStack(spacing: 16) {
                        // 滑块控制组
                        VStack(spacing: 14) {
                            // 色调微调 - 实时改变品牌色
                            PanelSliderRow(
                                icon: "🎯",
                                label: language == "zh" ? "色调微调" : "Fine Tune",
                                value: $config.brandHue,
                                range: 0...360,
                                format: "%.0f°",
                                onChange: { _ in
                                    // 值已通过@Published自动更新
                                }
                            )
                            
                            // 饱和度 - 实时改变饱和度
                            PanelSliderRow(
                                icon: "💧",
                                label: language == "zh" ? "饱和度" : "Saturation",
                                value: $config.brandSaturation,
                                range: 0...100,
                                format: "%.0f%%",
                                onChange: { _ in
                                    // 值已通过@Published自动更新
                                }
                            )
                            
                            // 圆角 - 实时改变所有圆角
                            PanelSliderRow(
                                icon: "⚪",
                                label: language == "zh" ? "圆角" : "Radius",
                                value: $config.radiusScale,
                                range: 0...3,
                                format: "%.1fx",
                                onChange: { _ in
                                    // 值已通过@Published自动更新
                                }
                            )
                            
                            // 间距 - 实时改变所有间距
                            PanelSliderRow(
                                icon: "↔️",
                                label: language == "zh" ? "间距" : "Spacing",
                                value: $config.spacingScale,
                                range: 0.5...2,
                                format: "%.1fx",
                                onChange: { _ in
                                    // 值已通过@Published自动更新
                                }
                            )
                        }
                        .padding(.horizontal, 20)
                        
                        Divider()
                            .padding(.horizontal, 16)
                        
                        // 字体选择区域
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 6) {
                                Text("🅰️")
                                    .font(.system(size: 15))
                                Text(language == "zh" ? "字体选择" : "Font Family")
                                    .font(.system(size: 13))
                            }
                            
                            // 字体下拉菜单
                            Menu {
                                Button("系统默认") { 
                                    selectedFont = "系统默认"
                                    applyFont("system")
                                }
                                Button("Sans-serif") { 
                                    selectedFont = "Sans-serif"
                                    applyFont("sans-serif")
                                }
                                Button("Serif") { 
                                    selectedFont = "Serif"
                                    applyFont("serif")
                                }
                                Button("Monospace") { 
                                    selectedFont = "Monospace"
                                    applyFont("monospace")
                                }
                                
                                if !uploadedFonts.isEmpty {
                                    Divider()
                                    ForEach(uploadedFonts, id: \.self) { font in
                                        Button(font) { 
                                            selectedFont = font
                                            applyFont(font)
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedFont)
                                        .font(.system(size: 12))
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 9))
                                }
                                .foregroundColor(Color(NSColor.labelColor))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .background(Color(NSColor.controlBackgroundColor))
                                .cornerRadius(6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
                                )
                            }
                            
                            // 上传和管理按钮
                            HStack(spacing: 8) {
                                Button(language == "zh" ? "上传" : "Upload") {
                                    showingFontPicker = true
                                }
                                .buttonStyle(PanelSmallButtonStyle())
                                
                                Button(language == "zh" ? "管理" : "Manage") {
                                    showingFontManager = true
                                }
                                .buttonStyle(PanelSmallButtonStyle())
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // 字体大小 - 4个层级
                        PanelButtonGroup(
                            icon: "abc",
                            label: language == "zh" ? "字体大小" : "Font Size",
                            options: ["A-", "A", "A+", "A++"],
                            selected: $fontSize,
                            action: { option in
                                switch option {
                                case "A-": 
                                    config.fontScale = 0.875  // 87.5%
                                case "A": 
                                    config.fontScale = 1.0    // 100%
                                case "A+": 
                                    config.fontScale = 1.125  // 112.5%
                                case "A++": 
                                    config.fontScale = 1.25   // 125%
                                default: 
                                    break
                                }
                            }
                        )
                        
                        // 对比度
                        PanelButtonGroup(
                            icon: "◻️",
                            label: language == "zh" ? "对比度" : "Contrast",
                            options: language == "zh" ? ["标准", "高", "超高"] : ["Normal", "High", "Ultra"],
                            selected: $contrast,
                            action: { option in
                                switch option {
                                case "高", "High":
                                    config.contrast = .high
                                case "超高", "Ultra":
                                    config.contrast = .ultra
                                default:
                                    config.contrast = .normal
                                }
                            }
                        )
                        
                        // 文字间距
                        PanelButtonGroup(
                            icon: "↔️",
                            label: language == "zh" ? "文字间距" : "Letter Spacing",
                            options: language == "zh" ? ["标准", "宽松", "更宽"] : ["Normal", "Wide", "Wider"],
                            selected: $letterSpacing,
                            action: { option in
                                switch option {
                                case "宽松", "Wide":
                                    config.letterSpacing = .wide
                                case "更宽", "Wider":
                                    config.letterSpacing = .wider
                                default:
                                    config.letterSpacing = .normal
                                }
                            }
                        )
                        
                        // 行高
                        PanelButtonGroup(
                            icon: "📏",
                            label: language == "zh" ? "行高" : "Line Height",
                            options: language == "zh" ? ["标准", "舒适", "宽松"] : ["Normal", "Relaxed", "Loose"],
                            selected: $lineHeight,
                            action: { option in
                                switch option {
                                case "舒适", "Relaxed":
                                    config.lineHeight = .relaxed
                                case "宽松", "Loose":
                                    config.lineHeight = .loose
                                default:
                                    config.lineHeight = .normal
                                }
                            }
                        )
                        
                        // 重置所有按钮
                        Button(action: resetAll) {
                            Text(language == "zh" ? "重置所有" : "Reset All")
                                .font(.system(size: 12))
                                .foregroundColor(Color.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                    }
                }
                .frame(maxHeight: 420)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(NSColor.controlBackgroundColor).opacity(0.95))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 3)
        .fileImporter(
            isPresented: $showingFontPicker,
            allowedContentTypes: [UTType.font],
            allowsMultipleSelection: true
        ) { result in
            handleFontImport(result)
        }
        .sheet(isPresented: $showingFontManager) {
            FontManagerView(fonts: $uploadedFonts)
        }
    }
    
    private func applyFont(_ font: String) {
        // 应用字体到界面
        config.selectedFont = font
    }
    
    private func handleFontImport(_ result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            for url in urls {
                let fontName = url.deletingPathExtension().lastPathComponent
                uploadedFonts.append(fontName)
                // 实际加载字体文件
            }
        case .failure:
            break
        }
    }
    
    private func resetAll() {
        config.brandHue = 217
        config.brandSaturation = 91
        config.radiusScale = 1.0
        config.spacingScale = 1.0
        config.fontScale = 1.0
        fontSize = "A"
        contrast = language == "zh" ? "标准" : "Normal"
        letterSpacing = language == "zh" ? "标准" : "Normal"
        lineHeight = language == "zh" ? "标准" : "Normal"
        selectedFont = "系统默认"
    }
}

// 面板滑块行
struct PanelSliderRow: View {
    let icon: String
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let format: String
    let onChange: ((Double) -> Void)?
    
    init(icon: String, label: String, value: Binding<Double>, range: ClosedRange<Double>, format: String, onChange: ((Double) -> Void)? = nil) {
        self.icon = icon
        self.label = label
        self._value = value
        self.range = range
        self.format = format
        self.onChange = onChange
    }
    
    var body: some View {
        HStack(spacing: 10) {
            HStack(spacing: 6) {
                Text(icon)
                    .font(.system(size: 14))
                Text(label)
                    .font(.system(size: 12))
            }
            .frame(width: 90, alignment: .leading)
            
            Slider(value: $value, in: range) { _ in
                onChange?(value)
            }
            .controlSize(.small)
            
            Text(String(format: format, value))
                .font(.system(size: 11, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
                .frame(width: 45, alignment: .trailing)
        }
    }
}

// 面板按钮组
struct PanelButtonGroup: View {
    let icon: String
    let label: String
    let options: [String]
    @Binding var selected: String
    let action: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text(icon)
                    .font(.system(size: 14))
                Text(label)
                    .font(.system(size: 12))
            }
            
            HStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selected = option
                        action(option)
                    }) {
                        Text(option)
                            .font(.system(size: 11, weight: selected == option ? .medium : .regular))
                            .foregroundColor(selected == option ? .white : Color(NSColor.labelColor))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(
                        selected == option ? 
                            Color.blue : 
                            Color.clear
                    )
                    .contentShape(Rectangle()) // Make entire area clickable
                    
                    if option != options.last {
                        Divider()
                            .frame(height: 16)
                            .background(Color(NSColor.separatorColor).opacity(0.5))
                    }
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
            )
        }
        .padding(.horizontal, 20)
    }
}

// 小按钮样式
struct PanelSmallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 12))
            .foregroundColor(Color(NSColor.labelColor))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// 字体管理视图
struct FontManagerView: View {
    @Binding var fonts: [String]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // 标题栏
            HStack {
                Text("字体管理")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Button("完成") {
                    dismiss()
                }
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))
            
            Divider()
            
            // 字体列表
            List {
                ForEach(fonts, id: \.self) { font in
                    HStack {
                        Text(font)
                            .font(.system(size: 14))
                        Spacer()
                        Button(action: {
                            if let index = fonts.firstIndex(of: font) {
                                fonts.remove(at: index)
                            }
                        }) {
                            Image(systemName: "trash")
                                .font(.system(size: 12))
                                .foregroundColor(.red)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(PlainListStyle())
        }
        .frame(width: 400, height: 300)
    }
}