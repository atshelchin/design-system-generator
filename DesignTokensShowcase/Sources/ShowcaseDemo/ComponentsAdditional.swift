//
//  ComponentsAdditional.swift
//  额外的21个组件（22-42）
//

import SwiftUI
import DesignTokensKit

// MARK: - 22. 下拉菜单 Dropdown
struct DropdownMenu: View {
    let config: DesignTokensConfig
    @State private var showMenu = false
    
    var body: some View {
        Menu {
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        } label: {
            HStack {
                Text("Dropdown Menu")
                    .font(.system(size: 14 * config.fontScale, weight: fontWeight))
                Image(systemName: "chevron.down")
                    .font(.system(size: 10 * config.fontScale))
            }
            .padding(.horizontal, 12 * config.spacingScale)
            .padding(.vertical, 8 * config.spacingScale)
            .foregroundColor(DesignTokens.Colors.foreground)
            .background(DesignTokens.Colors.secondary)
            .cornerRadius(6 * config.radiusScale)
        }
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
}

// MARK: - 23. 标签 Chip
struct ChipView: View {
    let text: String
    let config: DesignTokensConfig
    @State private var selected = false
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            Text(text)
                .font(.system(size: 12 * config.fontScale, weight: fontWeight))
            
            Button(action: {}) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 10 * config.fontScale))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 10 * config.spacingScale)
        .padding(.vertical, 6 * config.spacingScale)
        .foregroundColor(selected ? .white : DesignTokens.Colors.foreground)
        .background(selected ? DesignTokens.Colors.primary : DesignTokens.Colors.secondary)
        .cornerRadius(16 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 16 * config.radiusScale)
                .stroke(borderColor, lineWidth: borderWidth)
        )
        .onTapGesture { selected.toggle() }
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
    
    private var borderColor: Color {
        config.contrast == .ultra ? DesignTokens.Colors.foreground : DesignTokens.Colors.border
    }
    
    private var borderWidth: CGFloat {
        config.contrast == .ultra ? 2 : 1
    }
}

// MARK: - 24. 骨架屏 Skeleton
struct SkeletonView: View {
    let config: DesignTokensConfig
    @State private var isAnimating = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            // Title skeleton
            RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                .fill(DesignTokens.Colors.muted)
                .frame(height: 20)
                .frame(maxWidth: 150)
                .opacity(isAnimating ? 0.5 : 1.0)
            
            // Content skeleton
            ForEach(0..<3) { _ in
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .fill(DesignTokens.Colors.muted)
                    .frame(height: 12)
                    .opacity(isAnimating ? 0.5 : 1.0)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                isAnimating = true
            }
        }
    }
}

// MARK: - 25. 步骤条 Stepper
struct StepperView: View {
    let config: DesignTokensConfig
    @State private var currentStep = 1
    let steps = ["Step 1", "Step 2", "Step 3"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<steps.count, id: \.self) { index in
                HStack(spacing: 8 * config.spacingScale) {
                    // Step circle
                    ZStack {
                        Circle()
                            .fill(index <= currentStep ? DesignTokens.Colors.primary : DesignTokens.Colors.muted)
                            .frame(width: 24 * config.spacingScale, height: 24 * config.spacingScale)
                        
                        Text("\(index + 1)")
                            .font(.system(size: 12 * config.fontScale, weight: .medium))
                            .foregroundColor(index <= currentStep ? .white : DesignTokens.Colors.mutedForeground)
                    }
                    
                    // Step label
                    Text(steps[index])
                        .font(.system(size: 11 * config.fontScale, weight: fontWeight))
                        .foregroundColor(index <= currentStep ? DesignTokens.Colors.foreground : DesignTokens.Colors.mutedForeground)
                    
                    // Connector line
                    if index < steps.count - 1 {
                        Rectangle()
                            .fill(index < currentStep ? DesignTokens.Colors.primary : DesignTokens.Colors.border)
                            .frame(width: 40 * config.spacingScale, height: 2)
                    }
                }
            }
        }
    }
    
    private var fontWeight: Font.Weight {
        switch config.contrast {
        case .high: return .medium
        case .ultra: return .semibold
        default: return .regular
        }
    }
}

