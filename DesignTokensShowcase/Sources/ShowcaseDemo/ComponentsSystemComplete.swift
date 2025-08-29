//
//  ComponentsSystemComplete.swift
//  100% 完整还原showcase.html的所有组件
//

import SwiftUI
import DesignTokensKit

struct ComponentsSystemCompleteView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "8. 组件示例" : "8. Component Examples")
                    .font(.system(size: 24 * config.fontScale, weight: .bold))
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                Text(language == "zh" ? "使用设计令牌构建的常用UI组件" : "Common UI components built with design tokens")
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            // 组件网格
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 24 * config.spacingScale),
                    GridItem(.flexible(), spacing: 24 * config.spacingScale),
                    GridItem(.flexible(), spacing: 24 * config.spacingScale)
                ],
                spacing: 24 * config.spacingScale
            ) {
                // 1. 按钮组件
                ComponentCardComplete(title: language == "zh" ? "按钮" : "Button", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        HStack(spacing: 8 * config.spacingScale) {
                            // Primary按钮
                            Button("Primary") {}
                                .buttonStyle(PrimaryButtonComponentStyle(config: config))
                            
                            // Secondary按钮
                            Button("Secondary") {}
                                .buttonStyle(SecondaryButtonComponentStyle(config: config))
                        }
                        
                        HStack(spacing: 8 * config.spacingScale) {
                            // Outline按钮
                            Button("Outline") {}
                                .buttonStyle(OutlineButtonComponentStyle(config: config))
                            
                            // Ghost按钮
                            Button("Ghost") {}
                                .buttonStyle(GhostButtonComponentStyle(config: config))
                        }
                        
                        // Destructive按钮
                        Button("Destructive") {}
                            .buttonStyle(DestructiveButtonComponentStyle(config: config))
                    }
                }
                
                // 2. 输入框组件
                ComponentCardComplete(title: language == "zh" ? "输入框" : "Input", config: config) {
                    VStack(spacing: 12 * config.spacingScale) {
                        // 文本输入框
                        InputFieldComponent(placeholder: "Text Input", config: config)
                        
                        // 密码输入框
                        SecureFieldComponent(placeholder: "Password", config: config)
                        
                        // 搜索框
                        SearchFieldComponent(placeholder: "Search...", config: config)
                    }
                }
                
                // 3. 文本域组件
                ComponentCardComplete(title: language == "zh" ? "文本域" : "Textarea", config: config) {
                    TextAreaComponent(placeholder: language == "zh" ? "输入多行文本..." : "Enter multiple lines...", config: config)
                }
                
                // 4. 下拉选择组件
                ComponentCardComplete(title: language == "zh" ? "下拉选择" : "Select", config: config) {
                    SelectComponent(config: config, language: language)
                }
                
                // 5. 复选框组件
                ComponentCardComplete(title: language == "zh" ? "复选框" : "Checkbox", config: config) {
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        CheckboxComponent(label: language == "zh" ? "选项一" : "Option 1", isChecked: true, config: config)
                        CheckboxComponent(label: language == "zh" ? "选项二" : "Option 2", isChecked: false, config: config)
                    }
                }
                
                // 6. 单选按钮组件
                ComponentCardComplete(title: language == "zh" ? "单选按钮" : "Radio", config: config) {
                    RadioGroupComponent(config: config, language: language)
                }
                
                // 7. 开关组件
                ComponentCardComplete(title: language == "zh" ? "开关" : "Switch", config: config) {
                    VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                        SwitchComponent(label: language == "zh" ? "启用" : "Enabled", isOn: true, config: config)
                        SwitchComponent(label: language == "zh" ? "禁用" : "Disabled", isOn: false, config: config)
                    }
                }
                
                // 8. 卡片组件
                ComponentCardComplete(title: language == "zh" ? "卡片" : "Card", config: config) {
                    CardComponent(config: config, language: language)
                }
                
                // 9. 徽章组件
                ComponentCardComplete(title: language == "zh" ? "徽章" : "Badge", config: config) {
                    HStack(spacing: 8 * config.spacingScale) {
                        BadgeComponent(text: "Default", type: .default, config: config)
                        BadgeComponent(text: "Primary", type: .primary, config: config)
                        BadgeComponent(text: "Success", type: .success, config: config)
                    }
                    HStack(spacing: 8 * config.spacingScale) {
                        BadgeComponent(text: "Warning", type: .warning, config: config)
                        BadgeComponent(text: "Error", type: .error, config: config)
                    }
                }
                
                // 10. 标签组件
                ComponentCardComplete(title: language == "zh" ? "标签" : "Tag", config: config) {
                    HStack(spacing: 8 * config.spacingScale) {
                        TagComponent(text: "Tag 1", config: config)
                        TagComponent(text: "Tag 2", config: config)
                        TagComponent(text: "Tag 3", config: config)
                    }
                }
                
                // 11. 进度条组件
                ComponentCardComplete(title: language == "zh" ? "进度条" : "Progress", config: config) {
                    VStack(spacing: 12 * config.spacingScale) {
                        ProgressComponent(value: 0.3, config: config)
                        ProgressComponent(value: 0.6, config: config)
                        ProgressComponent(value: 0.9, config: config)
                    }
                }
                
                // 12. 滑块组件
                ComponentCardComplete(title: language == "zh" ? "滑块" : "Slider", config: config) {
                    SliderComponent(value: 0.5, config: config)
                }
                
                // 13. 分页组件
                ComponentCardComplete(title: language == "zh" ? "分页" : "Pagination", config: config) {
                    PaginationComponent(config: config)
                }
                
                // 14. 提示框组件
                ComponentCardComplete(title: language == "zh" ? "提示框" : "Alert", config: config) {
                    VStack(spacing: 8 * config.spacingScale) {
                        AlertComponent(type: .info, message: language == "zh" ? "信息提示" : "Info message", config: config)
                        AlertComponent(type: .success, message: language == "zh" ? "成功提示" : "Success message", config: config)
                        AlertComponent(type: .warning, message: language == "zh" ? "警告提示" : "Warning message", config: config)
                        AlertComponent(type: .error, message: language == "zh" ? "错误提示" : "Error message", config: config)
                    }
                }
                
                // 15. 模态框组件
                ComponentCardComplete(title: language == "zh" ? "模态框" : "Modal", config: config) {
                    ModalPreviewComponent(config: config, language: language)
                }
                
                // 16. 提示气泡组件
                ComponentCardComplete(title: language == "zh" ? "提示气泡" : "Tooltip", config: config) {
                    TooltipComponent(config: config, language: language)
                }
                
                // 17. 面包屑组件
                ComponentCardComplete(title: language == "zh" ? "面包屑" : "Breadcrumb", config: config) {
                    BreadcrumbComponent(config: config, language: language)
                }
                
                // 18. 选项卡组件
                ComponentCardComplete(title: language == "zh" ? "选项卡" : "Tabs", config: config) {
                    TabsComponent(config: config, language: language)
                }
            }
        }
    }
}

