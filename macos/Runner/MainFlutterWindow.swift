import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    var windowFrame = self.frame
    self.titlebarAppearsTransparent = true
    self.minSize = NSSize(width: 1000, height: 400)
    windowFrame.size = NSSize(width: 1266, height: 668)
    self.contentViewController = flutterViewController
    self.isOpaque = false
    self.setFrame(windowFrame, display: true)
  
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
