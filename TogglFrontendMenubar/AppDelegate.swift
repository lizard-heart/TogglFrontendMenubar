//
//  AppDelegate.swift
//  TogglFrontendMenubar
//
//  Created by Henry Gustafson on 1/20/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    static var shared: AppDelegate {
        return NSApp.delegate as! AppDelegate
    }
    
    lazy var app: Application = Application.default()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.start()
        statusItem.button?.title = "⌛️"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showSettings() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("couldn't find viewcontroller")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
    }
 
}

