//
//  main.swift
//  DesignTokensShowcase
//
//  Entry point for the SwiftUI macOS application
//

import SwiftUI
import DesignTokensKit
import AppKit

// Create the SwiftUI app
struct DesignTokensShowcaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentViewFinal()
                .frame(minWidth: 1200, minHeight: 800)
        }
    }
}

// Main entry point
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()

// App Delegate
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the SwiftUI view - 使用新的单页面展示
        let contentView = SinglePageShowcaseView()
        
        // Create the window and set the content view
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1400, height: 900),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.title = "Design Tokens Showcase"
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}