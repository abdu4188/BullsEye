//
//  LeaderBoardView.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/22/23.
//

import SwiftUI

struct LeaderBoardView: View {
  @Binding var game: Game
  @Binding var leaderboardIsShowing: Bool
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack (spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack (spacing: 10) {
            ForEach(game.leaderboardEntries.indices, id: \.self) { index in
              let leaderboardEntry = game.leaderboardEntries[index]
              RowView(index: index, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  var body: some View {
    HStack {
      RoundedTextView(text: "\(index+1)")
      Spacer()
      ScoreText(text: "\(score)")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      DateText(text: date)
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }.background(content: {
      RoundedRectangle(cornerRadius: 25)
        .strokeBorder(Color("LeaderboardStrokeColor"), lineWidth: Constants.General.strokeWidth)
    })
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct HeaderView: View {
  @Binding var leaderboardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        BigBoldText(text: "Leaderboard")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsShowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }.padding([.horizontal, .top])
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewlength)
      Spacer()
      LabelViewText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LabelViewText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LeaderBoardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  static var previews: some View {
    LeaderBoardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
      .previewInterfaceOrientation(.landscapeRight)
    LeaderBoardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.dark)
  }
}
