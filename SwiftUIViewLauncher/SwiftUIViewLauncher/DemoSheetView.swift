//
//  DemoSheetView.swift
//  SwiftUIViewLauncher
//
//  Created by Justin Bush on 8/1/23.
//

import SwiftUI

class DemoSheetViewModel: ObservableObject {
  @Published var isPresented: Bool = false
}

struct DemoSheetView: View {
  //@Binding var isPresented: Bool
  
  var body: some View {
    VStack {
      Text("Hello, world!")
      
      Button("Dismiss") {
        //self.isPresented = false
      }
    }
    .frame(minWidth: 400, minHeight: 300)
  }
}

//struct DemoView_Previews: PreviewProvider {
//  static var previews: some View {
//    DemoView()
//  }
//}
