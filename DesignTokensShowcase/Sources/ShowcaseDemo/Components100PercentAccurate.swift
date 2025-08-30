//
//  Components100PercentAccurate.swift
//  100% accurate reproduction of showcase.html components
//

import SwiftUI
import DesignTokensKit

// MARK: - Main View with All 42 Components
struct Components100PercentAccurateView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 24 * config.spacingScale),
                    GridItem(.flexible(), spacing: 24 * config.spacingScale),
                    GridItem(.flexible(), spacing: 24 * config.spacingScale)
                ],
                spacing: 24 * config.spacingScale
            ) {
                // 1. Button Component
                ComponentCard100(
                    title: language == "zh" ? "按钮" : "Button",
                    config: config
                ) {
                    ButtonComponent100(config: config)
                }
                
                // 2. Input Component
                ComponentCard100(
                    title: language == "zh" ? "输入框" : "Input",
                    config: config
                ) {
                    InputComponent100(config: config)
                }
                
                // 3. Select Component
                ComponentCard100(
                    title: language == "zh" ? "选择器" : "Select",
                    config: config
                ) {
                    SelectComponent100(config: config)
                }
                
                // 4. Checkbox Component
                ComponentCard100(
                    title: language == "zh" ? "复选框" : "Checkbox",
                    config: config
                ) {
                    CheckboxComponent100(config: config)
                }
                
                // 5. Radio Component
                ComponentCard100(
                    title: language == "zh" ? "单选按钮" : "Radio",
                    config: config
                ) {
                    RadioComponent100(config: config)
                }
                
                // 6. Switch Component
                ComponentCard100(
                    title: language == "zh" ? "开关" : "Switch",
                    config: config
                ) {
                    SwitchComponent100(config: config)
                }
                
                // 7. Card Component
                ComponentCard100(
                    title: language == "zh" ? "卡片" : "Card",
                    config: config
                ) {
                    CardComponent100(config: config)
                }
                
                // 8. Badge Component
                ComponentCard100(
                    title: language == "zh" ? "徽章" : "Badge",
                    config: config
                ) {
                    BadgeComponent100(config: config)
                }
                
                // 9. Alert Component
                ComponentCard100(
                    title: language == "zh" ? "警告" : "Alert",
                    config: config
                ) {
                    AlertComponent100(config: config)
                }
                
                // 10. Progress Component
                ComponentCard100(
                    title: language == "zh" ? "进度条" : "Progress",
                    config: config
                ) {
                    ProgressComponent100(config: config)
                }
                
                // 11. Slider Component
                ComponentCard100(
                    title: language == "zh" ? "滑块" : "Slider",
                    config: config
                ) {
                    SliderComponent100(config: config)
                }
                
                // 12. Textarea Component
                ComponentCard100(
                    title: language == "zh" ? "文本域" : "Textarea",
                    config: config
                ) {
                    TextareaComponent100(config: config)
                }
                
                // 13. Avatar Component
                ComponentCard100(
                    title: language == "zh" ? "头像" : "Avatar",
                    config: config
                ) {
                    AvatarComponent100(config: config)
                }
                
                // 14. Tooltip Component
                ComponentCard100(
                    title: language == "zh" ? "工具提示" : "Tooltip",
                    config: config
                ) {
                    TooltipComponent100(config: config)
                }
                
                // 15. Tabs Component
                ComponentCard100(
                    title: language == "zh" ? "标签页" : "Tabs",
                    config: config
                ) {
                    TabsComponent100(config: config)
                }
                
                // 16. Breadcrumb Component
                ComponentCard100(
                    title: language == "zh" ? "面包屑" : "Breadcrumb",
                    config: config
                ) {
                    BreadcrumbComponent100(config: config)
                }
                
                // 17. Pagination Component
                ComponentCard100(
                    title: language == "zh" ? "分页" : "Pagination",
                    config: config
                ) {
                    PaginationComponent100(config: config)
                }
                
                // 18. Table Component
                ComponentCard100(
                    title: language == "zh" ? "表格" : "Table",
                    config: config
                ) {
                    TableComponent100(config: config)
                }
                
                // 19. List Component
                ComponentCard100(
                    title: language == "zh" ? "列表" : "List",
                    config: config
                ) {
                    ListComponent100(config: config)
                }
                
                // 20. Accordion Component
                ComponentCard100(
                    title: language == "zh" ? "手风琴" : "Accordion",
                    config: config
                ) {
                    AccordionComponent100(config: config)
                }
                
                // 21. Dialog Component
                ComponentCard100(
                    title: language == "zh" ? "对话框" : "Dialog",
                    config: config
                ) {
                    DialogComponent100(config: config)
                }
                
                // 22. Dropdown Component
                ComponentCard100(
                    title: language == "zh" ? "下拉菜单" : "Dropdown",
                    config: config
                ) {
                    DropdownComponent100(config: config)
                }
                
                // 23. Chip Component
                ComponentCard100(
                    title: language == "zh" ? "标签" : "Chip",
                    config: config
                ) {
                    ChipComponent100(config: config)
                }
                
                // 24. Skeleton Component
                ComponentCard100(
                    title: language == "zh" ? "骨架屏" : "Skeleton",
                    config: config
                ) {
                    SkeletonComponent100(config: config)
                }
                
                // 25. Stepper Component
                ComponentCard100(
                    title: language == "zh" ? "步骤条" : "Stepper",
                    config: config
                ) {
                    StepperComponent100(config: config)
                }
                
                // 26. Timeline Component
                ComponentCard100(
                    title: language == "zh" ? "时间线" : "Timeline",
                    config: config
                ) {
                    TimelineComponent100(config: config)
                }
                
                // 27. Rating Component
                ComponentCard100(
                    title: language == "zh" ? "评分" : "Rating",
                    config: config
                ) {
                    RatingComponent100(config: config)
                }
                
                // 28. Navigation Component
                ComponentCard100(
                    title: language == "zh" ? "导航" : "Navigation",
                    config: config
                ) {
                    NavigationComponent100(config: config)
                }
                
                // 29. Search Component
                ComponentCard100(
                    title: language == "zh" ? "搜索" : "Search",
                    config: config
                ) {
                    SearchComponent100(config: config)
                }
                
                // 30. File Upload Component
                ComponentCard100(
                    title: language == "zh" ? "文件上传" : "File Upload",
                    config: config
                ) {
                    FileUploadComponent100(config: config)
                }
                
                // 31. Stats Card Component
                ComponentCard100(
                    title: language == "zh" ? "统计卡片" : "Stats Card",
                    config: config
                ) {
                    StatsCardComponent100(config: config)
                }
                
                // 32. Notification Component
                ComponentCard100(
                    title: language == "zh" ? "通知" : "Notification",
                    config: config
                ) {
                    NotificationComponent100(config: config)
                }
                
                // 33. Keyboard Component
                ComponentCard100(
                    title: language == "zh" ? "键盘快捷键" : "Keyboard",
                    config: config
                ) {
                    KeyboardComponent100(config: config)
                }
                
                // 34. Loading Component
                ComponentCard100(
                    title: language == "zh" ? "加载动画" : "Loading",
                    config: config
                ) {
                    LoadingComponent100(config: config)
                }
                
                // 35. Metric Component
                ComponentCard100(
                    title: language == "zh" ? "指标展示" : "Metric",
                    config: config
                ) {
                    MetricComponent100(config: config)
                }
                
                // 36. Command Palette Component
                ComponentCard100(
                    title: language == "zh" ? "命令面板" : "Command Palette",
                    config: config
                ) {
                    CommandPaletteComponent100(config: config)
                }
                
                // 37. Activity Feed Component
                ComponentCard100(
                    title: language == "zh" ? "活动信息流" : "Activity Feed",
                    config: config
                ) {
                    ActivityFeedComponent100(config: config)
                }
                
                // 38. Profile Card Component
                ComponentCard100(
                    title: language == "zh" ? "个人资料卡" : "Profile Card",
                    config: config
                ) {
                    ProfileCardComponent100(config: config)
                }
                
                // 39. Task Card Component
                ComponentCard100(
                    title: language == "zh" ? "任务卡片" : "Task Card",
                    config: config
                ) {
                    TaskCardComponent100(config: config)
                }
                
                // 40. Comment Component
                ComponentCard100(
                    title: language == "zh" ? "评论" : "Comment",
                    config: config
                ) {
                    CommentComponent100(config: config)
                }
                
                // 41. Data Grid Component
                ComponentCard100(
                    title: language == "zh" ? "数据网格" : "Data Grid",
                    config: config
                ) {
                    DataGridComponent100(config: config)
                }
                
                // 42. Info Widget Component
                ComponentCard100(
                    title: language == "zh" ? "信息小部件" : "Info Widget",
                    config: config
                ) {
                    InfoWidgetComponent100(config: config)
                }
            }
            .padding(48 * config.spacingScale)
        }
    }
}

