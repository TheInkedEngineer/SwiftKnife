//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class UIViewTests: XCTestCase {
  func testViewIsVisible() {
    let view = UIView()
    view.isHidden = true

    XCTAssertFalse(view.isVisible)

    view.isVisible = true
    XCTAssertTrue(view.isVisible)
  }
}