// MARK: - 26. 时间线 Timeline
struct TimelineView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<3) { index in
                HStack(alignment: .top, spacing: 12 * config.spacingScale) {
                    // Timeline dot and line
                    VStack(spacing: 0) {
                        Circle()
                            .fill(DesignTokens.Colors.primary)
                            .frame(width: 8, height: 8)
                        
                        if index < 2 {
                            Rectangle()
                                .fill(DesignTokens.Colors.border)
                                .frame(width: 1, height: 40)
                        }
                    }
                    
                    // Content
                    VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                        Text("Event \(index + 1)")
                            .font(.system(size: 12 * config.fontScale, weight: .medium))
                            .foregroundColor(DesignTokens.Colors.foreground)
                        
                        Text("Description")
                            .font(.system(size: 11 * config.fontScale))
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    .padding(.bottom, 16 * config.spacingScale)
                }
            }
        }
    }
}

// MARK: - 27. 评分 Rating
struct RatingView: View {
    let config: DesignTokensConfig
    @State private var rating = 3
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            ForEach(1...5, id: \.self) { star in
                Image(systemName: star <= rating ? "star.fill" : "star")
                    .font(.system(size: 16 * config.fontScale))
                    .foregroundColor(star <= rating ? DesignTokens.Colors.warning : DesignTokens.Colors.mutedForeground)
                    .onTapGesture { rating = star }
            }
        }
    }
}

// MARK: - 28. 导航 Navigation
struct NavigationView: View {
    let config: DesignTokensConfig
    @State private var selectedItem = 0
    let items = ["Home", "Products", "About", "Contact"]
    
    var body: some View {
        HStack(spacing: 16 * config.spacingScale) {
            ForEach(0..<items.count, id: \.self) { index in
                Text(items[index])
                    .font(.system(size: 14 * config.fontScale, weight: selectedItem == index ? .medium : .regular))
                    .foregroundColor(selectedItem == index ? DesignTokens.Colors.primary : DesignTokens.Colors.foreground)
                    .onTapGesture { selectedItem = index }
            }
        }
    }
}

// MARK: - 29. 搜索 Search
struct SearchView: View {
    let config: DesignTokensConfig
    @State private var searchText = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 8 * config.spacingScale) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 14 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            TextField("Search...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .font(.system(size: 14 * config.fontScale))
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 12 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, 12 * config.spacingScale)
        .padding(.vertical, 8 * config.spacingScale)
        .background(DesignTokens.Colors.secondary)
        .cornerRadius(20 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 20 * config.radiusScale)
                .stroke(isFocused ? DesignTokens.Colors.ring : Color.clear, lineWidth: 2)
        )
        .focused($isFocused)
    }
}

// MARK: - 30. 文件上传 File Upload
struct FileUploadView: View {
    let config: DesignTokensConfig
    @State private var isDragging = false
    
    var body: some View {
        VStack(spacing: 8 * config.spacingScale) {
            Image(systemName: "arrow.up.circle")
                .font(.system(size: 24 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.primary)
            
            Text("Drop files here or click to upload")
                .font(.system(size: 12 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
        }
        .frame(maxWidth: .infinity)
        .padding(24 * config.spacingScale)
        .background(isDragging ? DesignTokens.Colors.primary.opacity(0.1) : DesignTokens.Colors.background)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                .foregroundColor(isDragging ? DesignTokens.Colors.primary : DesignTokens.Colors.border)
        )
    }
}

// MARK: - 31. 统计卡片 Stats Card
struct StatsCardView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            HStack {
                Text("Total Sales")
                    .font(.system(size: 12 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                Spacer()
                
                Text("+12%")
                    .font(.system(size: 11 * config.fontScale, weight: .medium))
                    .foregroundColor(DesignTokens.Colors.success)
            }
            
            Text("$1,234")
                .font(.system(size: 24 * config.fontScale, weight: .bold))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            // Mini chart
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(0..<7) { day in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(DesignTokens.Colors.primary.opacity(0.3 + Double(day) * 0.1))
                        .frame(width: 8, height: CGFloat.random(in: 10...30))
                }
            }
        }
        .padding(16 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}

// MARK: - 32. 通知 Notification
struct NotificationView: View {
    let config: DesignTokensConfig
    @State private var showNotification = true
    
    var body: some View {
        if showNotification {
            HStack(spacing: 12 * config.spacingScale) {
                Image(systemName: "bell.fill")
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.primary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("New notification")
                        .font(.system(size: 12 * config.fontScale, weight: .medium))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    Text("You have a new message")
                        .font(.system(size: 11 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                
                Spacer()
                
                Button(action: { showNotification = false }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 10 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(12 * config.spacingScale)
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
            .shadow(color: Color.black.opacity(0.1), radius: 4, y: 2)
        }
    }
}

// MARK: - 33. 键盘快捷键 Keyboard
struct KeyboardShortcutView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 4 * config.spacingScale) {
            KeyView(key: "⌘", config: config)
            Text("+")
                .font(.system(size: 10 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            KeyView(key: "K", config: config)
        }
    }
}

struct KeyView: View {
    let key: String
    let config: DesignTokensConfig
    
    var body: some View {
        Text(key)
            .font(.system(size: 11 * config.fontScale, weight: .medium))
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(.horizontal, 6 * config.spacingScale)
            .padding(.vertical, 4 * config.spacingScale)
            .background(DesignTokens.Colors.secondary)
            .cornerRadius(4 * config.radiusScale)
            .overlay(
                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
            )
    }
}

// MARK: - 34. 加载动画 Loading
struct LoadingView: View {
    let config: DesignTokensConfig
    @State private var isRotating = false
    
    var body: some View {
        VStack(spacing: 12 * config.spacingScale) {
            // Spinner
            Image(systemName: "arrow.2.circlepath")
                .font(.system(size: 20 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.primary)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        isRotating = true
                    }
                }
            
            // Loading dots
            HStack(spacing: 4 * config.spacingScale) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(DesignTokens.Colors.primary)
                        .frame(width: 8, height: 8)
                        .scaleEffect(isRotating ? 1.0 : 0.5)
                        .animation(.easeInOut(duration: 0.6).repeatForever().delay(Double(index) * 0.2), value: isRotating)
                }
            }
        }
    }
}

// MARK: - 35. 指标展示 Metric
struct MetricView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 24 * config.spacingScale) {
            MetricItem(label: "Users", value: "1.2K", change: "+5%", isPositive: true, config: config)
            MetricItem(label: "Revenue", value: "$45K", change: "+12%", isPositive: true, config: config)
            MetricItem(label: "Bounce", value: "32%", change: "-2%", isPositive: false, config: config)
        }
    }
}