// MARK: - Component Card Container (100% matching showcase.html)
struct ComponentCard100: View {
    let title: String
    let config: DesignTokensConfig
    let content: () -> AnyView
    
    init<Content: View>(
        title: String,
        config: DesignTokensConfig,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.config = config
        self.content = { AnyView(content()) }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Component title matching .component-title CSS
            Text(title)
                .globalTextStyle(config, size: DesignTokens.Typography.textLG, weight: .semibold) // --text-lg (18px) with 600 weight
                .padding(.bottom, DesignTokens.Spacing.space4) // --space-4 margin-bottom
            
            // Component preview area matching .component-preview CSS
            VStack(spacing: DesignTokens.Spacing.space3) { // gap: --space-3
                content()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer(minLength: 0)
        }
        .padding(DesignTokens.Spacing.space6) // --space-6 padding
        .frame(minHeight: 180, alignment: .top)
        .background(DesignTokens.Colors.card) // --color-card
        .cornerRadius(DesignTokens.Radius.lg) // --radius-lg
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
                .stroke(DesignTokens.Colors.border, lineWidth: 1) // --color-border
        )
    }
}

// MARK: - Individual Components (1-21)

// 1. Button Component
struct ButtonComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            HStack(spacing: 8 * config.spacingScale) {
                Button("Primary") {}
                    .buttonStyle(Primary100ButtonStyle(config: config))
                
                Button("Secondary") {}
                    .buttonStyle(Secondary100ButtonStyle(config: config))
            }
            HStack(spacing: 8 * config.spacingScale) {
                Button("Outline") {}
                    .buttonStyle(Outline100ButtonStyle(config: config))
                
                Button("Ghost") {}
                    .buttonStyle(Ghost100ButtonStyle(config: config))
            }
            Button("Destructive") {}
                .buttonStyle(Destructive100ButtonStyle(config: config))
        }
    }
}

// 2. Input Component
struct InputComponent100: View {
    let config: DesignTokensConfig
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            TextField("Enter text...", text: $text1)
                .textFieldStyle(Input100Style(config: config))
            
            TextField("Email address", text: $text2)
                .textFieldStyle(Input100Style(config: config))
            
            SecureField("Password", text: $text3)
                .textFieldStyle(Input100Style(config: config))
        }
    }
}

// 3. Select Component
struct SelectComponent100: View {
    let config: DesignTokensConfig
    @State private var selected = "Option 1"
    
    var body: some View {
        Menu {
            Button("Option 1") { selected = "Option 1" }
            Button("Option 2") { selected = "Option 2" }
            Button("Option 3") { selected = "Option 3" }
        } label: {
            HStack {
                Text(selected)
                    .globalTextStyle(config, size: 14)
                Spacer()
                Text("▼")
                    .globalTextStyle(config, size: 10)
            }
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
        }
    }
}

// 4. Checkbox Component
struct CheckboxComponent100: View {
    let config: DesignTokensConfig
    @State private var isChecked1 = true
    @State private var isChecked2 = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            Toggle(isOn: $isChecked1) {
                Text("Accept terms")
                    .globalTextStyle(config, size: 14)
            }
            .toggleStyle(Checkbox100Style(config: config))
            
