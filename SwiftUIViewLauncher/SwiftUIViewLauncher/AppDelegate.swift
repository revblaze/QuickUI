//
//  AppDelegate.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  
  // Must be defined for presenting windows
  var windows = [NSWindow]()
  
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
  
  
}