struct MetricItem: View {
    let label: String
    let value: String
    let change: String
    let isPositive: Bool
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
            Text(label)
                .font(.system(size: 10 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Text(value)
                .font(.system(size: 16 * config.fontScale, weight: .semibold))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            Text(change)
                .font(.system(size: 10 * config.fontScale))
                .foregroundColor(isPositive ? DesignTokens.Colors.success : DesignTokens.Colors.danger)
        }
    }
}

// MARK: - 36. 命令面板 Command Palette
struct CommandPaletteView: View {
    let config: DesignTokensConfig
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // Search bar
            HStack(spacing: 8 * config.spacingScale) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 14 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                TextField("Type a command...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 14 * config.fontScale))
            }
            .padding(12 * config.spacingScale)
            .background(DesignTokens.Colors.background)
            
            Divider()
            
            // Command list
            VStack(alignment: .leading, spacing: 0) {
                ForEach(["New File", "Open Project", "Search"], id: \.self) { command in
                    HStack {
                        Text(command)
                            .font(.system(size: 12 * config.fontScale))
                        Spacer()
                        KeyboardShortcutView(config: config)
                    }
                    .padding(.horizontal, 12 * config.spacingScale)
                    .padding(.vertical, 8 * config.spacingScale)
                    .background(Color.clear)
                    .contentShape(Rectangle())
                    .onHover { hovering in
                        // Hover effect
                    }
                }
            }
        }
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
        .shadow(color: Color.black.opacity(0.2), radius: 16, y: 8)
    }
}

// MARK: - 37. 活动信息流 Activity Feed
struct ActivityFeedView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            ForEach(0..<3) { index in
                HStack(alignment: .top, spacing: 8 * config.spacingScale) {
                    Circle()
                        .fill(DesignTokens.Colors.primary)
                        .frame(width: 6, height: 6)
                        .offset(y: 6)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("User performed action")
                            .font(.system(size: 12 * config.fontScale))
                            .foregroundColor(DesignTokens.Colors.foreground)
                        
                        Text("2 hours ago")
                            .font(.system(size: 10 * config.fontScale))
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                }
                
                if index < 2 {
                    Divider()
                }
            }
        }
    }
}

