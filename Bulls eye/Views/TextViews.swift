//
//  TextViews.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/16/23.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .multilineTextAlignment(.center)
      .bold()
      .opacity(1)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2)
  }
}

struct BigNumberText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .fontWeight(.black)
      .kerning(-1)
  }
}

struct SliderViewText: View {
  var text: String
  var body: some View {
      Text(text)
        .bold()
  }
}

struct LabelViewText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
  }
}

struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.subheadline)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}


struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(Color.white)
      .font(.headline)
      .bold()
      .cornerRadius(12)
  }
}

struct ScoreText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title3)
      .bold()
  }
}

struct DateText: View {
  var text: Date
  var body: some View {
    Text(text, style: .time)
  }
}

struct BigBoldText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .font(.title)
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instruction")
      BigNumberText(text: "100")
      SliderViewText(text: "1")
      LabelViewText(text: "Round")
      BodyText(text: "You scored 200 Points\n 🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(text: "100")
      DateText(text: Date())
      BigBoldText(text: "Leaderboard")
    }.padding()
  }
}
