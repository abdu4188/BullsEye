//
//  PointsView.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/19/23.
//

import SwiftUI

struct PointsView: View {
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack (spacing: 10) {
      InstructionText(text: "The Slider's Value IS")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) points \n 🎉🎉🎉")
      Button(action: {
        game.startNewRound(points: points)
        withAnimation {
          alertIsVisible = false
        }
      }, label: {
        ButtonText(text: "Start New Round")
      })
    }
      .padding()
      .frame(maxWidth: 300)
      .background(
        Color("BackgroundColor")
      )
      .cornerRadius(Constants.General.roundRectCornerRadius)
      .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())

  
  static var previews: some View {
    PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
    PointsView(game: game, alertIsVisible: alertIsVisible, sliderValue: sliderValue)
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
