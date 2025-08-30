//
//  LineHeightTestView.swift
//  测试行高功能
//

import SwiftUI
import DesignTokensKit

struct LineHeightTestView: View {
    @ObservedObject var config: DesignTokensConfig
    
    let testText = """
    这是第一行文本
    这是第二行文本
    这是第三行文本
    这是第四行文本
    这是第五行文本
    """
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("行高测试 Line Height Test")
                .globalTextStyle(config, size: 20, weight: .bold)
            
            HStack(spacing: 16) {
                Text("当前行高: \(config.lineHeight.rawValue)")
                    .globalTextStyle(config, size: 14)
                Text("倍数: \(config.lineHeight.value)")
                    .globalTextStyle(config, size: 14)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 24) {
                // 使用 globalTextStyle
                VStack(alignment: .leading, spacing: 8) {
                    Text("使用 globalTextStyle:")
                        .globalTextStyle(config, size: 12, weight: .medium)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Text(testText)
                        .globalTextStyle(config, size: 14)
                        .padding()
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8)
                }
                
                // 直接计算的 lineSpacing
                VStack(alignment: .leading, spacing: 8) {
                    Text("直接计算 lineSpacing = \((config.lineHeight.value - 1.0) * 14):")
                        .globalTextStyle(config, size: 12, weight: .medium)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    Text(testText)
                        .font(.system(size: 14))
                        .lineSpacing((config.lineHeight.value - 1.0) * 14)
                        .padding()
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8)
                }
                
                // 对比不同行高
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Normal (1.6)")
                            .globalTextStyle(config, size: 12, weight: .medium)
                        Text("行1\n行2\n行3")
                            .font(.system(size: 14))
                            .lineSpacing((1.6 - 1.0) * 14)
                            .padding(8)
                            .background(DesignTokens.Colors.secondary)
                            .cornerRadius(4)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Relaxed (1.8)")
                            .globalTextStyle(config, size: 12, weight: .medium)
                        Text("行1\n行2\n行3")
                            .font(.system(size: 14))
                            .lineSpacing((1.8 - 1.0) * 14)
                            .padding(8)
                            .background(DesignTokens.Colors.secondary)
                            .cornerRadius(4)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Loose (2.2)")
                            .globalTextStyle(config, size: 12, weight: .medium)
                        Text("行1\n行2\n行3")
                            .font(.system(size: 14))
                            .lineSpacing((2.2 - 1.0) * 14)
                            .padding(8)
                            .background(DesignTokens.Colors.secondary)
                            .cornerRadius(4)
                    }
                }
            }
            
            // 控制按钮
            HStack(spacing: 16) {
                Button("Normal") {
                    config.lineHeight = .normal
                }
                .buttonStyle(.borderedProminent)
                
                Button("Relaxed") {
                    config.lineHeight = .relaxed
                }
                .buttonStyle(.borderedProminent)
                
                Button("Loose") {
                    config.lineHeight = .loose
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(DesignTokens.Colors.background)
    }
}