            Toggle(isOn: $isChecked2) {
                Text("Subscribe to newsletter")
                    .globalTextStyle(config, size: 14)
            }
            .toggleStyle(Checkbox100Style(config: config))
        }
    }
}

// 5. Radio Component
struct RadioComponent100: View {
    let config: DesignTokensConfig
    @State private var selectedOption = "A"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            RadioButton100(
                label: "Option A",
                isSelected: selectedOption == "A",
                config: config
            ) {
                selectedOption = "A"
            }
            
            RadioButton100(
                label: "Option B",
                isSelected: selectedOption == "B",
                config: config
            ) {
                selectedOption = "B"
            }
        }
    }
}

// 6. Switch Component
struct SwitchComponent100: View {
    let config: DesignTokensConfig
    @State private var isOn1 = true
    @State private var isOn2 = false
    
    var body: some View {
        HStack(spacing: 16 * config.spacingScale) {
            Toggle("", isOn: $isOn1)
                .toggleStyle(Switch100Style(config: config))
            
            Toggle("", isOn: $isOn2)
                .toggleStyle(Switch100Style(config: config))
        }
    }
}

// 7. Card Component
struct CardComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            Text("Card Title")
                .globalTextStyle(config, size: 16, weight: .semibold)
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Text("This is card content with some text.")
                .globalTextStyle(config, size: 14)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            HStack {
                Button("Action") {}
                    .globalTextStyle(config, size: 12, weight: .medium)
                    .padding(.horizontal, 12 * config.spacingScale)
                    .padding(.vertical, 6 * config.spacingScale)
                    .background(DesignTokens.Colors.primary)
                    .foregroundColor(.white)
                    .cornerRadius(4 * config.radiusScale)
            }
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

// 8. Badge Component
struct BadgeComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Badge100(text: "Default", style: .default, config: config)
            Badge100(text: "Primary", style: .primary, config: config)
            Badge100(text: "Success", style: .success, config: config)
            Badge100(text: "Warning", style: .warning, config: config)
            Badge100(text: "Error", style: .error, config: config)
        }
    }
}

// 9. Alert Component
struct AlertComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            Alert100(icon: "ℹ️", text: "Information message", style: .info, config: config)
            Alert100(icon: "✅", text: "Success message", style: .success, config: config)
            Alert100(icon: "⚠️", text: "Warning message", style: .warning, config: config)
            Alert100(icon: "❌", text: "Error message", style: .error, config: config)
        }
    }
}

// 10. Progress Component
struct ProgressComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            Progress100(value: 0.25, config: config)
            Progress100(value: 0.50, config: config)
            Progress100(value: 0.75, config: config)
        }
    }
}

// 11. Slider Component
struct SliderComponent100: View {
    let config: DesignTokensConfig
    @State private var value1: Double = 50
    @State private var value2: Double = 75
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            Slider(value: $value1, in: 0...100)
                .accentColor(DesignTokens.Colors.primary)
            
            Slider(value: $value2, in: 0...100)
                .accentColor(DesignTokens.Colors.primary)
        }
    }
}

// 12. Textarea Component
struct TextareaComponent100: View {
    let config: DesignTokensConfig
    @State private var text = ""
    
    var body: some View {
        TextEditor(text: $text)
            .frame(height: 80)
            .padding(8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .overlay(
                Group {
                    if text.isEmpty {
                        Text("Enter your message...")
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                            .padding(12 * config.spacingScale)
                            .allowsHitTesting(false)
                    }
                },
                alignment: .topLeading
            )
    }
}

// 13. Avatar Component
struct AvatarComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Avatar100(text: "A", size: .small, config: config)
            Avatar100(text: "B", size: .medium, config: config)
            Avatar100(text: "C", size: .large, config: config)
            
            // Avatar group
            HStack(spacing: -8 * config.spacingScale) {
                Avatar100(text: "D", size: .small, config: config)
                Avatar100(text: "E", size: .small, config: config)
                Avatar100(text: "F", size: .small, config: config)
            }
        }
    }
}

// 14. Tooltip Component
struct TooltipComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 16 * config.spacingScale) {
            Text("Hover me")
                .globalTextStyle(config, size: 14)
                .padding(8 * config.spacingScale)
                .background(DesignTokens.Colors.secondary)
                .cornerRadius(4 * config.radiusScale)
                .help("This is a tooltip")
            
            Button("Button") {}
                .buttonStyle(Secondary100ButtonStyle(config: config))
                .help("Button tooltip")
        }
    }
}

// 15. Tabs Component
struct TabsComponent100: View {
    let config: DesignTokensConfig
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<3) { index in
                    Button(action: { selectedTab = index }) {
                        Text("Tab \(index + 1)")
                            .globalTextStyle(config, size: 14, weight: .medium)
                            .foregroundColor(selectedTab == index ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                            .padding(.horizontal, 16 * config.spacingScale)
                            .padding(.vertical, 8 * config.spacingScale)
                            .background(selectedTab == index ? DesignTokens.Colors.primary.opacity(0.1) : Color.clear)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .overlay(
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: geometry.size.width / 3, height: 2)
                            .offset(x: CGFloat(selectedTab) * geometry.size.width / 3)
                            .animation(.easeInOut(duration: 0.2), value: selectedTab)
                    }
                }
            )
            
            Text("Tab content here")
                .globalTextStyle(config, size: 14)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .padding(16 * config.spacingScale)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(DesignTokens.Colors.muted.opacity(0.3))
        }
    }
}

// 16. Breadcrumb Component
struct BreadcrumbComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Button("Home") {}
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(DesignTokens.Colors.primary)
                .globalTextStyle(config, size: 14)
            
            Text("/")
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .globalTextStyle(config, size: 14)
            
            Button("Products") {}
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(DesignTokens.Colors.primary)
                .globalTextStyle(config, size: 14)
            
            Text("/")
                .foregroundColor(DesignTokens.Colors.mutedForeground)
                .globalTextStyle(config, size: 14)
            
            Text("Details")
                .foregroundColor(DesignTokens.Colors.foreground)
                .globalTextStyle(config, size: 14)
        }
    }
}

