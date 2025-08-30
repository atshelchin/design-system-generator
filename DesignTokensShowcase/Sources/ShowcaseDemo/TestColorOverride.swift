import SwiftUI
import DesignTokensKit

struct TestColorOverride: View {
    @StateObject private var config = DesignTokensConfig.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Text("测试颜色覆盖")
                .font(.title)
            
            Divider()
            
            // 测试1: globalTextStyle 不加 foregroundColor
            Text("1. globalTextStyle 默认颜色")
                .globalTextStyle(config, size: 16)
            
            // 测试2: globalTextStyle + foregroundColor
            Text("2. globalTextStyle + .foregroundColor(.red)")
                .globalTextStyle(config, size: 16)
                .foregroundColor(.red)
            
            // 测试3: foregroundColor + globalTextStyle
            Text("3. .foregroundColor(.red) + globalTextStyle")
                .foregroundColor(.red)
                .globalTextStyle(config, size: 16)
            
            // 测试4: globalTextStyleNoColor + foregroundColor
            Text("4. globalTextStyleNoColor + .foregroundColor(.red)")
                .globalTextStyleNoColor(config, size: 16)
                .foregroundColor(.red)
            
            Divider()
            
            Text("结论：")
                .font(.headline)
            Text("• 测试2应该是默认色（globalTextStyle覆盖了red）")
            Text("• 测试3应该是默认色（globalTextStyle覆盖了red）")
            Text("• 测试4应该是红色（globalTextStyleNoColor不设置颜色）")
        }
        .padding()
        .frame(width: 600, height: 400)
        .background(DesignTokens.Colors.background)
    }
}