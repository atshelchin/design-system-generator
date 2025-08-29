//
//  ComponentsSystem.swift
//  100% 还原showcase.html的组件示例系统
//

import SwiftUI

struct ComponentsSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    @State private var sliderValue: Double = 60
    @State private var toggleValue: Bool = true
    @State private var selectedSegment = 0
    @State private var textFieldValue = ""
    @State private var selectedOption = "Option 1"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "8. 组件示例" : "8. Component Examples")
                    .globalTextStyle(config, size: 24, weight: .bold)
                
                Text(language == "zh" ? "使用设计系统构建的常见组件" : "Common components built with the design system")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 组件网格
            GeometryReader { geometry in
                let screenSize = ScreenSize.from(width: geometry.size.width)
                let columnCount = AdaptiveColumns.componentsGrid(for: screenSize)
                
                ScrollView {
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: columnCount),
                        spacing: 24 * config.spacingScale
                    ) {
                        // 按钮组件
                        ComponentCard(title: language == "zh" ? "按钮" : "Buttons", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                Button(language == "zh" ? "主要按钮" : "Primary Button") {}
                                    .buttonStyle(PrimaryButtonStyle(config: config))
                                
                                Button(language == "zh" ? "次要按钮" : "Secondary Button") {}
                                    .buttonStyle(SecondaryButtonStyle(config: config))
                                
                                Button(language == "zh" ? "危险按钮" : "Danger Button") {}
                                    .buttonStyle(DangerButtonStyle(config: config))
                                
                                Button(language == "zh" ? "禁用按钮" : "Disabled Button") {}
                                    .disabled(true)
                                    .buttonStyle(DisabledButtonStyle(config: config))
                                
                                Button(language == "zh" ? "文字按钮" : "Text Button") {}
                                    .buttonStyle(PlainButtonStyle())
                                    .foregroundColor(DesignTokens.Colors.primary)
                                    .globalTextStyle(config, size: 14)
                            }
                        }
                        
                        // 输入框组件
                        ComponentCard(title: language == "zh" ? "输入框" : "Input Fields", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                // 基础输入框
                                TextField(language == "zh" ? "基础输入框" : "Basic Input", text: $textFieldValue)
                                    .textFieldStyle(CustomTextFieldStyle(config: config))
                                
                                // 带图标输入框
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        .font(.system(size: 14))
                                    TextField(language == "zh" ? "搜索..." : "Search...", text: $textFieldValue)
                                        .textFieldStyle(PlainTextFieldStyle())
                                }
                                .padding(8 * config.spacingScale)
                                .background(Color(NSColor.controlBackgroundColor))
                                .cornerRadius(6 * config.radiusScale)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                                        .stroke(DesignTokens.Colors.input, lineWidth: 1)
                                )
                                
                                // 错误状态输入框
                                VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                    TextField(language == "zh" ? "错误输入" : "Error Input", text: $textFieldValue)
                                        .textFieldStyle(ErrorTextFieldStyle(config: config))
                                    Text(language == "zh" ? "请输入有效内容" : "Please enter valid content")
                                        .globalTextStyle(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.danger)
                                }
                            }
                        }
                        
                        // 选择器组件
                        ComponentCard(title: language == "zh" ? "选择器" : "Selectors", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                // 复选框
                                HStack {
                                    Toggle("", isOn: $toggleValue)
                                        .toggleStyle(CheckboxToggleStyle(config: config))
                                    Text(language == "zh" ? "复选框" : "Checkbox")
                                        .globalTextStyle(config, size: 13)
                                }
                                
                                // 开关
                                HStack {
                                    Toggle("", isOn: $toggleValue)
                                        .toggleStyle(SwitchToggleStyle())
                                    Text(language == "zh" ? "开关" : "Switch")
                                        .globalTextStyle(config, size: 13)
                                }
                                
                                // 单选按钮组
                                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                    ForEach(["Option 1", "Option 2", "Option 3"], id: \.self) { option in
                                        HStack {
                                            Image(systemName: selectedOption == option ? "circle.inset.filled" : "circle")
                                                .foregroundColor(selectedOption == option ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                                                .font(.system(size: 14))
                                                .onTapGesture {
                                                    selectedOption = option
                                                }
                                            Text(option)
                                                .globalTextStyle(config, size: 13)
                                        }
                                    }
                                }
                                
                                // 分段控制器
                                Picker("", selection: $selectedSegment) {
                                    Text("Tab 1").tag(0)
                                    Text("Tab 2").tag(1)
                                    Text("Tab 3").tag(2)
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                        }
                        
                        // 滑块和进度条
                        ComponentCard(title: language == "zh" ? "滑块和进度" : "Sliders & Progress", config: config) {
                            VStack(spacing: 16 * config.spacingScale) {
                                // 滑块
                                VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                    HStack {
                                        Text(language == "zh" ? "滑块" : "Slider")
                                            .globalTextStyle(config, size: 12)
                                        Spacer()
                                        Text("\(Int(sliderValue))%")
                                            .globalTextStyle(config, size: 12)
                                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    }
                                    Slider(value: $sliderValue, in: 0...100)
                                        .accentColor(DesignTokens.Colors.primary)
                                }
                                
                                // 进度条
                                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                    Text(language == "zh" ? "进度条" : "Progress Bar")
                                        .globalTextStyle(config, size: 12)
                                    
                                    ProgressView(value: 0.6)
                                        .progressViewStyle(LinearProgressViewStyle(tint: DesignTokens.Colors.primary))
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .scaleEffect(0.8)
                                }
                            }
                        }
                        
                        // 卡片组件
                        ComponentCard(title: language == "zh" ? "卡片" : "Cards", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                // 基础卡片
                                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                    Text(language == "zh" ? "卡片标题" : "Card Title")
                                        .globalTextStyle(config, size: 14, weight: .semibold)
                                    Text(language == "zh" ? "这是卡片内容，展示了基础的卡片布局。" : "This is card content, showing basic card layout.")
                                        .globalTextStyle(config, size: 12)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                }
                                .padding(12 * config.spacingScale)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(DesignTokens.Colors.card)
                                .cornerRadius(6 * config.radiusScale)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
                                
                                // 带操作的卡片
                                VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                                    HStack {
                                        Circle()
                                            .fill(DesignTokens.Colors.primary.opacity(0.1))
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(DesignTokens.Colors.primary)
                                            )
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(language == "zh" ? "特色功能" : "Featured")
                                                .globalTextStyle(config, size: 13, weight: .medium)
                                            Text(language == "zh" ? "重要内容" : "Important")
                                                .globalTextStyle(config, size: 11)
                                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {}) {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(12 * config.spacingScale)
                                .background(DesignTokens.Colors.card)
                                .cornerRadius(8 * config.radiusScale)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                                )
                            }
                        }
                        
                        // 标签和徽章
                        ComponentCard(title: language == "zh" ? "标签和徽章" : "Tags & Badges", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                // 标签
                                HStack(spacing: 8 * config.spacingScale) {
                                    ForEach(["标签1", "标签2", "标签3"], id: \.self) { tag in
                                        Text(tag)
                                            .globalTextStyle(config, size: 11)
                                            .padding(.horizontal, 8 * config.spacingScale)
                                            .padding(.vertical, 4 * config.spacingScale)
                                            .background(DesignTokens.Colors.primary.opacity(0.1))
                                            .foregroundColor(DesignTokens.Colors.primary)
                                            .cornerRadius(4 * config.radiusScale)
                                    }
                                }
                                
                                // 状态徽章
                                HStack(spacing: 8 * config.spacingScale) {
                                    Badge(text: "New", color: DesignTokens.Colors.success, config: config)
                                    Badge(text: "Hot", color: DesignTokens.Colors.danger, config: config)
                                    Badge(text: "Pro", color: DesignTokens.Colors.primary, config: config)
                                }
                                
                                // 计数徽章
                                HStack(spacing: 12 * config.spacingScale) {
                                    ForEach(["1", "99", "999+"], id: \.self) { count in
                                        Text(count)
                                            .globalTextStyle(config, size: 10, weight: .medium)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, count.count > 2 ? 6 : 5)
                                            .padding(.vertical, 2)
                                            .background(DesignTokens.Colors.danger)
                                            .cornerRadius(9999)
                                    }
                                }
                            }
                        }
                        
                        // 提示和警告
                        ComponentCard(title: language == "zh" ? "提示和警告" : "Alerts", config: config) {
                            VStack(spacing: 12 * config.spacingScale) {
                                // 成功提示
                                AlertBox(
                                    type: .success,
                                    title: language == "zh" ? "成功" : "Success",
                                    message: language == "zh" ? "操作成功完成" : "Operation completed",
                                    config: config
                                )
                                
                                // 警告提示
                                AlertBox(
                                    type: .warning,
                                    title: language == "zh" ? "警告" : "Warning",
                                    message: language == "zh" ? "请注意风险" : "Please be aware",
                                    config: config
                                )
                                
                                // 错误提示
                                AlertBox(
                                    type: .error,
                                    title: language == "zh" ? "错误" : "Error",
                                    message: language == "zh" ? "操作失败" : "Operation failed",
                                    config: config
                                )
                                
                                // 信息提示
                                AlertBox(
                                    type: .info,
                                    title: language == "zh" ? "提示" : "Info",
                                    message: language == "zh" ? "这是一条信息" : "This is information",
                                    config: config
                                )
                            }
                        }
                        
                        // 列表组件
                        ComponentCard(title: language == "zh" ? "列表" : "Lists", config: config) {
                            VStack(spacing: 0) {
                                ForEach(["Item 1", "Item 2", "Item 3"], id: \.self) { item in
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .font(.system(size: 6))
                                            .foregroundColor(DesignTokens.Colors.primary)
                                        
                                        Text(item)
                                            .globalTextStyle(config, size: 13)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 10))
                                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    }
                                    .padding(.horizontal, 12 * config.spacingScale)
                                    .padding(.vertical, 10 * config.spacingScale)
                                    
                                    if item != "Item 3" {
                                        Divider()
                                            .padding(.leading, 12 * config.spacingScale)
                                    }
                                }
                            }
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(6 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
                            )
                        }
                    }
                }
            }
            .frame(minHeight: 1200) // 增加最小高度以确保所有组件完全可见
        }
    }
}

