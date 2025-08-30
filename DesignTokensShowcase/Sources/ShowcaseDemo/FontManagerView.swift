//
//  FontManagerView.swift
//  字体管理视图
//

import SwiftUI
import DesignTokensKit

struct FontManagerView: View {
    @Binding var uploadedFonts: [String]
    @ObservedObject var config: DesignTokensConfig
    let language: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // 标题栏
            HStack {
                Text(language == "zh" ? "字体管理" : "Font Management")
                    .globalTextStyle(config, size: 18, weight: .semibold)
                
                Spacer()
                
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(DesignTokens.Colors.card)
            
            Divider()
            
            // 字体列表
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    // 内置字体
                    Text(language == "zh" ? "内置字体" : "Built-in Fonts")
                        .globalTextStyle(config, size: 14, weight: .medium)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                        .padding(.horizontal)
                        .padding(.top, 12)
                    
                    VStack(spacing: 8) {
                        FontRow(name: "系统默认", value: "system", config: config, isBuiltIn: true)
                        FontRow(name: "Sans-serif", value: "sans-serif", config: config, isBuiltIn: true)
                        FontRow(name: "Serif", value: "serif", config: config, isBuiltIn: true)
                        FontRow(name: "Monospace", value: "monospace", config: config, isBuiltIn: true)
                    }
                    .padding(.horizontal)
                    
                    if !uploadedFonts.isEmpty {
                        Divider()
                            .padding(.vertical, 8)
                        
                        // 上传的字体
                        Text(language == "zh" ? "上传的字体" : "Uploaded Fonts")
                            .globalTextStyle(config, size: 14, weight: .medium)
                            .foregroundColor(DesignTokens.Colors.mutedForeground)
                            .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            ForEach(uploadedFonts, id: \.self) { fontName in
                                FontRow(
                                    name: fontName,
                                    value: fontName,
                                    config: config,
                                    isBuiltIn: false,
                                    onDelete: {
                                        uploadedFonts.removeAll { $0 == fontName }
                                        if config.selectedFont == fontName {
                                            config.selectedFont = "system"
                                        }
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 12)
            }
            .frame(maxHeight: 400)
        }
        .frame(width: 500)
        .background(DesignTokens.Colors.background)
        .cornerRadius(12)
    }
}

struct FontRow: View {
    let name: String
    let value: String
    @ObservedObject var config: DesignTokensConfig
    let isBuiltIn: Bool
    var onDelete: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .globalTextStyle(config, size: 13, weight: .medium)
                
                // 预览文本
                Text("The quick brown fox jumps over the lazy dog")
                    .font(.custom(value == "system" ? ".AppleSystemUIFont" : 
                                  value == "serif" ? "Georgia" :
                                  value == "sans-serif" ? "Helvetica Neue" :
                                  value == "monospace" ? "Menlo" : value, size: 11))
                    .foregroundColor(DesignTokens.Colors.mutedForeground)
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                // 使用按钮
                Button(action: {
                    config.selectedFont = value
                }) {
                    Text(config.selectedFont == value ? "使用中" : "使用")
                        .globalTextStyle(config, size: 11)
                        .foregroundColor(config.selectedFont == value ? .white : DesignTokens.Colors.primary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(config.selectedFont == value ? DesignTokens.Colors.primary : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(DesignTokens.Colors.primary, lineWidth: 1)
                        )
                        .cornerRadius(4)
                }
                .buttonStyle(PlainButtonStyle())
                
                // 删除按钮（仅上传的字体）
                if !isBuiltIn, let onDelete = onDelete {
                    Button(action: onDelete) {
                        Image(systemName: "trash")
                            .font(.system(size: 12))
                            .foregroundColor(DesignTokens.Colors.danger)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(12)
        .background(DesignTokens.Colors.card)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(DesignTokens.Colors.border, lineWidth: 0.5)
        )
    }
}