// 17. Pagination Component
struct PaginationComponent100: View {
    let config: DesignTokensConfig
    @State private var currentPage = 1
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            Button(action: { if currentPage > 1 { currentPage -= 1 } }) {
                Text("←")
                    .globalTextStyle(config, size: 14)
            }
            .buttonStyle(PageButton100Style(isActive: false, config: config))
            
            ForEach(1...3, id: \.self) { page in
                Button(action: { currentPage = page }) {
                    Text("\(page)")
                        .globalTextStyle(config, size: 14)
                }
                .buttonStyle(PageButton100Style(isActive: currentPage == page, config: config))
            }
            
            Button(action: { if currentPage < 3 { currentPage += 1 } }) {
                Text("→")
                    .globalTextStyle(config, size: 14)
            }
            .buttonStyle(PageButton100Style(isActive: false, config: config))
        }
    }
}

// 18. Table Component
struct TableComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Name")
                    .globalTextStyle(config, size: 14, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Status")
                    .globalTextStyle(config, size: 14, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Price")
                    .globalTextStyle(config, size: 14, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12 * config.spacingScale)
            .background(DesignTokens.Colors.muted.opacity(0.5))
            
            Divider()
            
            // Row 1
            HStack {
                Text("Item 1")
                    .globalTextStyle(config, size: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Badge100(text: "Active", style: .success, config: config)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("$29")
                    .globalTextStyle(config, size: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12 * config.spacingScale)
            
            Divider()
            
            // Row 2
            HStack {
                Text("Item 2")
                    .globalTextStyle(config, size: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Badge100(text: "Pending", style: .default, config: config)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("$49")
                    .globalTextStyle(config, size: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12 * config.spacingScale)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// 19. List Component
struct ListComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(1...3, id: \.self) { index in
                HStack {
                    Text("•")
                        .foregroundColor(DesignTokens.Colors.primary)
                    Text("List item \(index)")
                        .globalTextStyle(config, size: 14)
                }
                .padding(.vertical, 8 * config.spacingScale)
                .padding(.horizontal, 12 * config.spacingScale)
                
                if index < 3 {
                    Divider()
                        .padding(.leading, 24 * config.spacingScale)
                }
            }
        }
        .background(DesignTokens.Colors.muted.opacity(0.3))
        .cornerRadius(6 * config.radiusScale)
    }
}

// 20. Accordion Component
struct AccordionComponent100: View {
    let config: DesignTokensConfig
    @State private var isExpanded = true
    
    var body: some View {
        VStack(spacing: 0) {
            // Section 1 - Expanded
            VStack(spacing: 0) {
                Button(action: { withAnimation { isExpanded.toggle() } }) {
                    HStack {
                        Text("Section 1")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        Spacer()
                        Text(isExpanded ? "▼" : "▶")
                            .globalTextStyle(config, size: 12)
                    }
                    .foregroundColor(DesignTokens.Colors.foreground)
                    .padding(12 * config.spacingScale)
                }
                .buttonStyle(PlainButtonStyle())
                
                if isExpanded {
                    Text("Content for section 1")
                        .globalTextStyle(config, size: 14)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                        .padding(12 * config.spacingScale)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(DesignTokens.Colors.muted.opacity(0.3))
                }
            }
            
            Divider()
            
            // Section 2 - Collapsed
            Button(action: {}) {
                HStack {
                    Text("Section 2")
                        .globalTextStyle(config, size: 14, weight: .medium)
                    Spacer()
                    Text("▶")
                        .globalTextStyle(config, size: 12)
                }
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(12 * config.spacingScale)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .background(DesignTokens.Colors.card)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// 21. Dialog Component
struct DialogComponent100: View {
    let config: DesignTokensConfig
    @State private var showDialog = false
    
    var body: some View {
        VStack(spacing: 12 * config.spacingScale) {
            Button("Open Dialog") {
                showDialog = true
            }
            .buttonStyle(Primary100ButtonStyle(config: config))
            
            // Dialog preview
            VStack(spacing: 0) {
                Text("Dialog Title")
                    .globalTextStyle(config, size: 16, weight: .semibold)
                    .padding(12 * config.spacingScale)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                Text("Dialog content")
                    .globalTextStyle(config, size: 14)
                    .padding(12 * config.spacingScale)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                HStack {
                    Spacer()
                    Button("Cancel") {}
                        .buttonStyle(Ghost100ButtonStyle(config: config))
                    Button("Confirm") {}
                        .buttonStyle(Primary100ButtonStyle(config: config))
                }
                .padding(12 * config.spacingScale)
            }
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
            .scaleEffect(0.8)
            .opacity(0.8)
        }
    }
}

// 22. Dropdown Component
struct DropdownComponent100: View {
    let config: DesignTokensConfig
    @State private var showMenu = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: { showMenu.toggle() }) {
                HStack {
                    Text("Options")
                        .globalTextStyle(config, size: 14)
                    Text("▼")
                        .globalTextStyle(config, size: 10)
                }
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(.horizontal, 12 * config.spacingScale)
                .padding(.vertical, 8 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .overlay(
                    RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                )
            }
            
            if showMenu {
                VStack(alignment: .leading, spacing: 0) {
                    Button("Edit") {}
                        .buttonStyle(DropdownItem100Style(config: config))
                    Button("Duplicate") {}
                        .buttonStyle(DropdownItem100Style(config: config))
                    Divider()
                    Button("Delete") {}
                        .buttonStyle(DropdownItem100Style(config: config, isDestructive: true))
                }
                .background(DesignTokens.Colors.card)
                .cornerRadius(4 * config.radiusScale)
                .shadow(radius: 4)
            }
        }
    }
}

// Remaining components (23-42)
struct ChipComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Chip100(text: "React", config: config)
            Chip100(text: "Vue", config: config)
            Chip100(text: "Angular", config: config)
            Chip100(text: "Svelte ×", isRemovable: true, config: config)
        }
    }
}

struct SkeletonComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            Skeleton100(width: 200, height: 12, config: config)
            Skeleton100(width: 160, height: 12, config: config)
            Skeleton100(width: 120, height: 12, config: config)
            Skeleton100(width: 80, height: 40, config: config)
        }
    }
}