// MARK: - 组件卡片容器
struct ComponentCardComplete<Content: View>: View {
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
                .font(.system(size: 14 * config.fontScale, weight: .semibold))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// MARK: - 按钮样式
struct PrimaryButtonComponentStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14 * config.fontScale, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.primary)
            .cornerRadius(6 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct SecondaryButtonComponentStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14 * config.fontScale, weight: .medium))
            .foregroundColor(DesignTokens.Colors.secondaryForeground)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.secondary)
            .cornerRadius(6 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct OutlineButtonComponentStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14 * config.fontScale, weight: .medium))
            .foregroundColor(DesignTokens.Colors.primary)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct GhostButtonComponentStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14 * config.fontScale, weight: .medium))
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(configuration.isPressed ? DesignTokens.Colors.muted.opacity(0.5) : Color.clear)
            .cornerRadius(6 * config.radiusScale)
    }
}

struct DestructiveButtonComponentStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14 * config.fontScale, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 16 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.danger)
            .cornerRadius(6 * config.radiusScale)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

// MARK: - 输入框组件
struct InputFieldComponent: View {
    let placeholder: String
    let config: DesignTokensConfig
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .font(.system(size: 14 * config.fontScale))
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(isFocused ? DesignTokens.Colors.ring : DesignTokens.Colors.input, lineWidth: isFocused ? 2 : 1)
            )
            .focused($isFocused)
    }
}

