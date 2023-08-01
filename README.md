# QuickUI
 A quick way of presenting and handling SwiftUI hosting views and controllers from within an AppKit/Cocoa environment.
 
 This is simply practice at creating convenient Swift extensions, as well as making Swift syntax more Swifty.

## Example Setup

Goal for this example: Present a SwiftUI `View`, **DemoView**, from an `NSViewController`, **ViewController**.

### 1. Define DemoView

`case demoView: DemoView()` → SwiftUIViews.swift

```swift
enum SwiftUIViews: String, CaseIterable {
  
  case demoView   // Define your quick SwiftUI View reference
  
  /// The raw SwiftUI view to present.
  var rawView: some View {
    switch self {
    case .demoView: return DemoView()   // Link it to your SwiftUI View
    }
  }
  
}
```

### 2. Call DemoView from ViewController

```swift
// present as window
present(.demoView, as: .window)

// present as popover
present(.demoView, as: .popover)

// present as sheet
present(.demoView, as: .sheet)

// extra customization (if needed)
presentWindow(view: .demoView, title: "Demo Window", minWidth: 400, minHeight: 600)
```