struct StepperComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 0) {
            StepperItem100(number: "✓", label: "Step 1", isCompleted: true, config: config)
            StepperLine100(config: config)
            StepperItem100(number: "2", label: "Step 2", isActive: true, config: config)
            StepperLine100(config: config)
            StepperItem100(number: "3", label: "Step 3", config: config)
        }
    }
}

struct TimelineComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TimelineItem100(title: "Event 1", time: "10:00 AM", config: config)
            TimelineItem100(title: "Event 2", time: "2:00 PM", config: config)
        }
    }
}

struct RatingComponent100: View {
    let config: DesignTokensConfig
    @State private var rating1 = 4
    @State private var rating2 = 3
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            RatingStars100(rating: rating1, config: config)
            RatingStars100(rating: rating2, config: config)
        }
    }
}

struct NavigationComponent100: View {
    let config: DesignTokensConfig
    @State private var selectedItem = "Home"
    
    var body: some View {
        HStack(spacing: 16 * config.spacingScale) {
            ForEach(["Home", "About", "Services", "Contact"], id: \.self) { item in
                Button(item) { selectedItem = item }
                    .buttonStyle(NavItem100Style(isActive: selectedItem == item, config: config))
            }
        }
    }
}

struct SearchComponent100: View {
    let config: DesignTokensConfig
    @State private var searchText = ""
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("Search...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 12 * config.spacingScale)
                .padding(.vertical, 8 * config.spacingScale)
                .globalTextStyle(config, size: 14)
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .globalTextStyle(config, size: 14)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                    .padding(8 * config.spacingScale)
            }
        }
        .background(DesignTokens.Colors.background)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct FileUploadComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            Image(systemName: "folder")
                .globalTextStyle(config, size: 32, weight: .bold)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Text("Drop files here or click to browse")
                .globalTextStyle(config, size: 14)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(24 * config.spacingScale)
        .frame(maxWidth: .infinity)
        .background(DesignTokens.Colors.muted.opacity(0.3))
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                .foregroundColor(DesignTokens.Colors.border)
        )
    }
}

struct StatsCardComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 16 * config.spacingScale) {
            StatsCard100(label: "Total Revenue", value: "$24,567", change: "↑ 12.5%", isPositive: true, config: config)
            StatsCard100(label: "Active Users", value: "1,234", change: "↓ 3.2%", isPositive: false, config: config)
        }
    }
}

struct NotificationComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 12 * config.spacingScale) {
            Text("ℹ")
                .globalTextStyle(config, size: 20)
                .foregroundColor(DesignTokens.Colors.primary)
            
            VStack(alignment: .leading, spacing: 2 * config.spacingScale) {
                Text("New message")
                    .globalTextStyle(config, size: 14, weight: .semibold)
                Text("You have 3 unread messages")
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            Spacer()
            
            Button("×") {}
                .globalTextStyle(config, size: 20)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(6 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct KeyboardComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            KeyboardShortcut100(keys: ["⌘", "K"], config: config)
            KeyboardShortcut100(keys: ["Ctrl", "C"], config: config)
        }
    }
}

struct LoadingComponent100: View {
    let config: DesignTokensConfig
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: DesignTokens.Colors.primary))
                .scaleEffect(1.5)
            
            Text("Loading...")
                .globalTextStyle(config, size: 14)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct MetricComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 16 * config.spacingScale) {
            MetricDisplay100(label: "CPU Usage", value: "68", unit: "%", progress: 0.68, config: config)
            MetricDisplay100(label: "Memory", value: "4.2", unit: "GB", progress: 0.85, isWarning: true, config: config)
        }
    }
}

struct CommandPaletteComponent100: View {
    let config: DesignTokensConfig
    @State private var commandText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8 * config.spacingScale) {
                Text("⌘")
                    .globalTextStyle(config, size: 14)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                TextField("Type a command...", text: $commandText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .globalTextStyle(config, size: 14)
            }
            .padding(12 * config.spacingScale)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 0) {
                CommandItem100(shortcut: "⌘K", name: "Open Quick Search", config: config)
                CommandItem100(shortcut: "⌘P", name: "Open File", isActive: true, config: config)
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

struct ActivityFeedComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            ActivityItem100(user: "Alice", action: "created a new project", time: "2 minutes ago", config: config)
            ActivityItem100(user: "Bob", action: "completed task", time: "1 hour ago", isSuccess: true, config: config)
        }
    }
}

struct ProfileCardComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 16 * config.spacingScale) {
            HStack(spacing: 12 * config.spacingScale) {
                Text("JD")
                    .globalTextStyle(config, size: 20, weight: .semibold)
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)
                    .background(DesignTokens.Colors.primary)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("John Doe")
                        .globalTextStyle(config, size: 16, weight: .semibold)
                    Text("Senior Developer")
                        .globalTextStyle(config, size: 14)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                
                Spacer()
            }
            
            HStack(spacing: 24 * config.spacingScale) {
                ProfileStat100(value: "152", label: "Projects", config: config)
                ProfileStat100(value: "4.8", label: "Rating", config: config)
            }
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

struct TaskCardComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            HStack {
                Text("High")
                    .globalTextStyle(config, size: 10, weight: .semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6 * config.spacingScale)
                    .padding(.vertical, 2 * config.spacingScale)
                    .background(Color.red)
                    .cornerRadius(3 * config.radiusScale)
                
                Spacer()
                
                Text("#1234")
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            Text("Implement user authentication")
                .globalTextStyle(config, size: 14, weight: .medium)
            
