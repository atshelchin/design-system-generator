import SwiftUI

// 100% 精确复制 HTML 悬浮控制面板
struct FloatingControlPanel: View {
    @ObservedObject var config: DesignTokensConfig
    @Binding var controlsExpanded: Bool
    @Binding var language: String
    @State private var selectedFont: String = "系统默认"
    @State private var fontSize: String = "A"
    @State private var contrast: String = "标准"
    @State private var letterSpacing: String = "标准"
    @State private var lineHeight: String = "标准"
    
    var body: some View {
        VStack(spacing: 0) {
            // Header exactly matching HTML
            HStack {
                Text(language == "zh" ? "设计系统控制" : "Design System Controls")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(NSColor.labelColor))
                
                Spacer()
                
                Button(action: { 
                    withAnimation(.easeInOut(duration: 0.2)) { 
                        controlsExpanded.toggle() 
                    } 
                }) {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(NSColor.secondaryLabelColor))
                        .rotationEffect(.degrees(controlsExpanded ? 0 : -90))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            
            if controlsExpanded {
                // Separator line
                Divider()
                    .background(Color(NSColor.separatorColor).opacity(0.5))
                    .padding(.horizontal, 16)
                
                VStack(spacing: 20) {
                    // Slider controls section
                    VStack(spacing: 16) {
                        // 色调微调
                        SliderControl(
                            icon: "🎯",
                            label: language == "zh" ? "色调微调" : "Fine Tune",
                            value: $config.brandHue,
                            range: 0...360,
                            format: "%.0f°"
                        )
                        
                        // 饱和度
                        SliderControl(
                            icon: "💧",
                            label: language == "zh" ? "饱和度" : "Saturation",
                            value: $config.brandSaturation,
                            range: 0...100,
                            format: "%.0f%%"
                        )
                        
                        // 圆角
                        SliderControl(
                            icon: "⚪",
                            label: language == "zh" ? "圆角" : "Radius",
                            value: $config.radiusScale,
                            range: 0...3,
                            format: "%.1fx"
                        )
                        
                        // 间距
                        SliderControl(
                            icon: "↔️",
                            label: language == "zh" ? "间距" : "Spacing",
                            value: $config.spacingScale,
                            range: 0.5...2,
                            format: "%.1fx"
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    
                    Divider()
                        .background(Color(NSColor.separatorColor).opacity(0.5))
                        .padding(.horizontal, 16)
                    
                    // 字体选择 dropdown
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 8) {
                            Text("🅰️")
                                .font(.system(size: 16))
                            Text(language == "zh" ? "字体选择" : "Font Family")
                                .font(.system(size: 14))
                                .foregroundColor(Color(NSColor.labelColor))
                        }
                        
                        Menu {
                            Button("系统默认") { selectedFont = "系统默认" }
                            Button("Sans-serif") { selectedFont = "Sans-serif" }
                            Button("Serif") { selectedFont = "Serif" }
                            Button("Monospace") { selectedFont = "Monospace" }
                        } label: {
                            HStack {
                                Text(selectedFont)
                                    .font(.system(size: 13))
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 10))
                            }
                            .foregroundColor(Color(NSColor.labelColor))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(NSColor.separatorColor), lineWidth: 1)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        HStack(spacing: 8) {
                            Button("上传") {
                                // Upload font
                            }
                            .buttonStyle(PanelSecondaryButtonStyle())
                            
                            Button("管理") {
                                // Manage fonts
                            }
                            .buttonStyle(PanelSecondaryButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // 字体大小
                    ButtonGroupControl(
                        icon: "abc",
                        label: language == "zh" ? "字体大小" : "Font Size",
                        options: ["A-", "A", "A+", "A++"],
                        selected: $fontSize,
                        action: { selected in
                            switch selected {
                            case "A-": config.fontScale = 0.9
                            case "A": config.fontScale = 1.0
                            case "A+": config.fontScale = 1.1
                            case "A++": config.fontScale = 1.2
                            default: break
                            }
                        }
                    )
                    .padding(.horizontal, 20)
                    
                    // 对比度
                    ButtonGroupControl(
                        icon: "◻️",
                        label: language == "zh" ? "对比度" : "Contrast",
                        options: language == "zh" ? ["标准", "高", "超高"] : ["Normal", "High", "Ultra"],
                        selected: $contrast,
                        action: { _ in }
                    )
                    .padding(.horizontal, 20)
                    
                    // 文字间距
                    ButtonGroupControl(
                        icon: "↔️",
                        label: language == "zh" ? "文字间距" : "Letter Spacing",
                        options: language == "zh" ? ["标准", "宽松", "更宽"] : ["Normal", "Wide", "Wider"],
                        selected: $letterSpacing,
                        action: { _ in }
                    )
                    .padding(.horizontal, 20)
                    
                    // 行高
                    ButtonGroupControl(
                        icon: "📏",
                        label: language == "zh" ? "行高" : "Line Height",
                        options: language == "zh" ? ["标准", "舒适", "宽松"] : ["Normal", "Relaxed", "Loose"],
                        selected: $lineHeight,
                        action: { _ in }
                    )
                    .padding(.horizontal, 20)
                    
                    // 重置所有按钮
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
                            .font(.system(size: 13))
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
                }
            }
        }
        .frame(width: 360)
        .background(
            VisualEffectBackground()
        )
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 10)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

// Slider control matching HTML exactly
struct SliderControl: View {
    let icon: String
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let format: String
    
    var body: some View {
        HStack(spacing: 12) {
            // Icon and label
            HStack(spacing: 6) {
                Text(icon)
                    .font(.system(size: 16))
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(Color(NSColor.labelColor))
            }
            
            Spacer()
            
            // Custom slider
            HTMLStyleSlider(value: $value, range: range)
                .frame(width: 140, height: 20)
            
            // Value display
            Text(String(format: format, value))
                .font(.system(size: 13, design: .monospaced))
                .foregroundColor(Color(NSColor.secondaryLabelColor))
                .frame(width: 50, alignment: .trailing)
        }
    }
}

// HTML-style slider
struct HTMLStyleSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Track
                Capsule()
                    .fill(Color(NSColor.controlBackgroundColor))
                    .frame(height: 6)
                    .overlay(
                        Capsule()
                            .stroke(Color(NSColor.separatorColor).opacity(0.3), lineWidth: 0.5)
                    )
                
                // Active track
                Capsule()
                    .fill(Color.blue.opacity(0.3))
                    .frame(width: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)), height: 6)
                
                // Thumb
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 1)
                    .scaleEffect(isDragging ? 1.1 : 1.0)
                    .offset(x: geometry.size.width * CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) - 10)
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
            .frame(height: 20)
        }
    }
}

// Button group control
struct ButtonGroupControl: View {
    let icon: String
    let label: String
    let options: [String]
    @Binding var selected: String
    let action: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text(icon)
                    .font(.system(size: 16))
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(Color(NSColor.labelColor))
            }
            
            HStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selected = option
                        action(option)
                    }) {
                        Text(option)
                            .font(.system(size: 13, weight: selected == option ? .medium : .regular))
                            .foregroundColor(selected == option ? .white : Color(NSColor.labelColor))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(
                                selected == option ? Color.blue : Color.clear
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if option != options.last {
                        Divider()
                            .frame(height: 20)
                            .background(Color(NSColor.separatorColor).opacity(0.3))
                    }
                }
            }
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(NSColor.separatorColor).opacity(0.5), lineWidth: 1)
            )
        }
    }
}

// Panel secondary button style
struct PanelSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 12))
            .foregroundColor(Color(NSColor.labelColor))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(NSColor.separatorColor), lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// Visual effect background for the panel
struct VisualEffectBackground: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = .popover
        view.blendingMode = .behindWindow
        view.state = .active
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}