//
//  BrowserStyleNormalization.swift
//  浏览器样式标准化 - 让SwiftUI看起来像Web
//

import SwiftUI

/// 浏览器样式标准化配置
/// 让SwiftUI的默认样式更接近浏览器的默认样式
public struct BrowserNormalization {
    
    // MARK: - Typography Defaults (模仿浏览器默认字体)
    
    /// 浏览器默认字体大小 (16px)
    public static let defaultFontSize: CGFloat = 16
    
    /// 浏览器默认行高倍数 (通常是1.2-1.6)
    public static let defaultLineHeightMultiplier: CGFloat = 1.5
    
    /// 浏览器默认字体族
    public static let defaultFontFamily = Font.system(.body, design: .default)
    
    // MARK: - Spacing Defaults (模仿浏览器默认间距)
    
    /// 段落默认margin (1em = 16px)
    public static let paragraphMargin: CGFloat = 16
    
    /// 标题默认margin-top
    public static let headingMarginTop: CGFloat = 21.44  // 1.34em
    
    /// 标题默认margin-bottom
    public static let headingMarginBottom: CGFloat = 10.72  // 0.67em
    
    /// 列表默认padding-left
    public static let listPaddingLeft: CGFloat = 40
    
    // MARK: - Box Model Defaults (盒模型默认值)
    
    /// 按钮默认padding
    public static let buttonPaddingVertical: CGFloat = 6
    public static let buttonPaddingHorizontal: CGFloat = 12
    
    /// 输入框默认padding
    public static let inputPaddingVertical: CGFloat = 4
    public static let inputPaddingHorizontal: CGFloat = 8
    
    /// 卡片默认padding
    public static let cardPadding: CGFloat = 16
    
    // MARK: - Color Defaults (模仿浏览器默认颜色)
    
    /// 浏览器默认文字颜色
    public static let defaultTextColor = Color(red: 0, green: 0, blue: 0)
    
    /// 浏览器默认背景色
    public static let defaultBackgroundColor = Color(red: 1, green: 1, blue: 1)
    
    /// 浏览器默认链接颜色
    public static let defaultLinkColor = Color(red: 0, green: 0, blue: 238/255)
    
    /// 浏览器默认边框颜色
    public static let defaultBorderColor = Color(red: 169/255, green: 169/255, blue: 169/255)
}

// MARK: - 标准化文本样式

/// H1样式 (模仿浏览器h1)
public struct H1Style: ViewModifier {
    let config: DesignTokensConfig
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 32 * config.fontScale, weight: .bold))
            .padding(.top, BrowserNormalization.headingMarginTop * config.spacingScale)
            .padding(.bottom, BrowserNormalization.headingMarginBottom * config.spacingScale)
    }
}

/// H2样式 (模仿浏览器h2)
public struct H2Style: ViewModifier {
    let config: DesignTokensConfig
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 24 * config.fontScale, weight: .bold))
            .padding(.top, BrowserNormalization.headingMarginTop * 0.83 * config.spacingScale)
            .padding(.bottom, BrowserNormalization.headingMarginBottom * 0.83 * config.spacingScale)
    }
}

/// H3样式 (模仿浏览器h3)
public struct H3Style: ViewModifier {
    let config: DesignTokensConfig
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 18.72 * config.fontScale, weight: .bold))
            .padding(.top, BrowserNormalization.headingMarginTop * 1 * config.spacingScale)
            .padding(.bottom, BrowserNormalization.headingMarginBottom * 1 * config.spacingScale)
    }
}

/// 段落样式 (模仿浏览器p标签)
public struct ParagraphStyle: ViewModifier {
    let config: DesignTokensConfig
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: BrowserNormalization.defaultFontSize * config.fontScale))
            .lineSpacing((BrowserNormalization.defaultLineHeightMultiplier - 1) * BrowserNormalization.defaultFontSize * config.fontScale)
            .padding(.vertical, BrowserNormalization.paragraphMargin * config.spacingScale)
    }
}

// MARK: - 标准化按钮样式

