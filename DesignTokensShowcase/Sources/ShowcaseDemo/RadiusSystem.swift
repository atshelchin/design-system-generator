//
//  RadiusSystem.swift
//  100% 还原showcase.html的圆角系统
//

import SwiftUI
import DesignTokensKit
struct RadiusSystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 圆角展示网格
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "圆角值" : "Radius Values")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                GeometryReader { geometry in
                    let screenSize = ScreenSize.from(width: geometry.size.width)
                    let columnCount = screenSize == .compact ? 3 : 4
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 16 * config.spacingScale), count: columnCount),
                        spacing: 20 * config.spacingScale
                    ) {
                        ForEach(radiusValues, id: \.name) { radius in
                            VStack(spacing: 8 * config.spacingScale) {
                                // 圆角示例
                                if radius.name == "radius-full" {
                                    Circle()
                                        .fill(DesignTokens.Colors.primary.opacity(0.1))
                                        .overlay(
                                            Circle()
                                                .stroke(DesignTokens.Colors.primary, lineWidth: 2)
                                        )
                                        .frame(width: 64, height: 64)
                                } else {
                                    RoundedRectangle(cornerRadius: radius.value * config.radiusScale)
                                        .fill(DesignTokens.Colors.primary.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: radius.value * config.radiusScale)
                                                .stroke(DesignTokens.Colors.primary, lineWidth: 2)
                                        )
                                        .frame(width: 80, height: 64)
                                }
                                
                                // 标签
                                VStack(spacing: 2 * config.spacingScale) {
                                    Text(radius.name)
                                        .monoTextStyle(config, size: 10)
                                        .foregroundColor(DesignTokens.Colors.primary)
                                    
                                    Text(radius.name == "radius-full" ? "9999px" : "\(Int(radius.value))px")
                                        .globalTextStyle(config, size: 9)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    
                                    // 显示缩放后的值
                                    if config.radiusScale != 1.0 && radius.name != "radius-full" {
                                        Text("→ \(Int(radius.value * config.radiusScale))px")
                                            .globalTextStyle(config, size: 8)
                                            .foregroundColor(DesignTokens.Colors.accent)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(height: screenHeight(for: radiusValues.count, columns: 4))
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 圆角应用示例
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "圆角应用示例" : "Radius Application Examples")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                HStack(spacing: 24 * config.spacingScale) {
                    // 按钮圆角
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "按钮" : "Buttons")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(spacing: 8 * config.spacingScale) {
                            Button(action: {}) {
                                Text("radius-sm")
                                    .globalTextStyle(config, size: 12)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16 * config.spacingScale)
                                    .padding(.vertical, 8 * config.spacingScale)
                                    .background(DesignTokens.Colors.primary)
                                    .cornerRadius(4 * config.radiusScale)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {}) {
                                Text("radius-md")
                                    .globalTextStyle(config, size: 12)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16 * config.spacingScale)
                                    .padding(.vertical, 8 * config.spacingScale)
                                    .background(DesignTokens.Colors.primary)
                                    .cornerRadius(8 * config.radiusScale)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {}) {
                                Text("radius-full")
                                    .globalTextStyle(config, size: 12)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20 * config.spacingScale)
                                    .padding(.vertical, 8 * config.spacingScale)
                                    .background(DesignTokens.Colors.primary)
                                    .cornerRadius(9999)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    // 卡片圆角
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "卡片" : "Cards")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(spacing: 12 * config.spacingScale) {
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("radius-base")
                                    .globalTextStyle(config, size: 11, weight: .medium)
                                Text(language == "zh" ? "标准卡片" : "Standard Card")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(12 * config.spacingScale)
                            .frame(width: 120)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(6 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
                            )
                            
                            VStack(alignment: .leading, spacing: 4 * config.spacingScale) {
                                Text("radius-lg")
                                    .globalTextStyle(config, size: 11, weight: .medium)
                                Text(language == "zh" ? "大圆角卡片" : "Large Radius Card")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(12 * config.spacingScale)
                            .frame(width: 120)
                            .background(DesignTokens.Colors.card)
                            .cornerRadius(12 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.border, lineWidth: 1)
                            )
                        }
                    }
                    
                    // 输入框圆角
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "输入框" : "Input Fields")
                            .globalTextStyle(config, size: 14, weight: .medium)
                        
                        VStack(spacing: 8 * config.spacingScale) {
                            HStack {
                                Text("radius-sm")
                                    .globalTextStyle(config, size: 11)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(8 * config.spacingScale)
                            .frame(width: 140, alignment: .leading)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(4 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
                            )
                            
                            HStack {
                                Text("radius-md")
                                    .globalTextStyle(config, size: 11)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(8 * config.spacingScale)
                            .frame(width: 140, alignment: .leading)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(8 * config.radiusScale)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
                            )
                            
                            HStack {
                                Text("radius-full")
                                    .globalTextStyle(config, size: 11)
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .padding(8 * config.spacingScale)
                            .frame(width: 140, alignment: .leading)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(9999)
                            .overlay(
                                Capsule()
                                    .stroke(DesignTokens.Colors.input, lineWidth: 1)
                            )
                        }
                    }
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
            }
            
            // 响应式圆角
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "响应式圆角" : "Responsive Radius")
                    .globalTextStyle(config, size: 16, weight: .medium)
                
                Text(language == "zh" ? 
                     "圆角会根据 radius-scale 缩放因子动态调整。当前缩放: \(String(format: "%.1fx", config.radiusScale))" :
                     "Radius adapts based on radius-scale factor. Current scale: \(String(format: "%.1fx", config.radiusScale))")
                    .globalTextStyle(config, size: 13)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                HStack(spacing: 16 * config.spacingScale) {
                    Text("0x")
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(config.radiusScale == 0 ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                    
                    Slider(value: $config.radiusScale, in: 0...3)
                        .accentColor(DesignTokens.Colors.primary)
                        .frame(width: 200)
                    
                    Text("3x")
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(config.radiusScale == 3.0 ? DesignTokens.Colors.primary : DesignTokens.Colors.mutedForeground)
                }
                .padding(12 * config.spacingScale)
                .background(DesignTokens.Colors.muted.opacity(0.3))
                .cornerRadius(6 * config.radiusScale)
            }
        }
    }
    
    private func screenHeight(for itemCount: Int, columns: Int) -> CGFloat {
        let rows = (itemCount + columns - 1) / columns
        return CGFloat(rows * 120)
    }
}

// 圆角值定义
private let radiusValues: [(name: String, value: CGFloat)] = [
    (name: "radius-none", value: 0),
    (name: "radius-sm", value: 4),
    (name: "radius-base", value: 6),
    (name: "radius-md", value: 8),
    (name: "radius-lg", value: 12),
    (name: "radius-xl", value: 18),
    (name: "radius-2xl", value: 24),
    (name: "radius-3xl", value: 30),
    (name: "radius-full", value: 9999)
]