//
//  ContentView.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/5/23.
//

import SwiftUI

struct ContentView: View {
  @State private var sliderValue = 50.0
  @State private var alertIsVisible = false
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
        .ignoresSafeArea()
      Text("").foregroundColor(Color("TextColor"))
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          PointsView(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .zIndex(1)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
        InstructionText(text: "🎯 🎯🎯 \n Put the BULLSEYE as close as you can to")
          .padding(.horizontal, 30)
        BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue:  Double
  var body: some View {
    HStack {
      SliderViewText(text: "1")
        .frame(width: 35)
      Slider(
        value: $sliderValue,
        in: 1.0...100.0
      )
      SliderViewText(text: "100")
        .frame(width: 35)
    }
  }
}


struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
    var body: some View {
      Button("Hit Me".uppercased()) {
        withAnimation {
          alertIsVisible = true
        }
      }
      .font(.title3)
      .bold()
      .padding(20.0)
      .background(
        ZStack {
          Color("ButtonColor")
          LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        }
      )
      .overlay(content: {
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
      })
      .foregroundColor(.white)
      .cornerRadius(Constants.General.roundRectCornerRadius)
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
      
  }
}
