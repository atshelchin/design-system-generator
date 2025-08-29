//
//  HierarchySystem.swift
//  100% 还原showcase.html的层级系统
//

import SwiftUI

struct HierarchySystemView: View {
    let language: String
    @ObservedObject var config: DesignTokensConfig
    
    var body: some View {
        VStack(alignment: .leading, spacing: 48 * config.spacingScale) {
            // 标题
            VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                Text(language == "zh" ? "3. 层级系统" : "3. Hierarchy System")
                    .globalTextStyle(config, size: 24, weight: .bold)
                
                Text(language == "zh" ? "完整的层级系统，包含9大类别" : "Complete hierarchy system with 9 categories")
                    .secondaryTextStyle(config, size: 14)
            }
            
            // 1. 标题层级
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "1. 标题层级" : "1. Heading Hierarchy")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                GeometryReader { geometry in
                    let screenSize = ScreenSize.from(width: geometry.size.width)
                    let columnCount = screenSize == .compact ? 1 : 2
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: columnCount),
                        spacing: 24 * config.spacingScale
                    ) {
                        // 基础标题
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "基础标题" : "Basic Headings")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "一级标题 H1" : "Heading Level 1")
                                    .globalTextStyle(config, size: 36, weight: .bold)
                                    .foregroundColor(DesignTokens.Colors.heading(1))
                                
                                Text(language == "zh" ? "二级标题 H2" : "Heading Level 2")
                                    .globalTextStyle(config, size: 30, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.heading(2))
                                
                                Text(language == "zh" ? "三级标题 H3" : "Heading Level 3")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.heading(3))
                                
                                Text(language == "zh" ? "四级标题 H4" : "Heading Level 4")
                                    .globalTextStyle(config, size: 20, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(4))
                                
                                Text(language == "zh" ? "五级标题 H5" : "Heading Level 5")
                                    .globalTextStyle(config, size: 18, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(5))
                                
                                Text(language == "zh" ? "六级标题 H6" : "Heading Level 6")
                                    .globalTextStyle(config, size: 16, weight: .medium)
                                    .foregroundColor(DesignTokens.Colors.heading(6))
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        
                        // 语义化标题
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "语义化标题" : "Semantic Headings")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                                Text(language == "zh" ? "Primary 主要标题" : "Primary Heading")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.headingPrimary)
                                
                                Text(language == "zh" ? "Muted 弱化标题" : "Muted Heading")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.headingMuted)
                                
                                Text(language == "zh" ? "Success 成功标题" : "Success Heading")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.headingSuccess)
                                
                                Text(language == "zh" ? "Danger 危险标题" : "Danger Heading")
                                    .globalTextStyle(config, size: 24, weight: .semibold)
                                    .foregroundColor(DesignTokens.Colors.headingDanger)
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                    }
                }
                .frame(height: 350)
            }
            
            // 2. 描述层级
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "2. 描述层级" : "2. Description Hierarchy")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                GeometryReader { geometry in
                    let screenSize = ScreenSize.from(width: geometry.size.width)
                    let columnCount = screenSize == .compact ? 1 : 2
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: columnCount),
                        spacing: 24 * config.spacingScale
                    ) {
                        // 基础描述
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "基础描述" : "Basic Descriptions")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "一级描述文字 - 最重要的描述信息" : "Level 1 description - Most important")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.description(1))
                                
                                Text(language == "zh" ? "二级描述文字 - 次要的描述信息" : "Level 2 description - Secondary info")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.description(2))
                                
                                Text(language == "zh" ? "三级描述文字 - 辅助的描述信息" : "Level 3 description - Supporting info")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.description(3))
                                
                                Text(language == "zh" ? "四级描述文字 - 提示性描述信息" : "Level 4 description - Hint info")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.description(4))
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        
                        // 语义化描述
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "语义化描述" : "Semantic Descriptions")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                Text(language == "zh" ? "Primary 主要描述" : "Primary Description")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.descriptionPrimary)
                                
                                Text(language == "zh" ? "Muted 弱化描述" : "Muted Description")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.descriptionMuted)
                                
                                Text(language == "zh" ? "Success 成功描述" : "Success Description")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.descriptionSuccess)
                                
                                Text(language == "zh" ? "Warning 警告描述" : "Warning Description")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.descriptionWarning)
                                
                                Text(language == "zh" ? "Danger 危险描述" : "Danger Description")
                                    .globalTextStyle(config, size: 14)
                                    .foregroundColor(DesignTokens.Colors.descriptionDanger)
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                    }
                }
                .frame(height: 200)
            }
            
            // 3. 数值层级
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "3. 数值层级" : "3. Value Hierarchy")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                GeometryReader { geometry in
                    let screenSize = ScreenSize.from(width: geometry.size.width)
                    let columnCount = screenSize == .compact ? 1 : 2
                    
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 24 * config.spacingScale), count: columnCount),
                        spacing: 24 * config.spacingScale
                    ) {
                        // 基础数值
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "基础数值" : "Basic Values")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                HStack {
                                    Text("Level 1:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("$1,234")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.value(1))
                                }
                                
                                HStack {
                                    Text("Level 2:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("$5,678")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.value(2))
                                }
                                
                                HStack {
                                    Text("Level 3:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("$9,012")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.value(3))
                                }
                                
                                HStack {
                                    Text("Level 4:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("$3,456")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.value(4))
                                }
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                        
                        // 语义化数值
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "语义化数值" : "Semantic Values")
                                .globalTextStyle(config, size: 14, weight: .medium)
                                .foregroundColor(DesignTokens.Colors.mutedForeground)
                            
                            VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                HStack {
                                    Text("Primary:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("42.5%")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.valuePrimary)
                                }
                                
                                HStack {
                                    Text("Positive:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("+12.3%")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.valuePositive)
                                }
                                
                                HStack {
                                    Text("Negative:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("-8.7%")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.valueNegative)
                                }
                                
                                HStack {
                                    Text("Neutral:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("0.0%")
                                        .globalTextStyle(config, size: 18, weight: .semibold)
                                        .foregroundColor(DesignTokens.Colors.valueNeutral)
                                }
                                
                                HStack {
                                    Text("Code:")
                                        .globalTextStyle(config, size: 14)
                                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                                    Text("0x1F4A9")
                                        .font(.system(size: 18 * config.fontScale, design: .monospaced))
                                        .fontWeight(.semibold)
                                        .foregroundColor(DesignTokens.Colors.valueCode)
                                }
                            }
                        }
                        .padding(16 * config.spacingScale)
                        .background(DesignTokens.Colors.card)
                        .cornerRadius(8 * config.radiusScale)
                    }
                }
                .frame(height: 250)
            }
            
            // 4. 面板层级（嵌套展示）
            VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                Text(language == "zh" ? "4. 面板层级（嵌套展示）" : "4. Panel Hierarchy (Nested)")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                // 嵌套面板
                VStack(alignment: .leading, spacing: 16 * config.spacingScale) {
                    VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                        Text(language == "zh" ? "Panel 0 - 基础背景" : "Panel 0 - Base Background")
                            .globalTextStyle(config, size: 16, weight: .semibold)
                        Text(language == "zh" ? "最外层面板，使用页面背景色" : "Outermost panel using page background color")
                            .globalTextStyle(config, size: 14)
                            .foregroundColor(DesignTokens.Colors.description(2))
                        
                        VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                            Text(language == "zh" ? "Panel 1 - 一级面板" : "Panel 1 - First Level")
                                .globalTextStyle(config, size: 15, weight: .medium)
                            Text(language == "zh" ? "第一层嵌套，轻微区分" : "First nested level with subtle distinction")
                                .globalTextStyle(config, size: 13)
                                .foregroundColor(DesignTokens.Colors.description(3))
                            
                            VStack(alignment: .leading, spacing: 10 * config.spacingScale) {
                                Text(language == "zh" ? "Panel 2 - 二级面板" : "Panel 2 - Second Level")
                                    .globalTextStyle(config, size: 14, weight: .medium)
                                Text(language == "zh" ? "第二层嵌套" : "Second nested level")
                                    .globalTextStyle(config, size: 12)
                                    .foregroundColor(DesignTokens.Colors.description(3))
                                
                                VStack(alignment: .leading, spacing: 8 * config.spacingScale) {
                                    Text(language == "zh" ? "Panel 3 - 三级面板" : "Panel 3 - Third Level")
                                        .globalTextStyle(config, size: 13)
                                    
                                    VStack(alignment: .leading, spacing: 6 * config.spacingScale) {
                                        Text(language == "zh" ? "Panel 4 - 四级面板" : "Panel 4 - Fourth Level")
                                            .globalTextStyle(config, size: 12)
                                        
                                        VStack(alignment: .leading) {
                                            Text(language == "zh" ? "Panel 5 - 五级面板（最深层）" : "Panel 5 - Fifth Level (Deepest)")
                                                .globalTextStyle(config, size: 11)
                                        }
                                        .padding(8 * config.spacingScale)
                                        .background(DesignTokens.Colors.panel(5))
                                        .cornerRadius(4 * config.radiusScale)
                                    }
                                    .padding(8 * config.spacingScale)
                                    .background(DesignTokens.Colors.panel(4))
                                    .cornerRadius(4 * config.radiusScale)
                                }
                                .padding(12 * config.spacingScale)
                                .background(DesignTokens.Colors.panel(3))
                                .cornerRadius(6 * config.radiusScale)
                            }
                            .padding(16 * config.spacingScale)
                            .background(DesignTokens.Colors.panel(2))
                            .cornerRadius(6 * config.radiusScale)
                        }
                        .padding(20 * config.spacingScale)
                        .background(DesignTokens.Colors.panel(1))
                        .cornerRadius(8 * config.radiusScale)
                    }
                    .padding(24 * config.spacingScale)
                    .background(DesignTokens.Colors.panel(0))
                    .cornerRadius(12 * config.radiusScale)
                }
            }
            
            // 其他5个层级类别的提示
            VStack(alignment: .leading, spacing: 12 * config.spacingScale) {
                Text(language == "zh" ? "其他层级类别" : "Other Hierarchy Categories")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                Text(language == "zh" ? 
                     "层级系统还包括：5. 特殊面板、6. 面板边框、7. 交互层级、8. 深度层级、9. 语义层级" :
                     "The hierarchy system also includes: 5. Special Panels, 6. Panel Borders, 7. Interaction Hierarchy, 8. Depth Hierarchy, 9. Semantic Hierarchy")
                    .globalTextStyle(config, size: 14)
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
        }
    }
}