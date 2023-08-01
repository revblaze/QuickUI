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
  
  /// Presents a SwiftUI view as a specific presentation type.
  /// - Parameters:
  ///   - view: The SwiftUI view to present.
  ///   - presentationType: The type of presentation to use.
  func present(_ view: SwiftUIViews, as presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    handlePresentation(forView: view, presentationType: presentationType)
  }
  
  // MARK: Present with Properties
  
  /// Presents a SwiftUI view as a new window.
  /// - Parameters:
  ///   - view: The SwiftUI view to present.
  ///   - title: The title of the window. Default is nil.
  ///   - width: The width of the window. Default is 400.
  ///   - height: The height of the window. Default is 600.
  ///   - minWidth: The minimum width of the window. Default is 200.
  ///   - minHeight: The minimum height of the window. Default is 300.
  func presentWindow(view: SwiftUIViews, title: String? = nil, width: CGFloat = 400, height: CGFloat = 600, minWidth: CGFloat = 200, minHeight: CGFloat = 300) {
    // Create a new window
    let window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: width, height: height),
      styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
      backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName(view.keyIdentifier)
    window.contentView = NSHostingView(rootView: view.rawView)
    window.title = title ?? ""
    
    // Set minimum window size
    window.minSize = NSSize(width: minWidth, height: minHeight)
    
    // Create a new window controller
    let windowController = NSWindowController(window: window)
    windowController.showWindow(nil)
  }
  
  
  
  // MARK: - Presentation Handlers
  
  /// Handles the presentation of a SwiftUI view.
  /// - Parameters:
  ///   - view: The SwiftUI view to present.
  ///   - presentationType: The type of presentation to use.
  private func handlePresentation(forView view: SwiftUIViews, presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    switch presentationType {
    case .window: presentAsWindow(forView: view)
    case .popover: presentAsPopover(forView: view)
    case .sheet: presentAsSheet(forView: view)
    }
  }
  
  /// Presents a SwiftUI view as a new window.
  /// - Parameter view: The SwiftUI view to present.
  private func presentAsWindow(forView view: SwiftUIViews) {
    presentWindow(view: view)
  }
  
  /// Presents a SwiftUI view as a popover.
  /// - Parameter view: The SwiftUI view to present.
  private func presentAsPopover(forView view: SwiftUIViews) {
    let popover = NSPopover()
    let hostingController = view.hostingController
    hostingController.identifier = view.hostingControllerIdentifier
    popover.contentViewController = hostingController
    popover.behavior = .transient
    popover.show(relativeTo: .zero, of: self.view, preferredEdge: .minY)
  }
  
  /// Presents a SwiftUI view as a sheet.
  /// - Parameter view: The SwiftUI view to present.
  private func presentAsSheet(forView view: SwiftUIViews) {
    let hostingController = view.hostingController
    hostingController.identifier = view.hostingControllerIdentifier
    self.presentAsSheet(hostingController)
  }
  
  
  
  // MARK: Dismiss
  
  /// Dismisses a presented SwiftUI view.
  /// - Parameter view: The SwiftUI view to dismiss.
  func dismiss(view: SwiftUIViews) {
    if let presentedViewController = self.presentedViewControllers?.first(where: { $0.identifier?.rawValue == view.keyIdentifier }) {
      self.dismiss(presentedViewController)
    }
  }
  
}