// 组件卡片容器
struct ComponentCard<Content: View>: View {
    let title: String
    let config: DesignTokensConfig
    let content: Content
    
    init(title: String, config: DesignTokensConfig, @ViewBuilder content: () -> Content) {
        self.title = title
        self.config = config
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            Text(title)
                .globalTextStyle(config, size: 14, weight: .semibold)
            
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 0.5)
        )
    }
}

// 自定义样式
struct CustomTextFieldStyle: TextFieldStyle {
    let config: DesignTokensConfig
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(8 * config.spacingScale)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(6 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
            )
    }
}

struct ErrorTextFieldStyle: TextFieldStyle {
    let config: DesignTokensConfig
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(8 * config.spacingScale)
            .background(DesignTokens.Colors.danger.opacity(0.05))
            .cornerRadius(6 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.danger, lineWidth: 1)
            )
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                .font(.system(size: 16))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

struct DangerButtonStyle: ButtonStyle {
    @ObservedObject var config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13 * config.fontScale, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.danger)
            .cornerRadius(4 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

// 徽章组件
struct Badge: View {
    let text: String
    let color: Color
    let config: DesignTokensConfig
    
    var body: some View {
        Text(text)
            .globalTextStyle(config, size: 10, weight: .medium)
            .foregroundColor(.white)
            .padding(.horizontal, 6 * config.spacingScale)
            .padding(.vertical, 2 * config.spacingScale)
            .background(color)
            .cornerRadius(4 * config.radiusScale)
    }
}

// 提示框组件
struct AlertBox: View {
    enum AlertType {
        case success, warning, error, info
        
        var color: Color {
            switch self {
            case .success: return DesignTokens.Colors.success
            case .warning: return DesignTokens.Colors.warning
            case .error: return DesignTokens.Colors.danger
            case .info: return DesignTokens.Colors.info
            }
        }
        
        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            case .error: return "xmark.circle.fill"
            case .info: return "info.circle.fill"
            }
        }
    }
    
    let type: AlertType
    let title: String
    let message: String
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(alignment: .top, spacing: 8 * config.spacingScale) {
            Image(systemName: type.icon)
                .foregroundColor(type.color)
                .font(.system(size: 16))
            
            VStack(alignment: .leading, spacing: 2 * config.spacingScale) {
                Text(title)
                    .globalTextStyle(config, size: 12, weight: .medium)
                Text(message)
                    .globalTextStyle(config, size: 11)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            Spacer()
        }
        .padding(10 * config.spacingScale)
        .background(type.color.opacity(0.1))
        .cornerRadius(6 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(type.color.opacity(0.3), lineWidth: 1)
        )
    }
}