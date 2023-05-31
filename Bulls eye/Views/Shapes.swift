//
//  Shapes.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/16/23.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .strokeBorder(Color.white, lineWidth: 20)
  //        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
          .frame(width: 200, height: 100)
          .background(Color.green)
          .transition(.opacity)
      }
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
//        .animation(.easeInOut, value: wideShapes)
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      
      Button("Animate") {
        withAnimation{
            wideShapes.toggle()
        }
      }
    }
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
