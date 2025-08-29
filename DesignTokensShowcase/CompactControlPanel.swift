//
//  CompactControlPanel.swift
//  紧凑的悬浮控制面板 - 100%还原HTML
//

import SwiftUI
import UniformTypeIdentifiers

struct CompactControlPanel: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    @Binding var language: String
    
    @State private var selectedFont = "系统默认"
    @State private var fontSize = "A"
    @State private var contrast = "标准"
    @State private var letterSpacing = "标准"
    @State private var lineHeight = "标准"
    @State private var uploadedFonts: [String] = []
    @State private var showingFontPicker = false
    
    var body: some View {
        VStack(spacing: 0) {
            // 标题栏
            HStack {
                Text(language == "zh" ? "设计系统控制" : "Design Controls")
                    .font(.system(size: 13, weight: .medium))
                
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
            .background(Color(NSColor.controlBackgroundColor))
            
            if controlsExpanded {
                Divider()
                
                ScrollView {
                    VStack(spacing: 14) {
                        // 滑块控制
                        VStack(spacing: 12) {
                            // 色调微调
                            CompactSliderRow(
                                icon: "🎯",
                                label: language == "zh" ? "色调微调" : "Hue",
                                value: $config.brandHue,
                                range: 0...360,
                                format: "%.0f°"
                            )
                            
                            // 饱和度
                            CompactSliderRow(
                                icon: "💧",
                                label: language == "zh" ? "饱和度" : "Saturation",
                                value: $config.brandSaturation,
                                range: 0...100,
                                format: "%.0f%%"
                            )
                            
                            // 圆角
                            CompactSliderRow(
                                icon: "⚪",
                                label: language == "zh" ? "圆角" : "Radius",
                                value: $config.radiusScale,
                                range: 0...3,
                                format: "%.1fx"
                            )
                            
                            // 间距
                            CompactSliderRow(
                                icon: "↔️",
                                label: language == "zh" ? "间距" : "Spacing",
                                value: $config.spacingScale,
                                range: 0.5...2,
                                format: "%.1fx"
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        
                        Divider()
                            .padding(.horizontal, 12)
                        
                        // 字体选择
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("🅰️")
                                    .font(.system(size: 14))
                                Text(language == "zh" ? "字体选择" : "Font")
                                    .font(.system(size: 12))
                            }
                            
                            // 下拉菜单
                            Menu {
                                Button("系统默认") { 
                                    selectedFont = "系统默认"
                                    // 应用系统字体
                                }
                                Divider()
                                ForEach(uploadedFonts, id: \.self) { font in
                                    Button(font) { 
                                        selectedFont = font
                                        // 应用自定义字体
                                    }
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
                                        .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
                                )
                            }
                            
                            // 上传和管理按钮
                            HStack(spacing: 6) {
                                Button("上传") {
                                    showingFontPicker = true
                                }
                                .buttonStyle(CompactButtonStyle())
                                
                                Button("管理") {
                                    // 管理字体
                                }
                                .buttonStyle(CompactButtonStyle())
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        // 字体大小
                        CompactButtonGroup(
                            icon: "abc",
                            label: language == "zh" ? "字体大小" : "Size",
                            options: ["A-", "A", "A+"],
                            selected: $fontSize,
                            action: { option in
                                switch option {
                                case "A-": config.fontScale = 0.9
                                case "A": config.fontScale = 1.0
                                case "A+": config.fontScale = 1.1
                                default: break
                                }
                            }
                        )
                        
                        // 对比度
                        CompactButtonGroup(
                            icon: "◻️",
                            label: language == "zh" ? "对比度" : "Contrast",
                            options: language == "zh" ? ["标准", "高", "超高"] : ["Normal", "High", "Ultra"],
                            selected: $contrast,
                            action: { _ in }
                        )
                        
                        // 文字间距
                        CompactButtonGroup(
                            icon: "↔️",
                            label: language == "zh" ? "文字间距" : "Spacing",
                            options: language == "zh" ? ["标准", "宽松", "更宽"] : ["Normal", "Wide", "Wider"],
                            selected: $letterSpacing,
                            action: { _ in }
                        )
                        
                        // 行高
                        CompactButtonGroup(
                            icon: "📏",
                            label: language == "zh" ? "行高" : "Line Height",
                            options: language == "zh" ? ["标准", "舒适", "宽松"] : ["Normal", "Relaxed", "Loose"],
                            selected: $lineHeight,
                            action: { _ in }
                        )
                        
                        // 重置所有
                        Button(action: {
                            config.brandHue = 217
                            config.brandSaturation = 91
                            config.radiusScale = 1.0
                            config.spacingScale = 1.0
                            config.fontScale = 1.0
                            fontSize = "A"
                            contrast = language == "zh" ? "标准" : "Normal"
                            letterSpacing = language == "zh" ? "标准" : "Normal"
                            lineHeight = language == "zh" ? "标准" : "Normal"
                        }) {
                            Text(language == "zh" ? "重置所有" : "Reset All")
                                .font(.system(size: 11))
                                .foregroundColor(Color.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 4)
                        .padding(.bottom, 12)
                    }
                }
                .frame(maxHeight: 380)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(NSColor.controlBackgroundColor).opacity(0.95))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.12), radius: 16, x: 0, y: 8)
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
        .fileImporter(
            isPresented: $showingFontPicker,
            allowedContentTypes: [UTType.font],
            allowsMultipleSelection: true
        ) { result in
            switch result {
            case .success(let urls):
                for url in urls {
                    // 处理字体文件
                    let fontName = url.deletingPathExtension().lastPathComponent
                    uploadedFonts.append(fontName)
                }
            case .failure:
                break
            }
        }
    }
}

// 紧凑的滑块行
struct CompactSliderRow: View {
    let icon: String
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let format: String
    
    var body: some View {
        HStack(spacing: 8) {
            // 图标和标签
            HStack(spacing: 4) {
                Text(icon)
                    .font(.system(size: 13))
                Text(label)
                    .font(.system(size: 11))
                    .foregroundColor(Color(NSColor.labelColor))
            }
            .frame(width: 80, alignment: .leading)
            
            // 滑块
            CompactSlider(value: $value, range: range)
                .frame(height: 16)
            
            // 值
            Text(String(format: format, value))
                .font(.system(size: 10, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
                .frame(width: 42, alignment: .trailing)
        }
    }
}

// 紧凑滑块
struct CompactSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // 轨道
                Capsule()
                    .fill(Color(NSColor.controlAccentColor).opacity(0.15))
                    .frame(height: 4)
                
                // 进度
                Capsule()
                    .fill(Color(NSColor.controlAccentColor).opacity(0.3))
                    .frame(
                        width: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)),
                        height: 4
                    )
                
                // 滑块
                Circle()
                    .fill(Color(NSColor.controlAccentColor))
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 1, y: 0.5)
                    .scaleEffect(isDragging ? 1.15 : 1.0)
                    .offset(x: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) - 7)
                    .gesture(
                        DragGesture()
                            .onChanged { drag in
                                isDragging = true
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Double(drag.location.x / geometry.size.width)
                                value = min(max(newValue, range.lowerBound), range.upperBound)
                            }
                            .onEnded { _ in
                                isDragging = false
                            }
                    )
            }
        }
    }
}

// 紧凑按钮组
struct CompactButtonGroup: View {
    let icon: String
    let label: String
    let options: [String]
    @Binding var selected: String
    let action: (String) -> Void
    
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
                            .font(.system(size: 11, weight: selected == option ? .medium : .regular))
                            .foregroundColor(selected == option ? .white : Color(NSColor.labelColor))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                            .background(
                                selected == option ? 
                                    Color(NSColor.controlAccentColor) : 
                                    Color.clear
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
            )
        }
        .padding(.horizontal, 16)
    }
}

// 紧凑按钮样式
struct CompactButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 11))
            .foregroundColor(Color(NSColor.labelColor))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(NSColor.separatorColor), lineWidth: 0.5)
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}