            HStack(spacing: 12 * config.spacingScale) {
                Label("John", systemImage: "person.fill")
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                Label("Tomorrow", systemImage: "calendar")
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            HStack(spacing: 6 * config.spacingScale) {
                TaskTag100(text: "Backend", config: config)
                TaskTag100(text: "Security", config: config)
            }
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(6 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct CommentComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(alignment: .top, spacing: 12 * config.spacingScale) {
            Text("A")
                .globalTextStyleNoColor(config, size: 14, weight: .semibold)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(DesignTokens.Colors.primary)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                HStack {
                    Text("Alice Smith")
                        .globalTextStyle(config, size: 14, weight: .semibold)
                    Text("2 hours ago")
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                
                Text("This is a great implementation. The design tokens really make it flexible!")
                    .globalTextStyle(config, size: 14)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack(spacing: 12 * config.spacingScale) {
                    Button("👍 12") {}
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Button("Reply") {}
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.primary)
                }
            }
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.muted.opacity(0.3))
        .cornerRadius(6 * config.radiusScale)
    }
}

struct DataGridComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("ID")
                    .globalTextStyle(config, size: 12, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Name")
                    .globalTextStyle(config, size: 12, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Status")
                    .globalTextStyle(config, size: 12, weight: .semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(8 * config.spacingScale)
            .background(DesignTokens.Colors.muted.opacity(0.5))
            
            // Rows
            ForEach(0..<2) { index in
                Divider()
                HStack {
                    Text("00\(index + 1)")
                        .globalTextStyle(config, size: 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Project \(index == 0 ? "Alpha" : "Beta")")
                        .globalTextStyle(config, size: 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Badge100(
                        text: index == 0 ? "Active" : "Pending",
                        style: index == 0 ? .success : .default,
                        config: config
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(8 * config.spacingScale)
            }
        }
        .background(DesignTokens.Colors.card)
        .overlay(
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct InfoWidgetComponent100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            HStack(spacing: 8 * config.spacingScale) {
                Text("☀️")
                    .globalTextStyle(config, size: 20)
                Text("Today's Weather")
                    .globalTextStyle(config, size: 14, weight: .semibold)
            }
            
            HStack(alignment: .bottom, spacing: 4) {
                Text("23")
                    .globalTextStyle(config, size: 32, weight: .bold)
                Text("°C")
                    .globalTextStyle(config, size: 16)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            HStack(spacing: 12 * config.spacingScale) {
                Text("Sunny")
                    .globalTextStyle(config, size: 12)
                Text("Humidity: 65%")
                    .globalTextStyle(config, size: 12)
            }
            .foregroundColor(DesignTokens.Colors.mutedForeground)
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

// MARK: - Helper Components and Styles

// Button Styles (100% matching showcase.html CSS)
struct Primary100ButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyleNoColor(config, size: DesignTokens.Typography.textSM) // --text-sm
            .foregroundColor(DesignTokens.Colors.primaryForeground) // --color-primary-foreground
            .padding(.horizontal, DesignTokens.Spacing.space4) // --space-4
            .padding(.vertical, DesignTokens.Spacing.space2) // --space-2
            .background(configuration.isPressed ? DesignTokens.Colors.primary.opacity(0.9) : DesignTokens.Colors.primary)
            .cornerRadius(DesignTokens.Radius.md) // --radius-md
    }
}

struct Secondary100ButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyleNoColor(config, size: DesignTokens.Typography.textSM) // --text-sm
            .foregroundColor(DesignTokens.Colors.secondaryForeground) // --color-secondary-foreground
            .padding(.horizontal, DesignTokens.Spacing.space4) // --space-4
            .padding(.vertical, DesignTokens.Spacing.space2) // --space-2
            .background(configuration.isPressed ? DesignTokens.Colors.secondary.opacity(0.9) : DesignTokens.Colors.secondary)
            .cornerRadius(DesignTokens.Radius.md) // --radius-md
    }
}

struct Outline100ButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyleNoColor(config, size: DesignTokens.Typography.textSM) // --text-sm
            .foregroundColor(DesignTokens.Colors.primary) // --color-primary
            .padding(.horizontal, DesignTokens.Spacing.space4) // --space-4
            .padding(.vertical, DesignTokens.Spacing.space2) // --space-2
            .background(configuration.isPressed ? DesignTokens.Colors.primary.opacity(0.1) : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .stroke(DesignTokens.Colors.brandColor(for: 600), lineWidth: 1) // --brand-600
            )
    }
}

struct Ghost100ButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyleNoColor(config, size: DesignTokens.Typography.textSM) // --text-sm
            .foregroundColor(DesignTokens.Colors.foreground) // --color-foreground
            .padding(.horizontal, DesignTokens.Spacing.space4) // --space-4
            .padding(.vertical, DesignTokens.Spacing.space2) // --space-2
            .background(configuration.isPressed ? DesignTokens.Colors.muted.opacity(0.5) : Color.clear)
            .cornerRadius(DesignTokens.Radius.md) // --radius-md
    }
}

struct Destructive100ButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyleNoColor(config, size: DesignTokens.Typography.textSM) // --text-sm
            .foregroundColor(DesignTokens.Colors.primaryForeground) // --color-primary-foreground (same as primary)
            .padding(.horizontal, DesignTokens.Spacing.space4) // --space-4
            .padding(.vertical, DesignTokens.Spacing.space2) // --space-2
            .background(configuration.isPressed ? DesignTokens.Colors.danger.opacity(0.9) : DesignTokens.Colors.danger)
            .cornerRadius(DesignTokens.Radius.md) // --radius-md
    }
}

// Input Style
struct Input100Style: TextFieldStyle {
    let config: DesignTokensConfig
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            .overlay(
                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
    }
}

// Checkbox Style
struct Checkbox100Style: ToggleStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8 * config.spacingScale) {
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .fill(configuration.isOn ? DesignTokens.Colors.primary : DesignTokens.Colors.background)
                .frame(width: 16, height: 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                        .stroke(configuration.isOn ? DesignTokens.Colors.primary : DesignTokens.Colors.border, lineWidth: 1)
                )
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .opacity(configuration.isOn ? 1 : 0)
                )
            configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}