// MARK: - 38. 个人资料卡 Profile Card
struct ProfileCardView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(spacing: 12 * config.spacingScale) {
            // Avatar
            Circle()
                .fill(DesignTokens.Colors.primary)
                .frame(width: 48 * config.spacingScale, height: 48 * config.spacingScale)
                .overlay(
                    Text("JD")
                        .font(.system(size: 16 * config.fontScale, weight: .medium))
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                Text("John Doe")
                    .font(.system(size: 14 * config.fontScale, weight: .medium))
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                Text("john@example.com")
                    .font(.system(size: 12 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                HStack(spacing: 4 * config.spacingScale) {
                    Image(systemName: "mappin")
                        .font(.system(size: 10 * config.fontScale))
                    Text("San Francisco")
                        .font(.system(size: 11 * config.fontScale))
                }
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
    }
}

// MARK: - 39. 任务卡片 Task Card
struct TaskCardView: View {
    let config: DesignTokensConfig
    @State private var isCompleted = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
            HStack {
                Button(action: { isCompleted.toggle() }) {
                    Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 16 * config.fontScale))
                        .foregroundColor(isCompleted ? DesignTokens.Colors.success : DesignTokens.Colors.mutedForeground)
                }
                .buttonStyle(PlainButtonStyle())
                
                Text("Complete the design review")
                    .font(.system(size: 13 * config.fontScale, weight: .medium))
                    .foregroundColor(DesignTokens.Colors.foreground)
                    .strikethrough(isCompleted)
                
                Spacer()
            }
            
            HStack(spacing: 8 * config.spacingScale) {
                Label("High", systemImage: "flag.fill")
                    .font(.system(size: 10 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.danger)
                
                Label("Due today", systemImage: "calendar")
                    .font(.system(size: 10 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(6 * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(isCompleted ? DesignTokens.Colors.success : DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// MARK: - 40. 评论 Comment
struct CommentView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        HStack(alignment: .top, spacing: 8 * config.spacingScale) {
            Circle()
                .fill(DesignTokens.Colors.secondary)
                .frame(width: 32 * config.spacingScale, height: 32 * config.spacingScale)
                .overlay(
                    Text("AB")
                        .font(.system(size: 12 * config.fontScale, weight: .medium))
                        .foregroundColor(DesignTokens.Colors.secondaryForeground)
                )
            
            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                HStack {
                    Text("Alice Brown")
                        .font(.system(size: 12 * config.fontScale, weight: .medium))
                        .foregroundColor(DesignTokens.Colors.foreground)
                    
                    Text("• 2h ago")
                        .font(.system(size: 10 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                
                Text("This looks great! I really like the new design.")
                    .font(.system(size: 12 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                HStack(spacing: 12 * config.spacingScale) {
                    Button("Like") {}
                        .font(.system(size: 11 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.primary)
                        .buttonStyle(PlainButtonStyle())
                    
                    Button("Reply") {}
                        .font(.system(size: 11 * config.fontScale))
                        .foregroundColor(DesignTokens.Colors.primary)
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(12 * config.spacingScale)
        .background(DesignTokens.Colors.background)
        .cornerRadius(8 * config.radiusScale)
    }
}

// MARK: - 41. 数据网格 Data Grid
struct DataGridView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("ID")
                    .frame(width: 40, alignment: .leading)
                Text("Name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Status")
                    .frame(width: 60, alignment: .leading)
            }
            .font(.system(size: 11 * config.fontScale, weight: .semibold))
            .foregroundColor(DesignTokens.Colors.foreground)
            .padding(8 * config.spacingScale)
            .background(DesignTokens.Colors.muted)
            
            // Rows
            ForEach(0..<3) { index in
                HStack {
                    Text("#\(index + 1)")
                        .frame(width: 40, alignment: .leading)
                    Text("Item \(index + 1)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Active")
                        .font(.system(size: 10 * config.fontScale))
                        .padding(.horizontal, 6 * config.spacingScale)
                        .padding(.vertical, 2 * config.spacingScale)
                        .background(DesignTokens.Colors.success.opacity(0.2))
                        .cornerRadius(4 * config.radiusScale)
                        .frame(width: 60, alignment: .leading)
                }
                .font(.system(size: 11 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.foreground)
                .padding(8 * config.spacingScale)
                .background(index % 2 == 0 ? Color.clear : DesignTokens.Colors.muted.opacity(0.3))
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
    }
}

// MARK: - 42. 信息小部件 Info Widget
struct InfoWidgetView: View {
    let config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 16 * config.fontScale))
                    .foregroundColor(DesignTokens.Colors.info)
                
                Text("System Information")
                    .font(.system(size: 14 * config.fontScale, weight: .medium))
                    .foregroundColor(DesignTokens.Colors.foreground)
            }
            
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                InfoRow(label: "Version", value: "2.4.1", config: config)
                InfoRow(label: "Status", value: "Online", config: config)
                InfoRow(label: "Uptime", value: "24 days", config: config)
            }
        }
        .padding(16 * config.spacingScale)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8 * config.radiusScale)
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    let config: DesignTokensConfig
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 11 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.mutedForeground)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 11 * config.fontScale, weight: .medium))
                .foregroundColor(DesignTokens.Colors.foreground)
        }
    }
}