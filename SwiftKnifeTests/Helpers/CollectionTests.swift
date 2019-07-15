//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class CollectionTests: XCTestCase {
  func testIsNotEmptyReturnsTrue() {
    let array = [1]
    XCTAssertTrue(array.isNotEmpty)
  }

  func testIsNotEmptyReturnsFalse() {
    let array: [Int] = []
    XCTAssertFalse(array.isNotEmpty)
  }

  func testSafePositiveSubscriptSuccessful() {
    let dict = ["one", "two"]
    let element = dict[safe: 1]

    XCTAssertEqual(element, "two")
  }

  func testSafePositiveSubscriptReturnsNil() {
    let dict = ["one": 1, "two": 2]
    let element = dict[safe: 3]

    XCTAssertNil(element)
  }

  func testSafeNegativeSubscriptReturnsNil() {
    let dict = ["one": 1, "two": 2]
    let element = dict[safe: -1]

    XCTAssertNil(element)
  }
}
