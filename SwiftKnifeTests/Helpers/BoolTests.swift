//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class BoolTests: XCTestCase {
  func testInverted() {
    let boolOne = true
    let boolTwo = boolOne.inverted
    XCTAssertFalse(boolTwo)
  }

  func testBoolToCGFloat1() {
    let bool = true
    XCTAssertEqual(bool.cgFloat, 1.0)
  }

  func testBoolToCGFloat0() {
    let bool = false
    XCTAssertEqual(bool.cgFloat, 0.0)
  }
}
