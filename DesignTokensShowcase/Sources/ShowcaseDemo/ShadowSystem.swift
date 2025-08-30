//
//  ShadowSystem.swift
//  100% 还原showcase.html的阴影系统
//

import SwiftUI
import DesignTokensKit
struct ShadowSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 阴影展示网格
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "阴影层级" : "Shadow Levels")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                GeometryReader { geometry in
                    let screenSize = ScreenSize.from(width: geometry.size.width)
                    let columnCount = screenSize == .compact ? 2 : 3
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 20 * config.spacingScale), count: columnCount),
                        spacing: 24 * config.spacingScale
                    ) {
                        ForEach(shadowValues, id: \.name) { shadow in
                            VStack(spacing: 8 * config.spacingScale) {
                                // 阴影示例卡片
                                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                    .fill(DesignTokens.Colors.card)
                                    .frame(width: 100, height: 64)
                                    .shadow(
                                        color: shadow.color,
                                        radius: shadow.radius,
                                        x: shadow.x,
                                        y: shadow.y
                                    )
                                
                                // 标签
                                VStack(spacing: 2 * config.spacingScale) {
                                    Text(shadow.name)
                                        .monoTextStyle(config, size: 11)
                                        .foregroundColor(DesignTokens.Colors.primary)
                                    
                                    if shadow.name != "shadow-none" {
                                        Text("blur: \(Int(shadow.radius))px")
                                            .globalTextStyle(config, size: 9)
                                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(height: CGFloat((shadowValues.count + 2) / 3 * 120))
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.background)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 阴影应用示例
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "阴影应用场景" : "Shadow Use Cases")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                HStack(alignment: .top, spacing: 24 * config.spacingScale) {
                    // 卡片阴影
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "卡片" : "Cards")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(spacing: 16 * config.spacingScale) {
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "默认卡片" : "Default Card")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                Text("shadow-sm")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(16 * config.spacingScale)
                            .frame(width: 140)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(8 * config.radiusScale)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, y: 1)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "悬浮卡片" : "Hover Card")
                                    .globalTextStyle(config, size: 12, weight: .medium)
                                Text("shadow-md")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(16 * config.spacingScale)
                            .frame(width: 140)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(8 * config.radiusScale)
                            .shadow(color: Color.black.opacity(0.1), radius: 8, y: 4)
                        }
                    }
                    
                    // 弹出层阴影
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "弹出层" : "Popovers")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                            Text(language == "zh" ? "下拉菜单" : "Dropdown Menu")
                                .globalTextStyle(config, size: 12, weight: .medium)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(["选项 1", "选项 2", "选项 3"], id: \.self) { option in
                                    Text(option)
                                        .globalTextStyle(config, size: 11)
                                        .padding(.horizontal, 12 * config.spacingScale)
                                        .padding(.vertical, 8 * config.spacingScale)
                                        .frame(width: 120, alignment: .leading)
                                    
                                    if option != "选项 3" {
                                        Divider()
                                    }
                                }
                            }
                            .background(DesignTokens.Colors.popover)
                            .cornerRadius(6 * config.radiusScale)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, y: 10)
                            
                            Text("shadow-lg")
                                .globalTextStyle(config, size: 10)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                        }
                    }
                    
                    // 模态框阴影
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "模态框" : "Modals")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "对话框标题" : "Dialog Title")
                                    .globalTextStyle(config, size: 14, weight: .semibold)
                                
                                Text(language == "zh" ? "这是对话框内容" : "Dialog content here")
                                    .globalTextStyle(config, size: 11)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                                
                                HStack(spacing: 8 * config.spacingScale) {
                                    Button(language == "zh" ? "取消" : "Cancel") {}
                                        .buttonStyle(SecondaryButtonStyle(config: config))
                                    
                                    Button(language == "zh" ? "确定" : "OK") {}
                                        .buttonStyle(PrimaryButtonStyle(config: config))
                                }
                            }
                            .padding(16 * config.spacingScale)
                            .frame(width: 180)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(12 * config.radiusScale)
                            .shadow(color: Color.black.opacity(0.25), radius: 25, y: 25)
                            
                            Text("shadow-xl")
                                .globalTextStyle(config, size: 10)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.background)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 内阴影示例
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "内阴影" : "Inner Shadow")
                    .globalTextStyle(config, size: 16, weight: .medium)
                
                HStack(spacing: 20 * config.spacingScale) {
                    VStack(spacing: 8 * config.spacingScale) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                .fill(DesignTokens.Colors.muted)
                                .frame(width: 120, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                                        .blur(radius: 2)
                                        .offset(x: 0, y: 2)
                                        .mask(
                                            RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                                .fill(LinearGradient(
                                                    gradient: Gradient(colors: [Color.black.opacity(0.1), Color.clear]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                ))
                                        )
                                )
                            
                            Text(language == "zh" ? "凹陷效果" : "Sunken Effect")
                                .globalTextStyle(config, size: 11)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                        }
                        
                        Text("shadow-inner")
                            .globalTextStyle(config, size: 10)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                    
                    VStack(spacing: 8 * config.spacingScale) {
                        RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                            .fill(DesignTokens.Colors.card)
                            .frame(width: 120, height: 80)
                            .overlay(
                                Text(language == "zh" ? "正常效果" : "Normal Effect")
                                    .globalTextStyle(config, size: 11)
                            )
                        
                        Text("no shadow")
                            .globalTextStyle(config, size: 10)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                    }
                }
                .padding(16 * config.spacingScale)
                .background(DesignTokens.Colors.background)
                .cornerRadius(8 * config.radiusScale)
            }
        }
    }
}

// 阴影值定义
private let shadowValues: [(name: String, color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)] = [
    (name: "shadow-xs", color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1),
    (name: "shadow-sm", color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1),
    (name: "shadow-base", color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2),
    (name: "shadow-md", color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4),
    (name: "shadow-lg", color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10),
    (name: "shadow-xl", color: Color.black.opacity(0.25), radius: 25, x: 0, y: 25),
    (name: "shadow-2xl", color: Color.black.opacity(0.35), radius: 25, x: 0, y: 25),
    (name: "shadow-none", color: Color.clear, radius: 0, x: 0, y: 0)
]