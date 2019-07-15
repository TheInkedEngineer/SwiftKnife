//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class DateTests: XCTestCase {

  func testIsTodayIsSuccessful() {
    let now = Date()
    XCTAssertTrue(now.isToday)
  }

  func testIsTodayIsNotSuccessful() {
    var now = Date()
    now.addTimeInterval(-333000)
    XCTAssertFalse(now.isToday)
  }

  func testIsPastDayIsSuccessful() {
    let now = Date().addingTimeInterval(-300000)
    XCTAssertTrue(now.isDayFromPast)
  }

  func testIsPastDayIsNotSuccessful() {
    let now = Date().addingTimeInterval(3000)
    XCTAssertFalse(now.isDayFromPast)
  }

  func testIsFutureDayIsSuccessful() {
    let now = Date().addingTimeInterval(3000)
    XCTAssertTrue(now.isDayFromFuture)
  }

  func testIsFutureDayIsNotSuccessful() {
    let now = Date().addingTimeInterval(-86401)
    XCTAssertFalse(now.isDayFromFuture)
  }

  func testDayNumberIsSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    XCTAssertEqual(date.dayNumber, 8)
  }

  func testDayNumberIsNotSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    XCTAssertFalse(date.dayNumber != 8)
  }

  func testMonthNameShortIsSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    let month = Date.monthName(date: date, returnShortVersion: true)
    XCTAssertEqual(month, "Jul")
  }

  func testMonthNameShortIsNotSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    let month = Date.monthName(date: date, returnShortVersion: true)
    XCTAssertFalse(month != "Jul")
  }


  func testMonthLongShortIsSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    let month = Date.monthName(date: date, returnShortVersion: false)
    XCTAssertEqual(month, "July")
  }

  func testMonthLongShortIsNotSuccessful() {
    let date = Date(timeIntervalSince1970: 1562537553)
    let month = Date.monthName(date: date, returnShortVersion: false)
    XCTAssertFalse(month != "July")
  }
}
