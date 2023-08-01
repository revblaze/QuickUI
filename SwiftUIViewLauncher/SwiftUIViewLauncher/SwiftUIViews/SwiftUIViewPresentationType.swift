//
//  SwiftUIViewPresentationType.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

/// The presentation types, per controller level, in which to present a SwiftUI view.
enum SwiftUIViewPresentationType {
  
  /// The presentation types available to the ViewController.
  enum ViewControllerType {
    /// Presentation type for presenting the SwiftUI view in a new window.
    case window
    /// Presentation type for presenting the SwiftUI view in a popover.
    case popover
    /// Presentation type for presenting the SwiftUI view in a sheet.
    case sheet
  }
  
  /// The presentation types available to the WindowController.
  enum WindowControllerType {
    /// Presentation type for presenting the SwiftUI view in a new window.
    case window
    /// Presentation type for presenting the SwiftUI view in a popover.
    case popover
    /// Presentation type for presenting the SwiftUI view in a sheet.
    case sheet
  }
  
  /// The presentation types available to the AppDelegate.
  enum AppDelegateType {
    /// Presentation type for presenting the SwiftUI view in a new window.
    case window
  }
}