struct SecureFieldComponent: View {
    let placeholder: String
    let config: DesignTokensConfig
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .font(.system(size: 14 * config.fontScale))
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(isFocused ? DesignTokens.Colors.ring : DesignTokens.Colors.input, lineWidth: isFocused ? 2 : 1)
            )
            .focused($isFocused)
    }
}

struct SearchFieldComponent: View {
    let placeholder: String
    let config: DesignTokensConfig
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .font(.system(size: 14 * config.fontScale))
            
            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.system(size: 14 * config.fontScale))
        }
        .padding(.horizontal, 12 * config.spacingScale)
        .padding(.vertical, 8 * config.spacingScale)
        .background(DesignTokens.Colors.background)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(isFocused ? DesignTokens.Colors.ring : DesignTokens.Colors.input, lineWidth: isFocused ? 2 : 1)
        )
        .focused($isFocused)
    }
}

// MARK: - 文本域组件
struct TextAreaComponent: View {
    let placeholder: String
    let config: DesignTokensConfig
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextEditor(text: $text)
            .font(.system(size: 14 * config.fontScale))
            .frame(height: 80)
            .padding(8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(isFocused ? DesignTokens.Colors.ring : DesignTokens.Colors.input, lineWidth: isFocused ? 2 : 1)
            )
            .focused($isFocused)
    }
}

// MARK: - 下拉选择组件
struct SelectComponent: View {
    let config: DesignTokensConfig
    let language: String
    @State private var selectedOption = "选项一"
    
    var body: some View {
        Menu {
            Button("选项一") { selectedOption = "选项一" }
            Button("选项二") { selectedOption = "选项二" }
            Button("选项三") { selectedOption = "选项三" }
        } label: {
            HStack {
                Text(selectedOption)
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.foreground)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.system(size: 12 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
            )
        }
    }
}

// MARK: - 复选框组件
struct CheckboxComponent: View {
    let label: String
    let isChecked: Bool
    let config: DesignTokensConfig
    @State private var checked: Bool
    
    init(label: String, isChecked: Bool, config: DesignTokensConfig) {
        self.label = label
        self.isChecked = isChecked
        self.config = config
        self._checked = State(initialValue: isChecked)
    }
    
