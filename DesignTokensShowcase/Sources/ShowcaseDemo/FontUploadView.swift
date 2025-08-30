//
//  FontUploadView.swift
//  字体上传和管理功能
//

import SwiftUI
import AppKit
import DesignTokensKit

struct FontUploadView: View {
    @ObservedObject var config: DesignTokensConfig
    @State private var uploadedFonts: [UploadedFont] = []
    @State private var showingFileImporter = false
    @State private var selectedFontURL: URL?
    
    struct UploadedFont: Identifiable {
        let id = UUID()
        let name: String
        let url: URL
        let familyName: String
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 上传按钮
            Button(action: {
                selectFontFile()
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 14))
                    Text("上传字体")
                        .globalTextStyle(config, size: 12)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(DesignTokens.Colors.primary)
                .cornerRadius(6)
            }
            .buttonStyle(PlainButtonStyle())
            
            // 已上传的字体列表
            if !uploadedFonts.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("已上传字体")
                        .globalTextStyle(config, size: 11, weight: .medium)
                        .foregroundColor(DesignTokens.Colors.mutedForeground)
                    
                    ForEach(uploadedFonts) { font in
                        HStack {
                            Text(font.name)
                                .globalTextStyle(config, size: 11)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Button(action: {
                                // 应用字体
                                config.selectedFont = font.familyName
                            }) {
                                Text("使用")
                                    .globalTextStyle(config, size: 10)
                                    .foregroundColor(DesignTokens.Colors.primary)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                // 删除字体
                                uploadedFonts.removeAll { $0.id == font.id }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(DesignTokens.Colors.mutedForeground)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(DesignTokens.Colors.secondary)
                        .cornerRadius(4)
                    }
                }
            }
        }
    }
    
    private func selectFontFile() {
        let panel = NSOpenPanel()
        panel.title = "选择字体文件"
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        panel.allowedContentTypes = [.font]
        
        if panel.runModal() == .OK, let url = panel.url {
            loadFont(from: url)
        }
    }
    
    private func loadFont(from url: URL) {
        // 加载字体到系统
        if let fontDataProvider = CGDataProvider(url: url as CFURL),
           let font = CGFont(fontDataProvider) {
            
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterGraphicsFont(font, &error) {
                // 获取字体名称
                if let fullName = font.fullName as String? {
                    let uploadedFont = UploadedFont(
                        name: url.lastPathComponent,
                        url: url,
                        familyName: fullName
                    )
                    uploadedFonts.append(uploadedFont)
                    
                    // 可以立即应用
                    config.selectedFont = fullName
                }
            } else if let error = error?.takeRetainedValue() {
                print("字体加载失败: \(error)")
            }
        }
    }
}

// 扩展 UTType 以支持字体文件
import UniformTypeIdentifiers

extension UTType {
    static var font: UTType {
        UTType(tag: "font", tagClass: .filenameExtension, conformingTo: nil) ?? .data
    }
}