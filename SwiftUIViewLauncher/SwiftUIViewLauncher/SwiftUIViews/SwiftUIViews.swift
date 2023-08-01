//
//  SwiftUIViews.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import SwiftUI

enum SwiftUIViews: String, CaseIterable {
  
  case demoView   // Define your quick SwiftUI View reference
  
  /// The raw SwiftUI view to present.
  var rawView: some View {
    switch self {
    case .demoView: return DemoView()   // Link it to your SwiftUI View
    }
  }
  
}



// MARK: - Extensions
extension SwiftUIViews {
  /// Returns a string identifier for the SwiftUI view.
  var keyIdentifier: String {
    return "\(self.rawValue)HostingIdentifier"
  }
  /// Returns a `NSUserInterfaceItemIdentifier` for the SwiftUI view.
  var hostingControllerIdentifier: NSUserInterfaceItemIdentifier {
    return NSUserInterfaceItemIdentifier(rawValue: self.keyIdentifier)
  }
  /// Returns a `NSHostingController` for the SwiftUI view.
  var hostingController: NSHostingController<AnyView> {
    return NSHostingController(rootView: AnyView(self.rawView))
  }
  /// Returns a `NSHostingView` for the SwiftUI view.
  var hostingView: NSHostingView<AnyView> {
    return NSHostingView(rootView: AnyView(self.rawView))
  }
}