// Radio Button
struct RadioButton100: View {
    let label: String
    let isSelected: Bool
    let config: DesignTokensConfig
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8 * config.spacingScale) {
                Circle()
                    .stroke(isSelected ? DesignTokens.Colors.primary : DesignTokens.Colors.border, lineWidth: 1)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Circle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: 8, height: 8)
                            .opacity(isSelected ? 1 : 0)
                    )
                Text(label)
                    .globalTextStyle(config, size: 14)
                    .foregroundColor(DesignTokens.Colors.foreground)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Switch Style
struct Switch100Style: ToggleStyle {
    let config: DesignTokensConfig
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(configuration.isOn ? DesignTokens.Colors.primary : DesignTokens.Colors.muted)
            .frame(width: 44, height: 24)
            .overlay(
                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .offset(x: configuration.isOn ? 10 : -10)
                    .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
            )
            .onTapGesture { configuration.isOn.toggle() }
    }
}

// Badge
struct Badge100: View {
    let text: String
    let style: BadgeStyle
    let config: DesignTokensConfig
    
    enum BadgeStyle {
        case `default`, primary, success, warning, error
    }
    
    var body: some View {
        Text(text)
            .globalTextStyle(config, size: 11, weight: .medium)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, 8 * config.spacingScale)
            .padding(.vertical, 4 * config.spacingScale)
            .background(backgroundColor)
            .cornerRadius(4 * config.radiusScale)
    }
    
    var backgroundColor: Color {
        switch style {
        case .default: return DesignTokens.Colors.muted
        case .primary: return DesignTokens.Colors.primary
        case .success: return Color.green
        case .warning: return Color.orange
        case .error: return Color.red
        }
    }
    
    var foregroundColor: Color {
        switch style {
        case .default: return DesignTokens.Colors.foreground
        default: return .white
        }
    }
}

// Alert
struct Alert100: View {
    let icon: String
    let text: String
    let style: AlertStyle
    let config: DesignTokensConfig
    
    enum AlertStyle {
        case info, success, warning, error
    }
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Text(icon)
                .globalTextStyle(config, size: 16)
            Text(text)
                .globalTextStyle(config, size: 14)
        }
        .padding(12 * config.spacingScale)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(backgroundColor, lineWidth: 1)
        )
    }
    
    var backgroundColor: Color {
        switch style {
        case .info: return DesignTokens.Colors.primary
        case .success: return Color.green
        case .warning: return Color.orange
        case .error: return Color.red
        }
    }
}

// Progress
struct Progress100: View {
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

// Avatar
struct Avatar100: View {
    let text: String
    let size: AvatarSize
    let config: DesignTokensConfig
    
    enum AvatarSize {
        case small, medium, large
        
        var dimension: CGFloat {
            switch self {
            case .small: return 24
            case .medium: return 32
            case .large: return 40
            }
        }
        
        var fontSize: CGFloat {
            switch self {
            case .small: return 10
            case .medium: return 14
            case .large: return 18
            }
        }
    }
    
    var body: some View {
        Text(text)
            .globalTextStyleNoColor(config, size: size.fontSize, weight: .semibold)
            .foregroundColor(.white)
            .frame(width: size.dimension, height: size.dimension)
            .background(DesignTokens.Colors.primary)
            .clipShape(Circle())
    }
}

// Helper components for remaining items
struct PageButton100Style: ButtonStyle {
    let isActive: Bool
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isActive ? .white : DesignTokens.Colors.foreground)
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 6 * config.spacingScale)
            .background(isActive ? DesignTokens.Colors.primary : DesignTokens.Colors.muted.opacity(0.5))
            .cornerRadius(4 * config.radiusScale)
    }
}

struct DropdownItem100Style: ButtonStyle {
    let config: DesignTokensConfig
    let isDestructive: Bool
    
    init(config: DesignTokensConfig, isDestructive: Bool = false) {
        self.config = config
        self.isDestructive = isDestructive
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyle(config, size: 14)
            .foregroundColor(isDestructive ? Color.red : DesignTokens.Colors.foreground)
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(configuration.isPressed ? DesignTokens.Colors.muted.opacity(0.5) : Color.clear)
    }
}

struct Chip100: View {
    let text: String
    let isRemovable: Bool
    let config: DesignTokensConfig
    
    init(text: String, isRemovable: Bool = false, config: DesignTokensConfig) {
        self.text = text
        self.isRemovable = isRemovable
        self.config = config
    }
    
    var body: some View {
        Text(text)
            .globalTextStyle(config, size: 12)
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 6 * config.spacingScale)
            .background(DesignTokens.Colors.muted)
            .cornerRadius(12 * config.radiusScale)
    }
}

struct Skeleton100: View {
    let width: CGFloat
    let height: CGFloat
    let config: DesignTokensConfig
    
    var body: some View {
        Rectangle()
            .fill(DesignTokens.Colors.muted)
            .frame(width: width, height: height)
            .cornerRadius(4 * config.radiusScale)
            .redacted(reason: .placeholder)
    }
}

struct StepperItem100: View {
    let number: String
    let label: String
    let isCompleted: Bool
    let isActive: Bool
    let config: DesignTokensConfig
    
    init(number: String, label: String, isCompleted: Bool = false, isActive: Bool = false, config: DesignTokensConfig) {
        self.number = number
        self.label = label
        self.isCompleted = isCompleted
        self.isActive = isActive
        self.config = config
    }
    
