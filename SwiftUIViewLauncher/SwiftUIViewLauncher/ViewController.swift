//
//  ViewController.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import Cocoa
import SwiftUI

class ViewController: NSViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear() {
    
  }
  
  @IBAction func presentDemoViewAsSheetButtonAction(_ sender: NSButton) {
    present(.demoView, as: .sheet)
  }
  
  
}



enum SwiftUIViews: String, CaseIterable {
  
  case demoView
  
  var rawView: some View {
    switch self {
    case .demoView: return DemoView()
    }
  }
  
  var keyIdentifier: String {
    return "\(self.rawValue)HostingIdentifier"
  }
  
  var hostingController: NSHostingController<AnyView> {
    return NSHostingController(rootView: AnyView(self.rawView))
  }
  
  var hostingView: NSHostingView<AnyView> {
    return NSHostingView(rootView: AnyView(self.rawView))
  }
  
}


enum SwiftUIViewPresentationType {
  
  enum ViewControllerType {
    case window, popover, sheet
  }
  
  enum WindowControllerType {
    case window, popover, sheet
  }
  
  enum AppDelegateType {
    case window
  }
  
}

extension NSViewController {
  
  func presentWindow(forView: SwiftU)
  
  func present(_ view: SwiftUIViews, as presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    present(view: view, withPresentation: presentationType)
  }
  
  func present(view: SwiftUIViews, withPresentation presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    let hostingController = view.hostingController
    hostingController.identifier = NSUserInterfaceItemIdentifier(rawValue: view.keyIdentifier)
    handlePresentation(hostingController: hostingController, presentationType: presentationType)
  }
  
  private func handlePresentation(hostingController: NSHostingController<AnyView>, presentationType: SwiftUIViewPresentationType.ViewControllerType) {
    switch presentationType {
    case .window: print("present window")
    case .popover: print("present popover")
    case .sheet: presentHostingControllerAsSheet(hostingController: hostingController)
    }
  }
  
  // Present Extensions
  private func presentHostingViewAsWindow(hostingController: NSHostingController<AnyView>) {
    
  }
  
  private func presentHostingControllerAsSheet(hostingController: NSHostingController<AnyView>) {
    self.presentAsSheet(hostingController)
  }
  
  
  func dismiss(view: SwiftUIViews) {
    if let presentedViewController = self.presentedViewControllers?.first(where: { $0.identifier?.rawValue == view.keyIdentifier }) {
      self.dismiss(presentedViewController)
    }
  }
  
  
}
