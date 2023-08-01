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
  
  @IBAction func presentDemoViewAsWindowButtonAction(_ sender: NSButton) {
    //present(.demoView, as: .window)
    presentWindow(view: .demoView, title: "Demo Window")
  }
  
  @IBAction func presentDemoViewAsPopoverButtonAction(_ sender: NSButton) {
    present(.demoView, as: .popover)
  }
  
}