    var body: some View {
        Button(action: { checked.toggle() }) {
            HStack(spacing: 8 * config.spacingScale) {
                Image(systemName: checked ? "checkmark.square.fill" : "square")
                    .font(.system(size: 16 * config.fontScale))
                    .foregroundColor(checked ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                
                Text(label)
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.foreground)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - 单选按钮组件
struct RadioGroupComponent: View {
    let config: DesignTokensConfig
    let language: String
    @State private var selectedOption = "选项一"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            RadioButton(label: language == "zh" ? "选项一" : "Option 1", isSelected: selectedOption == "选项一", config: config) {
                selectedOption = "选项一"
            }
            RadioButton(label: language == "zh" ? "选项二" : "Option 2", isSelected: selectedOption == "选项二", config: config) {
                selectedOption = "选项二"
            }
        }
    }
}

struct RadioButton: View {
    let label: String
    let isSelected: Bool
    let config: DesignTokensConfig
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8 * config.spacingScale) {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .font(.system(size: 16 * config.fontScale))
                    .foregroundColor(isSelected ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                
                Text(label)
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.foreground)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - 开关组件
struct SwitchComponent: View {
    let label: String
    let isOn: Bool
    let config: DesignTokensConfig
    @State private var switchOn: Bool
    
    init(label: String, isOn: Bool, config: DesignTokensConfig) {
        self.label = label
        self.isOn = isOn
        self.config = config
        self._switchOn = State(initialValue: isOn)
    }
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Toggle("", isOn: $switchOn)
                .toggleStyle(SwitchToggleStyle(tint: DesignTokens.Colors.primary))
                .labelsHidden()
            
            Text(label)
                .font(.system(size: 14 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.foreground)
        }
    }
}

// MARK: - 卡片组件
struct CardComponent: View {
    let config: DesignTokensConfig
    let language: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            Text(language == "zh" ? "卡片标题" : "Card Title")
                .font(.system(size: 16 * config.fontScale, weight: .semibold))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Text(language == "zh" ? "这是卡片内容" : "This is card content")
                .font(.system(size: 14 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(6 * config.radiusScale)
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}

// MARK: - 徽章组件
enum BadgeType {
    case `default`, primary, success, warning, error
    
    var backgroundColor: Color {
        switch self {
        case .default: return DesignTokens.Colors.muted
        case .primary: return DesignTokens.Colors.primary
        case .success: return DesignTokens.Colors.success
        case .warning: return DesignTokens.Colors.warning
        case .error: return DesignTokens.Colors.danger
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .default: return DesignTokens.Colors.mutedForeground
        default: return .white
        }
    }
}

struct BadgeComponent: View {
    let text: String
    let type: BadgeType
    let config: DesignTokensConfig
    
    var body: some View {
        Text(text)
            .font(.system(size: 11 * config.fontScale, weight: .medium))
            .foregroundColor(type.foregroundColor)
            .padding(.horizontal, 8 * config.spacingScale)
            .padding(.vertical, 4 * config.spacingScale)
            .background(type.backgroundColor)
            .cornerRadius(12 * config.radiusScale)
    }
}

// MARK: - 标签组件
struct TagComponent: View {
    let text: String
    let config: DesignTokensConfig
    @State private var isHovered = false
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            Text(text)
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Button(action: {}) {
                Image(systemName: "xmark")
                    .font(.system(size: 10 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 8 * config.spacingScale)
        .padding(.vertical, 4 * config.spacingScale)
        .background(DesignTokens.Colors.secondary)
        .cornerRadius(4 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// MARK: - 进度条组件
struct ProgressComponent: View {
    let value: Double
    let config: DesignTokensConfig
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .fill(DesignTokens.Colors.muted)
                    .frame(height: 8)
                
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .fill(DesignTokens.Colors.primary)
                    .frame(width: geometry.size.width * value, height: 8)
            }
        }
        .frame(height: 8)
    }
}

// MARK: - 滑块组件
struct SliderComponent: View {
    let value: Double
    let config: DesignTokensConfig
    @State private var sliderValue: Double
    
    init(value: Double, config: DesignTokensConfig) {
        self.value = value
        self.config = config
        self._sliderValue = State(initialValue: value)
    }
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...1)
            .accentColor(DesignTokens.Colors.primary)
    }
}

// MARK: - 分页组件
struct PaginationComponent: View {
    let config: DesignTokensConfig
    @State private var currentPage = 2
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            // Previous
            Button(action: { if currentPage > 1 { currentPage -= 1 } }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 12 * config.fontScale))
            }
            .buttonStyle(PaginationButtonStyle(config: config, isActive: false))
            
            // Page numbers
            ForEach(1...5, id: \.self) { page in
                Button("\(page)") {
                    currentPage = page
                }
                .buttonStyle(PaginationButtonStyle(config: config, isActive: page == currentPage))
            }
            
            // Next
            Button(action: { if currentPage < 5 { currentPage += 1 } }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 12 * config.fontScale))
            }
            .buttonStyle(PaginationButtonStyle(config: config, isActive: false))
        }
    }
}

struct PaginationButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    let isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 12 * config.fontScale))
            .foregroundColor(isActive ? .white : DesignTokens.Colors.foreground)
            .frame(minWidth: 28, minHeight: 28)
            .background(isActive ? DesignTokens.Colors.primary : DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .cornerRadius(4 * config.radiusScale)
    }
}

// MARK: - 提示框组件
enum AlertType {
    case info, success, warning, error
    
    var backgroundColor: Color {
        switch self {
        case .info: return DesignTokens.Colors.info.opacity(0.1)
        case .success: return DesignTokens.Colors.success.opacity(0.1)
        case .warning: return DesignTokens.Colors.warning.opacity(0.1)
        case .error: return DesignTokens.Colors.danger.opacity(0.1)
        }
    }
    
    var borderColor: Color {
        switch self {
        case .info: return DesignTokens.Colors.info
        case .success: return DesignTokens.Colors.success
        case .warning: return DesignTokens.Colors.warning
        case .error: return DesignTokens.Colors.danger
        }
    }
    
