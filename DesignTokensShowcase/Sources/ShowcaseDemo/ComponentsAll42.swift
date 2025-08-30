//
//  ComponentsAll42.swift
//  All 42 components from showcase.html with full reactivity
//

import SwiftUI
import DesignTokensKit

// MARK: - Missing Preview Components
struct DrawerPreview: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            HStack {
                Image(systemName: "sidebar.left")
                    .font(.system(size: 16 * config.fontScale))
                Text("Drawer Preview")
                    .globalTextStyle(config, size: 12)
            }
            .foregroundColor(DesignTokens.Colors.foreground)
            
            Text("Click to open drawer")
                .secondaryTextStyle(config, size: 10)
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.secondary)
        .cornerRadius(6 * config.radiusScale)
    }
}

struct PopoverPreview: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Button("Hover me") {}
                .globalTextStyle(config, size: 12)
                .padding(.horizontal, 12 * config.spacingScale)
                .padding(.vertical, 6 * config.spacingScale)
                .background(DesignTokens.Colors.secondary)
                .foregroundColor(DesignTokens.Colors.foreground)
                .cornerRadius(4 * config.radiusScale)
            
            Text("→ Popover")
                .secondaryTextStyle(config, size: 10)
        }
    }
}

struct ComponentsAll42View: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 组件网格 - 使用ScrollView包裹以确保所有组件可见
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(minimum: 280, maximum: .infinity), spacing: 32 * config.spacingScale),
                        GridItem(.flexible(minimum: 280, maximum: .infinity), spacing: 32 * config.spacingScale),
                        GridItem(.flexible(minimum: 280, maximum: .infinity), spacing: 32 * config.spacingScale)
                    ],
                    spacing: 32 * config.spacingScale
                ) {
                    // Components 1-10 from ComponentsExact
                        // 1. 按钮 Button
                        ComponentCardAll42(title: language == "zh" ? "按钮" : "Button", config: config) {
                            VStack(spacing: 8 * config.spacingScale) {
                                HStack(spacing: 8 * config.spacingScale) {
                                    Button("Primary") {}
                                        .buttonStyle(PrimaryButtonComponentStyle(config: config))
                                    
                                    Button("Secondary") {}
                                        .buttonStyle(SecondaryButtonComponentStyle(config: config))
                                }
                                
                                HStack(spacing: 8 * config.spacingScale) {
                                    Button("Outline") {}
                                        .buttonStyle(OutlineButtonComponentStyle(config: config))
                                    
                                    Button("Ghost") {}
                                        .buttonStyle(GhostButtonComponentStyle(config: config))
                                }
                            }
                        }
                        
                        // 2. 输入框 Input
                        ComponentCardAll42(title: language == "zh" ? "输入框" : "Input", config: config) {
                            InputField(placeholder: "Enter text...", config: config)
                        }
                        
                        // 3. 文本域 Textarea
                        ComponentCardAll42(title: language == "zh" ? "文本域" : "Textarea", config: config) {
                            TextAreaField(placeholder: "Enter multiple lines...", config: config)
                        }
                        
                        // 4. 选择器 Select
                        ComponentCardAll42(title: language == "zh" ? "选择器" : "Select", config: config) {
                            SelectField(config: config, options: ["Option 1", "Option 2", "Option 3"])
                        }
                        
                        // 5. 复选框 Checkbox
                        ComponentCardAll42(title: language == "zh" ? "复选框" : "Checkbox", config: config) {
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                CheckboxField(label: "Option 1", isChecked: true, config: config)
                                CheckboxField(label: "Option 2", isChecked: false, config: config)
                                CheckboxField(label: "Option 3", isChecked: false, config: config)
                            }
                        }
                        
                        // 6. 单选按钮 Radio
                        ComponentCardAll42(title: language == "zh" ? "单选按钮" : "Radio", config: config) {
                            RadioGroup(config: config, options: ["Option 1", "Option 2", "Option 3"])
                        }
                        
                        // 7. 开关 Toggle
                        ComponentCardAll42(title: language == "zh" ? "开关" : "Toggle", config: config) {
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                SwitchField(label: "Enabled", isOn: true, config: config)
                                SwitchField(label: "Disabled", isOn: false, config: config)
                            }
                        }
                        
                        // 8. 滑块 Slider
                        ComponentCardAll42(title: language == "zh" ? "滑块" : "Slider", config: config) {
                            SliderField(value: 0.5, config: config)
                        }
                        
                        // 9. 进度条 Progress
                        ComponentCardAll42(title: language == "zh" ? "进度条" : "Progress", config: config) {
                            VStack(spacing: 8 * config.spacingScale) {
                                ProgressBar(value: 0.3, config: config)
                                ProgressBar(value: 0.6, config: config)
                                ProgressBar(value: 0.9, config: config)
                            }
                        }
                        
                        // 10. 徽章 Badge
                        ComponentCardAll42(title: language == "zh" ? "徽章" : "Badge", config: config) {
                            HStack(spacing: 8 * config.spacingScale) {
                                BadgeView(text: "New", type: .primary, config: config)
                                BadgeView(text: "Hot", type: .error, config: config)
                                BadgeView(text: "Pro", type: .success, config: config)
                            }
                        }
                    
                    // Components 11-21
                    // 11. 标签 Tag
                        ComponentCardAll42(title: language == "zh" ? "标签" : "Tag", config: config) {
                            HStack(spacing: 8 * config.spacingScale) {
                                TagComponent(text: "Tag 1", config: config)
                                TagComponent(text: "Tag 2", config: config)
                                TagComponent(text: "Tag 3", config: config)
                            }
                        }
                        
                        // 12. 提示 Alert
                        ComponentCardAll42(title: language == "zh" ? "提示" : "Alert", config: config) {
                            VStack(spacing: 8 * config.spacingScale) {
                                Alert(icon: "ℹ️", message: "Info message", type: .info, config: config)
                                Alert(icon: "✅", message: "Success message", type: .success, config: config)
                                Alert(icon: "⚠️", message: "Warning message", type: .warning, config: config)
                                Alert(icon: "❌", message: "Error message", type: .error, config: config)
                            }
                        }
                        
                        // 13. 卡片 Card
                        ComponentCardAll42(title: language == "zh" ? "卡片" : "Card", config: config) {
                            CardView(title: "Card Title", content: "This is card content showing the basic card layout.", config: config)
                        }
                        
                        // 14. 模态框 Modal
                        ComponentCardAll42(title: language == "zh" ? "模态框" : "Modal", config: config) {
                            DialogPreview(config: config)
                        }
                        
                        // 15. 抽屉 Drawer
                        ComponentCardAll42(title: language == "zh" ? "抽屉" : "Drawer", config: config) {
                            DrawerPreview(config: config)
                        }
                        
                        // 16. 工具提示 Tooltip
                        ComponentCardAll42(title: language == "zh" ? "工具提示" : "Tooltip", config: config) {
                            TooltipView(text: "Hover over me", tooltip: "This is a tooltip", config: config)
                        }
                        
                        // 17. 气泡卡片 Popover
                        ComponentCardAll42(title: language == "zh" ? "气泡卡片" : "Popover", config: config) {
                            PopoverPreview(config: config)
                        }
                        
                        // 18. 面包屑 Breadcrumb
                        ComponentCardAll42(title: language == "zh" ? "面包屑" : "Breadcrumb", config: config) {
                            BreadcrumbView(items: ["Home", "Products", "Details"], config: config)
                        }
                        
                        // 19. 分页 Pagination
                        ComponentCardAll42(title: language == "zh" ? "分页" : "Pagination", config: config) {
                            PaginationView(currentPage: 1, totalPages: 5, config: config)
                        }
                        
                        // 20. 标签页 Tabs
                        ComponentCardAll42(title: language == "zh" ? "标签页" : "Tabs", config: config) {
                            TabsView(tabs: ["Tab 1", "Tab 2", "Tab 3"], config: config)
                        }
                        
                        // 21. 折叠面板 Accordion
                        ComponentCardAll42(title: language == "zh" ? "折叠面板" : "Accordion", config: config) {
                            AccordionView(config: config)
                        }
                    
                    // Components 22-31 from ComponentsAdditional
                        // 22. 下拉菜单 Dropdown
                        ComponentCardAll42(title: language == "zh" ? "下拉菜单" : "Dropdown", config: config) {
                            DropdownMenu(config: config)
                        }
                        
                        // 23. 标签 Chip
                        ComponentCardAll42(title: language == "zh" ? "标签" : "Chip", config: config) {
                            HStack(spacing: 8 * config.spacingScale) {
                                ChipView(text: "Chip 1", config: config)
                                ChipView(text: "Chip 2", config: config)
                                ChipView(text: "Chip 3", config: config)
                            }
                        }
                        
                        // 24. 骨架屏 Skeleton
                        ComponentCardAll42(title: language == "zh" ? "骨架屏" : "Skeleton", config: config) {
                            SkeletonView(config: config)
                        }
                        
                        // 25. 步骤条 Stepper
                        ComponentCardAll42(title: language == "zh" ? "步骤条" : "Stepper", config: config) {
                            StepperView(config: config)
                        }
                        
                        // 26. 时间线 Timeline
                        ComponentCardAll42(title: language == "zh" ? "时间线" : "Timeline", config: config) {
                            TimelineView(config: config)
                        }
                        
                        // 27. 评分 Rating
                        ComponentCardAll42(title: language == "zh" ? "评分" : "Rating", config: config) {
                            RatingView(config: config)
                        }
                        
                        // 28. 导航 Navigation
                        ComponentCardAll42(title: language == "zh" ? "导航" : "Navigation", config: config) {
                            NavigationView(config: config)
                        }
                        
                        // 29. 搜索 Search
                        ComponentCardAll42(title: language == "zh" ? "搜索" : "Search", config: config) {
                            SearchView(config: config)
                        }
                        
                        // 30. 文件上传 File Upload
                        ComponentCardAll42(title: language == "zh" ? "文件上传" : "File Upload", config: config) {
                            FileUploadView(config: config)
                        }
                        
                        // 31. 统计卡片 Stats Card
                        ComponentCardAll42(title: language == "zh" ? "统计卡片" : "Stats Card", config: config) {
                            StatsCardView(config: config)
                        }
                    
                    // Components 32-42
                        // 32. 通知 Notification
                        ComponentCardAll42(title: language == "zh" ? "通知" : "Notification", config: config) {
                            NotificationView(config: config)
                        }
                        
                        // 33. 键盘快捷键 Keyboard
                        ComponentCardAll42(title: language == "zh" ? "键盘快捷键" : "Keyboard", config: config) {
                            KeyboardShortcutView(config: config)
                        }
                        
                        // 34. 加载动画 Loading
                        ComponentCardAll42(title: language == "zh" ? "加载动画" : "Loading", config: config) {
                            LoadingView(config: config)
                        }
                        
                        // 35. 指标展示 Metric
                        ComponentCardAll42(title: language == "zh" ? "指标展示" : "Metric", config: config) {
                            MetricView(config: config)
                        }
                        
                        // 36. 命令面板 Command Palette
                        ComponentCardAll42(title: language == "zh" ? "命令面板" : "Command Palette", config: config) {
                            CommandPaletteView(config: config)
                        }
                        
                        // 37. 活动信息流 Activity Feed
                        ComponentCardAll42(title: language == "zh" ? "活动信息流" : "Activity Feed", config: config) {
                            ActivityFeedView(config: config)
                        }
                        
                        // 38. 个人资料卡 Profile Card
                        ComponentCardAll42(title: language == "zh" ? "个人资料卡" : "Profile Card", config: config) {
                            ProfileCardView(config: config)
                        }
                        
                        // 39. 任务卡片 Task Card
                        ComponentCardAll42(title: language == "zh" ? "任务卡片" : "Task Card", config: config) {
                            TaskCardView(config: config)
                        }
                        
                        // 40. 评论 Comment
                        ComponentCardAll42(title: language == "zh" ? "评论" : "Comment", config: config) {
                            CommentView(config: config)
                        }
                        
                        // 41. 数据网格 Data Grid
                        ComponentCardAll42(title: language == "zh" ? "数据网格" : "Data Grid", config: config) {
                            DataGridView(config: config)
                        }
                        
                        // 42. 信息小部件 Info Widget
                        ComponentCardAll42(title: language == "zh" ? "信息小部件" : "Info Widget", config: config) {
                            InfoWidgetView(config: config)
                        }
                }
                .padding(.bottom, 40 * config.spacingScale)
            }
            .frame(maxHeight: .infinity)
        }
    }
}

// MARK: - 组件卡片容器
struct ComponentCardAll42<Content: View>: View {
    let title: String
    @ObservedObject var config: DesignTokensConfig
    let content: Content
    
    init(title: String, config: DesignTokensConfig, @ViewBuilder content: () -> Content) {
        self.title = title
        self.config = config
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
            Text(title)
                .globalTextStyle(config, size: 14, weight: .semibold)
            
            content
                .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
        }
        .padding(24 * config.spacingScale)
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .stroke(borderColor, lineWidth: borderWidth)
        )
    }
    
    private var borderColor: Color {
        config.contrast == .ultra ? DesignTokens.Colors.foreground : DesignTokens.Colors.border
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 0.5
    }
}