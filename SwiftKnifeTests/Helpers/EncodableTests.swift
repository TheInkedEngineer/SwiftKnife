//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

import XCTest
@testable import SwiftKnife

class EncodableTests: XCTestCase {

  func testEncodableAsDictionarySuccessful() {

    struct User: Encodable {
      enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
      }

      let firstName: String
    }

    let encoder = JSONEncoder()
    let userDictionary = User(firstName: "Firas").dictionary(with: encoder)

    XCTAssertEqual(userDictionary?["first_name"] as? String, "Firas")
  }

  func testEncodableAsDictionaryFailure() {

    struct User: Encodable {
      enum CodingKeys: String, CodingKey {
        case age
      }

      let age: Int

      func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        guard self.age > 18 else {
          throw(NSError())
        }
        try? values.encode(self.age, forKey: .age)
      }
    }

    let encoder = JSONEncoder()
    let userDictionary = User(age: 5).dictionary(with: encoder)

    XCTAssertNil(userDictionary)
  }
}

