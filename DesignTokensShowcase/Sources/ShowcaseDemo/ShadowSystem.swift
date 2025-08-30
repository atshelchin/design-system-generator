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
        // 使用响应式网格
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 120), spacing: 24 * config.spacingScale)
            ],
            alignment: .leading,
            spacing: 24 * config.spacingScale
        ) {
            ForEach(shadowValues, id: \.name) { shadow in
                VStack(spacing: 8 * config.spacingScale) {
                    // 可视化展示
                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                        .fill(DesignTokens.Colors.card)
                        .frame(width: 80, height: 60)
                        .modifier(ShadowModifier(shadow: shadow, config: config))
                    
                    // 标签 - 与showcase.html完全一致
                    Text(shadow.label)
                        .globalTextStyle(config, size: 12)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    // 值
                    Text(shadow.cssVar)
                        .globalTextStyle(config, size: 10)
                        .foregroundColor(DesignTokens.Colors.description(3))
                }
                .padding(20 * config.spacingScale)
                .background(DesignTokens.Colors.card)
                .cornerRadius(8 * config.radiusScale)
                .overlay(
                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                        .stroke(DesignTokens.Colors.border, lineWidth: 1)
                )
            }
        }
    }
}

// 阴影修饰符
struct ShadowModifier: ViewModifier {
    let shadow: ShadowValue
    let config: DesignTokensConfig
    
    func body(content: Content) -> some View {
        if shadow.label == "Inner" {
            content
                .overlay(
                    RoundedRectangle(cornerRadius: 8 * config.radiusScale)
                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                        .blur(radius: 4)
                        .offset(x: 0, y: 2)
                        .mask(RoundedRectangle(cornerRadius: 8 * config.radiusScale))
                )
        } else {
            content
                .shadow(
                    color: Color.black.opacity(shadow.opacity),
                    radius: shadow.blur,
                    x: shadow.x,
                    y: shadow.y
                )
        }
    }
}

// 阴影值定义
struct ShadowValue {
    let name: String
    let label: String  // 显示的标签文字
    let cssVar: String // CSS变量名
    let x: CGFloat
    let y: CGFloat
    let blur: CGFloat
    let opacity: Double
}

// 阴影值定义 - 与showcase.html完全一致
private let shadowValues: [ShadowValue] = [
    ShadowValue(name: "xs", label: "XS", cssVar: "--shadow-xs", x: 0, y: 1, blur: 2, opacity: 0.05),
    ShadowValue(name: "sm", label: "Small", cssVar: "--shadow-sm", x: 0, y: 1, blur: 3, opacity: 0.1),
    ShadowValue(name: "default", label: "Default", cssVar: "--shadow", x: 0, y: 2, blur: 4, opacity: 0.1),
    ShadowValue(name: "md", label: "Medium", cssVar: "--shadow-md", x: 0, y: 4, blur: 6, opacity: 0.1),
    ShadowValue(name: "lg", label: "Large", cssVar: "--shadow-lg", x: 0, y: 8, blur: 10, opacity: 0.1),
    ShadowValue(name: "xl", label: "XL", cssVar: "--shadow-xl", x: 0, y: 12, blur: 16, opacity: 0.1),
    ShadowValue(name: "2xl", label: "2XL", cssVar: "--shadow-2xl", x: 0, y: 16, blur: 24, opacity: 0.15),
    ShadowValue(name: "inner", label: "Inner", cssVar: "--shadow-inner", x: 0, y: 2, blur: 4, opacity: 0.06)
]