    var body: some View {
        VStack(spacing: 4 * config.spacingScale) {
            Text(number)
                .globalTextStyleNoColor(config, size: 14, weight: .semibold)
                .foregroundColor(isCompleted || isActive ? .white : DesignTokens.Colors.mutedForeground)
                .frame(width: 32, height: 32)
                .background(isCompleted || isActive ? DesignTokens.Colors.primary : DesignTokens.Colors.muted)
                .clipShape(Circle())
            
            Text(label)
                .globalTextStyle(config, size: 10)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct StepperLine100: View {
    let config: DesignTokensConfig
    
    var body: some View {
        Rectangle()
            .fill(DesignTokens.Colors.border)
            .frame(width: 40, height: 1)
    }
}

struct TimelineItem100: View {
    let title: String
    let time: String
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(alignment: .top, spacing: 12 * config.spacingScale) {
            VStack(spacing: 4) {
                Circle()
                    .fill(DesignTokens.Colors.primary)
                    .frame(width: 8, height: 8)
                Rectangle()
                    .fill(DesignTokens.Colors.border)
                    .frame(width: 1, height: 40)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .globalTextStyle(config, size: 14, weight: .medium)
                Text(time)
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
        }
    }
}

struct RatingStars100: View {
    let rating: Int
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { index in
                Text("★")
                    .globalTextStyle(config, size: 20)
                    .foregroundColor(index <= rating ? Color.orange : DesignTokens.Colors.muted)
            }
        }
    }
}

struct NavItem100Style: ButtonStyle {
    let isActive: Bool
    let config: DesignTokensConfig
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .globalTextStyle(config, size: 14, weight: isActive ? .semibold : .regular)
            .foregroundColor(isActive ? DesignTokens.Colors.primary : DesignTokens.Colors.foreground)
            .padding(.vertical, 4 * config.spacingScale)
            .overlay(
                isActive ? Rectangle()
                    .fill(DesignTokens.Colors.primary)
                    .frame(height: 2)
                    .offset(y: 12) : nil,
                alignment: .bottom
            )
    }
}

// Continue with remaining helper components...
struct StatsCard100: View {
    let label: String
    let value: String
    let change: String
    let isPositive: Bool
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            Text(label)
                .globalTextStyle(config, size: 12)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            Text(value)
                .globalTextStyle(config, size: 24, weight: .bold)
            Text(change)
                .globalTextStyle(config, size: 12, weight: .medium)
                .foregroundColor(isPositive ? Color.green : Color.red)
        }
        .padding(12 * config.spacingScale)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DesignTokens.Colors.card)
        .cornerRadius(6 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

struct KeyboardShortcut100: View {
    let keys: [String]
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            ForEach(keys, id: \.self) { key in
                Text(key)
                    .globalTextStyle(config, size: 12, weight: .medium)
                    .padding(.horizontal, 8 * config.spacingScale)
                    .padding(.vertical, 4 * config.spacingScale)
                    .background(DesignTokens.Colors.muted)
                    .cornerRadius(4 * config.radiusScale)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                            .stroke(DesignTokens.Colors.border, lineWidth: 1)
                    )
                
                if key != keys.last {
                    Text("+")
                        .globalTextStyle(config, size: 10)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
            }
        }
    }
}

struct MetricDisplay100: View {
    let label: String
    let value: String
    let unit: String
    let progress: Double
    let isWarning: Bool
    let config: DesignTokensConfig
    
    init(label: String, value: String, unit: String, progress: Double, isWarning: Bool = false, config: DesignTokensConfig) {
        self.label = label
        self.value = value
        self.unit = unit
        self.progress = progress
        self.isWarning = isWarning
        self.config = config
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            Text(label)
                .globalTextStyle(config, size: 12)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            HStack(alignment: .bottom, spacing: 4) {
                Text(value)
                    .globalTextStyle(config, size: 24, weight: .bold)
                Text(unit)
                    .globalTextStyle(config, size: 14)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2 * config.radiusScale)
                        .fill(DesignTokens.Colors.muted)
                        .frame(height: 4)
                    
                    RoundedRectangle(cornerRadius: 2 * config.radiusScale)
                        .fill(isWarning ? Color.orange : DesignTokens.Colors.primary)
                        .frame(width: geometry.size.width * progress, height: 4)
                }
            }
            .frame(height: 4)
        }
    }
}

struct CommandItem100: View {
    let shortcut: String
    let name: String
    let isActive: Bool
    let config: DesignTokensConfig
    
    init(shortcut: String, name: String, isActive: Bool = false, config: DesignTokensConfig) {
        self.shortcut = shortcut
        self.name = name
        self.isActive = isActive
        self.config = config
    }
    
    var body: some View {
        HStack {
            Text(shortcut)
                .globalTextStyle(config, size: 12, weight: .medium)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            Text(name)
                .globalTextStyle(config, size: 14)
            Spacer()
        }
        .padding(.horizontal, 12 * config.spacingScale)
        .padding(.vertical, 8 * config.spacingScale)
        .background(isActive ? DesignTokens.Colors.primary.opacity(0.1) : Color.clear)
    }
}

struct ActivityItem100: View {
    let user: String
    let action: String
    let time: String
    let isSuccess: Bool
    let config: DesignTokensConfig
    
    init(user: String, action: String, time: String, isSuccess: Bool = false, config: DesignTokensConfig) {
        self.user = user
        self.action = action
        self.time = time
        self.isSuccess = isSuccess
        self.config = config
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12 * config.spacingScale) {
            Circle()
                .fill(isSuccess ? Color.green : DesignTokens.Colors.primary)
                .frame(width: 8, height: 8)
                .padding(.top, 6)
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text(user)
                        .globalTextStyle(config, size: 14, weight: .semibold)
                    Text(action)
                        .globalTextStyle(config, size: 14)
                }
                Text(time)
                    .globalTextStyle(config, size: 12)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
        }
    }
}

struct ProfileStat100: View {
    let value: String
    let label: String
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .globalTextStyle(config, size: 20, weight: .bold)
            Text(label)
                .globalTextStyle(config, size: 12)
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
    }
}

struct TaskTag100: View {
    let text: String
    let config: DesignTokensConfig
    
    var body: some View {
        Text(text)
            .globalTextStyle(config, size: 10)
            .padding(.horizontal, 6 * config.spacingScale)
            .padding(.vertical, 2 * config.spacingScale)
            .background(DesignTokens.Colors.muted.opacity(0.5))
            .cornerRadius(3 * config.radiusScale)
    }
}