    var icon: String {
        switch self {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}

struct AlertComponent: View {
    let type: AlertType
    let message: String
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Image(systemName: type.icon)
                .font(.system(size: 14 * config.fontScale))
                .foregroundColor(type.borderColor)
            
            Text(message)
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Spacer()
        }
        .padding(8 * config.spacingScale)
        .background(type.backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .stroke(type.borderColor, lineWidth: 1)
        )
        .cornerRadius(4 * config.radiusScale)
    }
}

// MARK: - 模态框预览组件
struct ModalPreviewComponent: View {
    let config: DesignTokensConfig
    let language: String
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            // 模态框缩略图
            VStack(spacing: 4 * config.spacingScale) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(DesignTokens.Colors.foreground)
                    .frame(height: 2)
                    .frame(maxWidth: 60)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(DesignTokens.Colors.mutedForeground)
                    .frame(height: 1)
                    .frame(maxWidth: 40)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(DesignTokens.Colors.mutedForeground)
                    .frame(height: 1)
                    .frame(maxWidth: 40)
            }
            .padding(12 * config.spacingScale)
            .frame(maxWidth: .infinity)
            .background(DesignTokens.Colors.card)
            .cornerRadius(6 * config.radiusScale)
            .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
            
            Text(language == "zh" ? "点击预览" : "Click to preview")
                .font(.system(size: 11 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

// MARK: - 提示气泡组件
struct TooltipComponent: View {
    let config: DesignTokensConfig
    let language: String
    @State private var showTooltip = false
    
    var body: some View {
        Button(language == "zh" ? "悬停显示提示" : "Hover for tooltip") {
            showTooltip.toggle()
        }
        .font(.system(size: 14 * config.fontScale))
        .foregroundColor(DesignTokens.Colors.primary)
        .onHover { hovering in
            showTooltip = hovering
        }
        .overlay(
            Group {
                if showTooltip {
                    VStack(spacing: 0) {
                        Text(language == "zh" ? "这是提示内容" : "This is a tooltip")
                            .font(.system(size: 12 * config.fontScale))
                            .foregroundColor(.white)
                            .padding(8 * config.spacingScale)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(4 * config.radiusScale)
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 8))
                            .foregroundColor(Color.black.opacity(0.8))
                            .offset(y: -1)
                    }
                    .offset(y: -40)
                }
            }
        )
    }
}

// MARK: - 面包屑组件
struct BreadcrumbComponent: View {
    let config: DesignTokensConfig
    let language: String
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            Text(language == "zh" ? "首页" : "Home")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.primary)
            
            Text("/")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Text(language == "zh" ? "产品" : "Products")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.primary)
            
            Text("/")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Text(language == "zh" ? "详情" : "Details")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.foreground)
        }
    }
}

// MARK: - 选项卡组件
struct TabsComponent: View {
    let config: DesignTokensConfig
    let language: String
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<3) { index in
                    Button(action: { selectedTab = index }) {
                        Text(tabTitle(index))
                            .font(.system(size: 14 * config.fontScale, weight: selectedTab == index ? .medium : .regular))
                            .foregroundColor(selectedTab == index ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                            .padding(.horizontal, 12 * config.spacingScale)
                            .padding(.vertical, 8 * config.spacingScale)
                            .overlay(
                                Rectangle()
                                    .fill(selectedTab == index ? DesignTokens.Colors.primary : Color.clear)
                                    .frame(height: 2)
                                    .offset(y: 12),
                                alignment: .bottom
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Spacer()
            }
            .overlay(
                Rectangle()
                    .fill(DesignTokens.Colors.border)
                    .frame(height: 1)
                    .offset(y: 12),
                alignment: .bottom
            )
            
            // Tab content preview
            Text(tabContent(selectedTab))
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 12 * config.spacingScale)
        }
    }
    
    func tabTitle(_ index: Int) -> String {
        let titles = language == "zh" ? ["选项一", "选项二", "选项三"] : ["Tab 1", "Tab 2", "Tab 3"]
        return titles[index]
    }
    
    func tabContent(_ index: Int) -> String {
        let contents = language == "zh" ? ["内容一", "内容二", "内容三"] : ["Content 1", "Content 2", "Content 3"]
        return contents[index]
    }
}