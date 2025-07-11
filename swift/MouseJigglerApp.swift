import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private var jiggleTimer: Timer?
    private var isRunning = false
    private let jiggler = MouseJiggler()
    
    private enum JiggleMode {
        case always
        case nightOnly
    }
    private var mode: JiggleMode = .nightOnly
    
    static func main() {
        let delegate = AppDelegate()
        NSApplication.shared.delegate = delegate
        _ = delegate // Keep a strong reference
        NSApplication.shared.run()
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusBar()
    }
    
    private func setupStatusBar() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if statusItem.button != nil {
            updateStatusBarIcon()
            
            let menu = NSMenu()
            
            let toggleItem = NSMenuItem(title: "Start", action: #selector(toggleJiggle), keyEquivalent: "")
            menu.addItem(toggleItem)
            
            let modeItem = NSMenuItem(title: modeMenuTitle(), action: #selector(toggleMode), keyEquivalent: "m")
            menu.addItem(modeItem)
            
            menu.addItem(NSMenuItem.separator())
            
            let quitItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")
            menu.addItem(quitItem)
            
            statusItem.menu = menu
        }
    }
    
    private func updateStatusBarIcon() {
        guard let button = statusItem?.button else { return }
        let title = "J"
        let attrTitle = NSMutableAttributedString(string: title)
        if isRunning {
            attrTitle.addAttribute(.foregroundColor, value: NSColor.white, range: NSRange(location: 0, length: title.count))
            button.layer?.backgroundColor = NSColor.black.cgColor
        } else {
            attrTitle.addAttribute(.foregroundColor, value: NSColor.black, range: NSRange(location: 0, length: title.count))
            button.layer?.backgroundColor = NSColor.white.cgColor
        }
        button.attributedTitle = attrTitle
        button.wantsLayer = true
        button.layer?.cornerRadius = 6
    }
    
    private func modeMenuTitle() -> String {
        switch mode {
        case .always:
            return "Mode: Always (click to switch)"
        case .nightOnly:
            return "Mode: Night Only (click to switch)"
        }
    }
    
    @objc private func toggleMode() {
        mode = (mode == .nightOnly) ? .always : .nightOnly
        statusItem.menu?.item(at: 1)?.title = modeMenuTitle()
    }
    
    @objc private func toggleJiggle() {
        isRunning.toggle()
        updateStatusBarIcon()
        if isRunning {
            statusItem.menu?.item(at: 0)?.title = "Stop"
            startJiggling()
        } else {
            statusItem.menu?.item(at: 0)?.title = "Start"
            stopJiggling()
        }
    }
    
    private func startJiggling() {
        jiggleTimer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            switch self.mode {
            case .always:
                self.jiggler.jiggleMouse()
            case .nightOnly:
                if self.jiggler.isNightTime() {
                    self.jiggler.jiggleMouse()
                }
            }
        }
        jiggleTimer?.fire()
    }
    
    private func stopJiggling() {
        jiggleTimer?.invalidate()
        jiggleTimer = nil
    }
    
    @objc private func quit() {
        NSApplication.shared.terminate(self)
    }
}


