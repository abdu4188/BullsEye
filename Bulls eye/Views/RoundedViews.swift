//
//  RoundedImageViewStroked.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/16/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName:  String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewlength, height: Constants.General.roundedViewlength)
      .overlay(content: {
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      })
  }
}

struct RoundedImageViewFilled: View {
  var systemName:  String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewlength, height: Constants.General.roundedViewlength)
      .background(content: {
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      })
  }
}

struct RoundedRectTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title3)
      .bold()
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .background(content: {
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      })
  }
}

struct RoundedTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundedViewlength, height: Constants.General.roundedViewlength)
      .background(
        Circle()
          .strokeBorder(Color("LeaderboardStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}


struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "list.dash")
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedRectTextView(text: "3")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
