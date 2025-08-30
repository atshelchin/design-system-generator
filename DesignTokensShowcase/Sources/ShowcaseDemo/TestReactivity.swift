//
//  TestReactivity.swift
//  测试组件响应性
//

import SwiftUI
import DesignTokensKit

struct TestReactivityView: View {
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(spacing: 20) {
            Text("测试响应性")
                .font(.system(size: 24 * config.fontScale))
                .foregroundColor(DesignTokens.Colors.primary)
            
            Text("字体缩放: \(config.fontScale)")
            Text("间距缩放: \(config.spacingScale)")
            Text("圆角缩放: \(config.radiusScale)")
            Text("对比度: \(String(describing: config.contrast))")
            Text("主题: \(config.isDarkMode ? "暗色" : "亮色")")
            
            // 测试按钮
            Button("Primary Button") {}
                .font(.system(size: 14 * config.fontScale))
                .padding(.horizontal, 16 * config.spacingScale)
                .padding(.vertical, 8 * config.spacingScale)
                .background(DesignTokens.Colors.primary)
                .foregroundColor(.white)
                .cornerRadius(6 * config.radiusScale)
            
            // 测试卡片
            VStack {
                Text("测试卡片")
                    .font(.system(size: 16 * config.fontScale))
            }
            .padding(16 * config.spacingScale)
            .background(DesignTokens.Colors.card)
            .cornerRadius(8 * config.radiusScale)
        }
        .padding()
    }
}