//
//  TestLineHeight.swift
//  测试行高功能是否正常工作
//

import SwiftUI
import DesignTokensKit

struct TestLineHeightView: View {
    @ObservedObject var config: DesignTokensConfig
    
    let sampleText = """
    这是一段测试文本，用于验证行高设置是否生效。
    SwiftUI中的lineSpacing属性应该能够调整文本行之间的间距。
    当您在控制面板中调整行高设置时，这段文本的行间距应该会实时变化。
    正常行高（1.6x）、舒适行高（1.8x）、宽松行高（2.2x）应该有明显的视觉差异。
    """
    
    let englishText = """
    This is a test paragraph to verify if line height settings are working properly.
    The lineSpacing property in SwiftUI should be able to adjust the spacing between lines.
    When you adjust the line height setting in the control panel, the line spacing should change in real-time.
    Normal (1.6x), Relaxed (1.8x), and Loose (2.2x) line heights should have noticeable visual differences.
    """
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // 标题
            Text("Line Height Test / 行高测试")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(DesignTokens.Colors.foreground)
            
            // 显示当前设置
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Current Line Height / 当前行高:")
                        .font(.system(size: 12))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    Text(lineHeightDescription)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(DesignTokens.Colors.primary)
                }
                
                VStack(alignment: .leading) {
                    Text("Line Spacing Value / 行间距值:")
                        .font(.system(size: 12))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    Text("\(lineSpacingValue, specifier: "%.1f")px")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(DesignTokens.Colors.primary)
                }
            }
            
            Divider()
            
            // 测试文本 - 使用globalTextStyle
            VStack(alignment: .leading, spacing: 24) {
                Text("With globalTextStyle modifier:")
                    .font(.system(size: 12))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                Text(sampleText)
                    .globalTextStyle(config, size: 14)
                
                Text(englishText)
                    .globalTextStyle(config, size: 14)
            }
            
            Divider()
            
            // 测试文本 - 直接使用lineSpacing
            VStack(alignment: .leading, spacing: 24) {
                Text("Direct lineSpacing application:")
                    .font(.system(size: 12))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                Text(sampleText)
                    .font(.system(size: 14 * config.fontScale))
                    .lineSpacing(lineSpacingValue)
                    .foregroundColor(DesignTokens.Colors.foreground)
                
                Text(englishText)
                    .font(.system(size: 14 * config.fontScale))
                    .lineSpacing(lineSpacingValue)
                    .foregroundColor(DesignTokens.Colors.foreground)
            }
            
            Divider()
            
            // 对比不同行高设置
            VStack(alignment: .leading, spacing: 24) {
                Text("Comparison of different line heights:")
                    .font(.system(size: 12))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                
                HStack(alignment: .top, spacing: 32) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Normal (1.6x)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.primary)
                        Text("这是正常行高\n的示例文本\n用于对比")
                            .font(.system(size: 14))
                            .lineSpacing(14 * 0.6) // 1.6x - 1 = 0.6
                            .foregroundColor(DesignTokens.Colors.foreground)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Relaxed (1.8x)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.primary)
                        Text("这是舒适行高\n的示例文本\n用于对比")
                            .font(.system(size: 14))
                            .lineSpacing(14 * 0.8) // 1.8x - 1 = 0.8
                            .foregroundColor(DesignTokens.Colors.foreground)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Loose (2.2x)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(DesignTokens.Colors.primary)
                        Text("这是宽松行高\n的示例文本\n用于对比")
                            .font(.system(size: 14))
                            .lineSpacing(14 * 1.2) // 2.2x - 1 = 1.2
                            .foregroundColor(DesignTokens.Colors.foreground)
                    }
                }
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(DesignTokens.Colors.background)
    }
    
    private var lineHeightDescription: String {
        switch config.lineHeight {
        case .relaxed:
            return "Relaxed (1.8x)"
        case .loose:
            return "Loose (2.2x)"
        default:
            return "Normal (1.6x)"
        }
    }
    
    private var lineSpacingValue: CGFloat {
        let fontSize: CGFloat = 14 * config.fontScale
        let multiplier: CGFloat
        
        switch config.lineHeight {
        case .relaxed:
            multiplier = 1.8
        case .loose:
            multiplier = 2.2
        default:
            multiplier = 1.6
        }
        
        return fontSize * (multiplier - 1)
    }
}

// 测试应用
struct TestLineHeightApp: App {
    @StateObject private var config = DesignTokensConfig.shared
    
    var body: some Scene {
        WindowGroup {
            TestLineHeightView(config: config)
        }
    }
}