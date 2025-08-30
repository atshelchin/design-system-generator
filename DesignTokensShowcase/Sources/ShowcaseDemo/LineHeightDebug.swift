//
//  LineHeightDebug.swift
//  Debug line height calculations
//

import SwiftUI
import DesignTokensKit

struct LineHeightDebugView: View {
    @ObservedObject var config: DesignTokensConfig
    @State private var testFontSize: CGFloat = 14
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Debug info
                VStack(alignment: .leading, spacing: 12) {
                    Text("Debug Information")
                        .font(.system(size: 18, weight: .bold))
                    
                    Text("Font Size: \(testFontSize, specifier: "%.1f")px")
                    Text("Font Scale: \(config.fontScale, specifier: "%.2f")")
                    Text("Actual Font Size: \(testFontSize * config.fontScale, specifier: "%.1f")px")
                    Text("Line Height Setting: \(lineHeightName)")
                    Text("Line Height Multiplier: \(lineHeightMultiplier, specifier: "%.1f")")
                    Text("Expected Line Spacing: \(expectedLineSpacing, specifier: "%.1f")px")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
                Divider()
                
                // Test 1: Basic lineSpacing test
                VStack(alignment: .leading, spacing: 16) {
                    Text("Test 1: Direct lineSpacing Application")
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("Line 1\nLine 2\nLine 3\nLine 4\nLine 5")
                        .font(.system(size: testFontSize))
                        .lineSpacing(expectedLineSpacing)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .overlay(
                            GeometryReader { geometry in
                                Color.clear.onAppear {
                                    print("Test 1 height: \(geometry.size.height)")
                                }
                            }
                        )
                }
                
                // Test 2: Using globalTextStyle
                VStack(alignment: .leading, spacing: 16) {
                    Text("Test 2: Using globalTextStyle Modifier")
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("Line 1\nLine 2\nLine 3\nLine 4\nLine 5")
                        .globalTextStyle(config, size: testFontSize)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .overlay(
                            GeometryReader { geometry in
                                Color.clear.onAppear {
                                    print("Test 2 height: \(geometry.size.height)")
                                }
                            }
                        )
                }
                
                // Test 3: Manual calculation verification
                VStack(alignment: .leading, spacing: 16) {
                    Text("Test 3: Side-by-side Comparison")
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(alignment: .top, spacing: 20) {
                        // No line spacing
                        VStack(alignment: .leading) {
                            Text("No Spacing (1.0x)")
                                .font(.system(size: 12, weight: .semibold))
                            Text("Line 1\nLine 2\nLine 3")
                                .font(.system(size: testFontSize))
                                .lineSpacing(0)
                                .padding(8)
                                .background(Color.red.opacity(0.1))
                        }
                        
                        // Current setting
                        VStack(alignment: .leading) {
                            Text("Current: \(lineHeightName)")
                                .font(.system(size: 12, weight: .semibold))
                            Text("Line 1\nLine 2\nLine 3")
                                .font(.system(size: testFontSize))
                                .lineSpacing(expectedLineSpacing)
                                .padding(8)
                                .background(Color.orange.opacity(0.1))
                        }
                        
                        // Maximum spacing
                        VStack(alignment: .leading) {
                            Text("Max (2.2x)")
                                .font(.system(size: 12, weight: .semibold))
                            Text("Line 1\nLine 2\nLine 3")
                                .font(.system(size: testFontSize))
                                .lineSpacing(testFontSize * 1.2) // 2.2 - 1 = 1.2
                                .padding(8)
                                .background(Color.purple.opacity(0.1))
                        }
                    }
                }
                
                // Test 4: Real-time adjustment
                VStack(alignment: .leading, spacing: 16) {
                    Text("Test 4: Real-time Line Height Adjustment")
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(spacing: 16) {
                        Button("Normal (1.6x)") {
                            config.lineHeight = .normal
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Relaxed (1.8x)") {
                            config.lineHeight = .relaxed
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Loose (2.2x)") {
                            config.lineHeight = .loose
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Text("This is a paragraph of text that demonstrates line height changes. When you click the buttons above, this text should immediately update its line spacing. The spacing between lines should be visibly different for each setting. Normal provides compact spacing, Relaxed gives moderate spacing, and Loose provides the most generous spacing between lines.")
                        .font(.system(size: testFontSize * config.fontScale))
                        .lineSpacing(expectedLineSpacing)
                        .padding()
                        .background(Color.yellow.opacity(0.1))
                        .animation(.easeInOut(duration: 0.3), value: config.lineHeight)
                }
                
                // Test 5: Font size slider
                VStack(alignment: .leading, spacing: 16) {
                    Text("Test 5: Font Size Impact")
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack {
                        Text("Font Size:")
                        Slider(value: $testFontSize, in: 10...24, step: 1)
                        Text("\(testFontSize, specifier: "%.0f")px")
                    }
                    
                    Text("Adjustable font size text\nLine 2 of adjustable text\nLine 3 of adjustable text")
                        .font(.system(size: testFontSize * config.fontScale))
                        .lineSpacing(testFontSize * config.fontScale * (lineHeightMultiplier - 1))
                        .padding()
                        .background(Color.cyan.opacity(0.1))
                }
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(config.isDarkMode ? Color.black : Color.white)
    }
    
    private var lineHeightName: String {
        switch config.lineHeight {
        case .relaxed: return "Relaxed (1.8x)"
        case .loose: return "Loose (2.2x)"
        default: return "Normal (1.6x)"
        }
    }
    
    private var lineHeightMultiplier: CGFloat {
        return config.lineHeight.value
    }
    
    private var expectedLineSpacing: CGFloat {
        let actualFontSize = testFontSize * config.fontScale
        return actualFontSize * (lineHeightMultiplier - 1)
    }
}