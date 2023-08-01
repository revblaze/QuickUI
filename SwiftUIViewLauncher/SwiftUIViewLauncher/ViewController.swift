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
    //present(.demoView, as: .sheet)
  }
  
  @IBAction func presentDemoViewAsSheetButtonAction(_ sender: NSButton) {
    print("button clicked")
    present(.demoSheetView, as: .sheet)
  }
  
  
}



enum SwiftUIViews: String, CaseIterable {
  
  case demoSheetView
  
  var rawView: some View {
    switch self {
    case .demoSheetView: return DemoSheetView()
    }
  }
  
  var keyIdentifier: String {
    return "\(self.rawValue)HostingControllerIdentifier"
  }
  
  var hostingController: NSHostingController<AnyView> {
    return NSHostingController(rootView: AnyView(self.rawView))
  }
  
}


enum SwiftUIViewPresentationType {
  
  enum ViewControllerType {
    case sheet, window, popover
  }
  
  enum WindowControllerType {
    case window //sheet, popover?
  }
  
}

extension NSViewController {
  
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
    case .sheet: self.presentAsSheet(hostingController)
    case .window: print("present window")
    case .popover: print("present popover")
    }
  }
  
  func dismiss(view: SwiftUIViews) {
    if let presentedViewController = self.presentedViewControllers?.first(where: { $0.identifier?.rawValue == view.keyIdentifier }) {
      self.dismiss(presentedViewController)
    }
  }
  
  
}
