//
//  Bulls_eyeTests.swift
//  Bulls eyeTests
//
//  Created by Abdulaziz Yesuf Asmare on 5/7/23.
//

import XCTest
@testable import Bulls_eye

final class Bulls_eyeTests: XCTestCase {
  var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      game = nil
    }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testScoreExact() {
    let guess = game.target
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 200)
  }
  
  func testScoreClose() {
    let guess = game.target + 2
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testReset() {
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)
  }
  
  func testLeaderboard() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    XCTAssertEqual(game.leaderboardEntries[0].score, 100)
    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
    XCTAssertEqual(game.leaderboardEntries[0].score, 200)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
