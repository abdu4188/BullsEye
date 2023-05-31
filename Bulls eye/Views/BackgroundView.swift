//
//  BackgroundView.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/16/23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct TopView: View {
  @State private var leaderboardIsShowing = false
  @Binding var game: Game
  var body: some View {
    HStack {
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button {
        leaderboardIsShowing = true
      } label: {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing, content: {
        LeaderBoardView(game: $game, leaderboardIsShowing: $leaderboardIsShowing)
      })
    }.padding(.top)
  }
}

struct BottomView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  var body: some View {
    VStack {
      LabelViewText(text: title)
      RoundedRectTextView(text: text)
    }
  }
}

struct RingsView: View {
  @Environment (\.colorScheme) var colorScheme
  var body: some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let startOpacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(colors: [Color("CircleStrokeColor").opacity(
              startOpacity * 0.8
            ), Color("CircleStrokeColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
      }
    }
  }
}



struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
