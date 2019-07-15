//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class ThreadTests: XCTestCase {

  func testIsAlreadyOnMainThreadIsSuccessful() {
    let expectation = self.expectation(description: "executeClosure")
    mainThread {
      if Thread.isMainThread {
        expectation.fulfill()
        return
      }
      XCTFail()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }

  func testIsNotAlreadyOnMainThreadIsSuccessful() {
    let expectation = self.expectation(description: "executeClosure")

    DispatchQueue.global(qos: .background).async {
      mainThread {
        if Thread.isMainThread {
          expectation.fulfill()
          return
        }
        XCTFail()
      }
    }

    waitForExpectations(timeout: 2, handler: nil)
  }
}
