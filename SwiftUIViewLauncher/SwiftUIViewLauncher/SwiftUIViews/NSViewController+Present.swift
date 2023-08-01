//
//  NSViewController+Present.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import Cocoa
import SwiftUI

extension NSViewController {

  // MARK: Quick Present
  
  func present(_ view: SwiftUIViews, as presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    handlePresentation(forView: view, presentationType: presentationType)
  }
  
  // MARK: Present with Properties
  
  func presentWindow(view: SwiftUIViews, title: String? = nil, width: CGFloat? = nil, height: CGFloat? = nil, minWidth: CGFloat? = nil, minHeight: CGFloat? = nil) {
    // Create a new window
    let window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: width ?? 400, height: height ?? 600),
      styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
      backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName(view.keyIdentifier)
    window.contentView = NSHostingView(rootView: view.rawView)
    window.title = title ?? ""
    
    // Set minimum window size
    window.minSize = NSSize(width: minWidth ?? 300, height: minHeight ?? 400)
    
    // Create a new window controller
    let windowController = NSWindowController(window: window)
    windowController.showWindow(nil)
  }
  
  
  
  // MARK: - Presentation Handlers
  
  private func handlePresentation(forView view: SwiftUIViews, presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    switch presentationType {
    case .window: presentAsWindow(forView: view)
    case .popover: presentAsPopover(forView: view)
    case .sheet: presentAsSheet(forView: view)
    }
  }
  
  private func presentAsWindow(forView view: SwiftUIViews) {
    presentWindow(view: view)
  }
  
  private func presentAsPopover(forView view: SwiftUIViews) {
    let popover = NSPopover()
    let hostingController = view.hostingController
    hostingController.identifier = view.hostingControllerIdentifier
    popover.contentViewController = hostingController
    popover.behavior = .transient
    popover.show(relativeTo: .zero, of: self.view, preferredEdge: .minY)
  }
  
  private func presentAsSheet(forView view: SwiftUIViews) {
    let hostingController = view.hostingController
    hostingController.identifier = view.hostingControllerIdentifier
    self.presentAsSheet(hostingController)
  }
  
  
  
  // MARK: Dismiss
  
  func dismiss(view: SwiftUIViews) {
    if let presentedViewController = self.presentedViewControllers?.first(where: { $0.identifier?.rawValue == view.keyIdentifier }) {
      self.dismiss(presentedViewController)
    }
  }
  
}