/// 浏览器默认按钮样式
public struct BrowserButtonStyle: ButtonStyle {
    let config: DesignTokensConfig
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13.33 * config.fontScale))  // 浏览器按钮默认字体
            .padding(.vertical, BrowserNormalization.buttonPaddingVertical * config.spacingScale)
            .padding(.horizontal, BrowserNormalization.buttonPaddingHorizontal * config.spacingScale)
            .background(Color(red: 239/255, green: 239/255, blue: 239/255))  // 浏览器按钮默认背景
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(BrowserNormalization.defaultBorderColor, lineWidth: 1)
            )
            .cornerRadius(2)  // 浏览器按钮默认圆角
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

// MARK: - 标准化输入框样式

/// 浏览器默认输入框样式
public struct BrowserTextFieldStyle: TextFieldStyle {
    let config: DesignTokensConfig
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.system(size: 13.33 * config.fontScale))  // 浏览器输入框默认字体
            .padding(.vertical, BrowserNormalization.inputPaddingVertical * config.spacingScale)
            .padding(.horizontal, BrowserNormalization.inputPaddingHorizontal * config.spacingScale)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(BrowserNormalization.defaultBorderColor, lineWidth: 1)
            )
    }
}

// MARK: - View扩展

public extension View {
    /// 应用H1样式
    func h1Style(_ config: DesignTokensConfig) -> some View {
        self.modifier(H1Style(config: config))
    }
    
    /// 应用H2样式
    func h2Style(_ config: DesignTokensConfig) -> some View {
        self.modifier(H2Style(config: config))
    }
    
    /// 应用H3样式
    func h3Style(_ config: DesignTokensConfig) -> some View {
        self.modifier(H3Style(config: config))
    }
    
    /// 应用段落样式
    func paragraphStyle(_ config: DesignTokensConfig) -> some View {
        self.modifier(ParagraphStyle(config: config))
    }
    
    /// 应用浏览器标准化样式
    func browserNormalize(_ config: DesignTokensConfig) -> some View {
        self
            .font(.system(size: BrowserNormalization.defaultFontSize * config.fontScale))
            .foregroundColor(config.isDarkMode ? .white : BrowserNormalization.defaultTextColor)
            .background(config.isDarkMode ? Color(white: 0.1) : BrowserNormalization.defaultBackgroundColor)
    }
}

// MARK: - CSS Line Height 实现

/// CSS行高实现 - 精确模拟CSS的line-height行为
public struct CSSLineHeight: ViewModifier {
    let lineHeight: CGFloat  // CSS line-height值 (如1.6, 2.0等)
    let fontSize: CGFloat
    
    public init(lineHeight: CGFloat, fontSize: CGFloat) {
        self.lineHeight = lineHeight
        self.fontSize = fontSize
    }
    
    public func body(content: Content) -> some View {
        // CSS line-height的计算方式：
        // 总行高 = fontSize * lineHeight
        // 额外间距 = 总行高 - fontSize
        // SwiftUI的lineSpacing = 额外间距
        let totalLineHeight = fontSize * lineHeight
        let extraSpacing = totalLineHeight - fontSize
        
        return content
            .lineSpacing(max(0, extraSpacing))
    }
}

public extension View {
    /// 应用CSS风格的行高
    func cssLineHeight(_ value: CGFloat, fontSize: CGFloat) -> some View {
        self.modifier(CSSLineHeight(lineHeight: value, fontSize: fontSize))
    }
}

// MARK: - CSS Box Model 实现

/// CSS盒模型padding实现
public struct CSSPadding: ViewModifier {
    let top: CGFloat
    let right: CGFloat
    let bottom: CGFloat
    let left: CGFloat
    
    public init(top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }
    
    public init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.top = vertical
        self.bottom = vertical
        self.left = horizontal
        self.right = horizontal
    }
    
    public init(all: CGFloat) {
        self.top = all
        self.right = all
        self.bottom = all
        self.left = all
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(.top, top)
            .padding(.trailing, right)
            .padding(.bottom, bottom)
            .padding(.leading, left)
    }
}

public extension View {
    /// CSS风格的padding
    func cssPadding(top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0) -> some View {
        self.modifier(CSSPadding(top: top, right: right, bottom: bottom, left: left))
    }
    
    func cssPadding(_ all: CGFloat) -> some View {
        self.modifier(CSSPadding(all: all))
    }
    
    func cssPadding(vertical: CGFloat = 0, horizontal: CGFloat = 0) -> some View {
        self.modifier(CSSPadding(vertical: vertical, horizontal: horizontal))
    }
}