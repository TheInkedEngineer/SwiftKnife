//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit
import XCTest

@testable import SwiftKnife

class UIColorExtensionTests: XCTestCase {
  
  func testValidHex3WithHashtagSuccessful() {
    let hexCode = "#F30"
    let color = try! UIColor(hex: hexCode)
    let expectedColor = UIColor.init(displayP3Red: 1, green: 0.2, blue: 0, alpha: 1)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testValidHex4WithHashtagSuccessful() {
    let hexCode = "#F303"
    let color = try! UIColor(hex: hexCode)
    let expectedColor = UIColor.init(displayP3Red: 1, green: 0.2, blue: 0, alpha: 0.2)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testValidHex6WithHashtagSuccessful() {
    let hexCode = "#7f4da3"
    let color = try! UIColor(hex: hexCode)
    let expectedColor = UIColor.init(displayP3Red: 127/255, green: 77/255, blue: 163/255, alpha: 1)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testValidHex8WithHashtagSuccessful() {
    let hexCode = "#FF330033"
    let color = try! UIColor(hex: hexCode)
    let expectedColor = UIColor.init(displayP3Red: 1, green: 0.2, blue: 0, alpha: 0.2)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testHexCodeTooLong() {
    let brokenHex = "#1212121212121212"
    var error: Error?
    
    XCTAssertThrowsError(try UIColor(hex: brokenHex)) {
      error = $0
    }
    
    XCTAssertTrue(error is UIColor.HexCodeError)
    XCTAssertEqual(error as? UIColor.HexCodeError, .invalidLength)
  }
  
  func testHexCodeTooShort() {
    let brokenHex = "#12"
    var error: Error?
    
    XCTAssertThrowsError(try UIColor(hex: brokenHex)) {
      error = $0
    }
    
    XCTAssertTrue(error is UIColor.HexCodeError)
    XCTAssertEqual(error as? UIColor.HexCodeError, .invalidLength)
  }
  
  func testHexCodeInvalid() {
    let brokenHex = "ZZZ"
    var error: Error?
    
    XCTAssertThrowsError(try UIColor(hex: brokenHex)) {
      error = $0
    }
    
    XCTAssertTrue(error is UIColor.HexCodeError)
    XCTAssertEqual(error as? UIColor.HexCodeError, .invalidContent)
  }
  
  func testCGFloat3ComponentsSuccessful() {
    let components: [CGFloat]? = [0.2143, 0.1513, 0]
    let color = UIColor(components: components)
    let expectedColor = UIColor(displayP3Red: 0.2143, green: 0.1513, blue: 0, alpha: 1)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testCGFloat4ComponentsSuccessful() {
    let components: [CGFloat]? = [0.2143, 0.1513, 0, 0.5]
    let color = UIColor(components: components)
    let expectedColor = UIColor(displayP3Red: 0.2143, green: 0.1513, blue: 0, alpha: 0.5)
    XCTAssertEqual(color, expectedColor)
  }
  
  func testCGFloat2ComponentsReturnsNil() {
    let components: [CGFloat]? = [0.2143, 0.1513]
    let color = UIColor(components: components)
    XCTAssertNil(color)
  }
  
}

