//
//  Game.swift
//  Bulls eye
//
//  Created by Abdulaziz Yesuf Asmare on 5/6/23.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      addToLeaderboard(score: 100)
      addToLeaderboard(score: 400)
      addToLeaderboard(score: 50)
      addToLeaderboard(score: 200)
      addToLeaderboard(score: 1100)
    }
  }
  
  func points(sliderValue: Int) -> Int {
    if ( target - sliderValue == 0 ){
      return 200
    }
    else if ( abs(target - sliderValue) <= 2) {
      return 100 - abs(target - sliderValue) + 50
    }
    return 100 - abs(target - sliderValue)
  }
  
  mutating func startNewRound(points: Int) {
    addToLeaderboard(score: points)
    score += points
    round += 1
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(score: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
    leaderboardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }
}

struct LeaderboardEntry {
  let score: Int
  let date: Date
}
