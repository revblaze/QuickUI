//
//  SwiftUIViews.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import SwiftUI

enum SwiftUIViews: String, CaseIterable {
  
  // Define your SwiftUI View
  case demoView
  
  // Link it to your SwiftUI View object
  var rawView: some View {
    switch self {
    case .demoView: return DemoView()
    }
  }
  
}



extension SwiftUIViews {
  
  var keyIdentifier: String {
    return "\(self.rawValue)HostingIdentifier"
  }
  
  var hostingControllerIdentifier: NSUserInterfaceItemIdentifier {
    return NSUserInterfaceItemIdentifier(rawValue: self.keyIdentifier)
  }
  
  var hostingController: NSHostingController<AnyView> {
    return NSHostingController(rootView: AnyView(self.rawView))
  }
  
  var hostingView: NSHostingView<AnyView> {
    return NSHostingView(rootView: AnyView(self.rawView))
  }
  
  
  
}
