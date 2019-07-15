//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import XCTest
@testable import SwiftKnife

class StringTests: XCTestCase {
  let string = "This is a dummy string"

  func testIsCapitalized() {
    XCTAssertTrue(string.isCapitalized)
  }

  func testIsNotCapitalized() {
    XCTAssertFalse(string.lowercased().isCapitalized)
  }

  func testIsDigitsSuccessful() {
    XCTAssertTrue("1234".isDigits)
  }

  func testIsDigitsFailure() {
    XCTAssertFalse("1234d".isDigits)
  }

  func testIsLowercasedSuccessful() {
    XCTAssertTrue("abc".isLowercased)
  }

  func testIsLowercasedFailureForUppercase() {
    XCTAssertFalse("abcD".isLowercased)
  }

  func testIsLowercasedFailureForNumber() {
    XCTAssertFalse("abc3".isLowercased)
  }

  func testIsUppercasedSuccessful() {
    XCTAssertTrue("ABC".isUppercased)
  }

  func testIsUppercasedFailureForUppercase() {
    XCTAssertFalse("abcD".isUppercased)
  }

  func testIsUppercasedFailureForNumber() {
    XCTAssertFalse("AB3".isUppercased)
  }

  func testContainsUppercaseSuccessful() {
    XCTAssertTrue("ABC".containsUppercase)
  }

  func testContainsUppercaseSuccessfulAtLeastOneUppercase() {
    XCTAssertTrue("abcD".containsUppercase)
  }

  func testContainsUppercaseFailureForAllLowercase() {
    XCTAssertFalse("abcd".containsUppercase)
  }

  func testContainsUppercaseFailureForAllNumber() {
    XCTAssertFalse("1233".containsUppercase)
  }

  func testContainsLowercaseSuccessful() {
    XCTAssertTrue("abc".containsLowercase)
  }

  func testContainsLowercaseSuccessfulAtLeastOneLowercase() {
    XCTAssertTrue("ABcD".containsLowercase)
  }

  func testContainsLowercaseFailureForAllLowercase() {
    XCTAssertFalse("ABCD".containsLowercase)
  }

  func testContainsLowercaseFailureForAllNumber() {
    XCTAssertFalse("1233".containsLowercase)
  }

  func testRandomStringCorrectLength() {
    let randomString = String.random(length: 3)
    XCTAssertEqual(randomString.count, 3)
  }

  func testRandomStringAllLowercase() {
    let randomString = String.random(
      length: 3,
      includeLowercaseLetters: true,
      includeCapitalLetters: false,
      includeDigits: false
    )
    XCTAssertTrue(randomString.isLowercased)
  }

  func testRandomStringAllUppercased() {
    let randomString = String.random(
      length: 3,
      includeLowercaseLetters: false,
      includeCapitalLetters: true,
      includeDigits: false
    )
    XCTAssertTrue(randomString.isUppercased)
  }

  func testRandomStringAllDigits() {
    let randomString = String.random(
      length: 3,
      includeLowercaseLetters: false,
      includeCapitalLetters: false,
      includeDigits: true
    )
    XCTAssertTrue(randomString.isDigits)
  }

  func testRandomStringFromAdditonalCharacters() {
    let randomString = String.random(
      length: 3,
      includeLowercaseLetters: false,
      includeCapitalLetters: false,
      includeDigits: false,
      additionalCharacters: "12"
    )
    XCTAssertTrue(randomString.isDigits)
  }

  func testRandomDigitsGeneration() {
    let randomString = String.randomDigits(length: 6)
    XCTAssertTrue(randomString.isDigits)
    XCTAssertEqual(randomString.count, 6)
  }

  func testRandomStringReturnsEmpty() {
    let randomString = String.random(
      length: 3,
      includeLowercaseLetters: false,
      includeCapitalLetters: false,
      includeDigits: false,
      additionalCharacters: ""
    )
    XCTAssertTrue(randomString.isEmpty)
  }

  func testSubscriptOfSingleCharacterAtGivenPositiveIndex() {
    let characterAsStringAt3: String = string[3]
    XCTAssertEqual(characterAsStringAt3, "s")

    let characterAt3: Character = string[3]
    XCTAssertEqual(characterAt3, Character("s"))
  }

  func testSubscriptOfSingleCharacterAtIndex0() {
    let characterAsStringAt0: String = string[0]
    XCTAssertEqual(characterAsStringAt0, "T")

    let characterAt0: Character = string[0]
    XCTAssertEqual(characterAt0, Character("T"))
  }

  func testSubscriptOfSingleCharacterAtGivenNegativeIndex() {
    let characterAsStringAt3: String = string[-3]
    XCTAssertEqual(characterAsStringAt3, "i")

    let characterAt3: Character = string[-3]
    XCTAssertEqual(characterAt3, Character("i"))
  }

  func testSafeSubscriptOfSingleCharacterAtGivenPositiveIndex() {
    let characterAsStringAt3: String? = string[safe: 3]
    XCTAssertEqual(characterAsStringAt3, "s")

    let characterAt3: Character? = string[safe: 3]
    XCTAssertEqual(characterAt3, Character("s"))
  }

  func testSafeSubscriptOfSingleCharacterAtIndex0() {
    let characterAsStringAt0: String? = string[safe: 0]
    XCTAssertEqual(characterAsStringAt0, "T")

    let characterAt0: Character? = string[safe: 0]
    XCTAssertEqual(characterAt0, Character("T"))
  }

  func testSafeSubscriptOfSingleCharacterAtGivenNegativeIndex() {
    let characterAsStringAt3: String? = string[safe: -3]
    XCTAssertEqual(characterAsStringAt3, "i")

    let characterAt3: Character? = string[safe: -3]
    XCTAssertEqual(characterAt3, Character("i"))
  }

  func testSubscriptOfSingleCharacterReturnsNilBecauseOutOfBounds() {
    let characterAsStringAt3: String? = string[safe: -333]
    XCTAssertNil(characterAsStringAt3)

    let characterAt3: Character? = string[safe: 333]
    XCTAssertNil(characterAt3)
  }

  func testFetchingSubscriptWithOpenRangeSuccessful() {
    let substring = string[0..<10]
    XCTAssertEqual(substring, "This is a ")
  }

  func testSafeFetchingSubscriptWithOpenRangeSuccessful() {
    let substring = string[safe: 0..<10]
    XCTAssertEqual(substring, "This is a ")
  }

  func testFetchingSubscriptWithOpenRangeOutOfUpperBounds() {
    let substring = string[safe: 0..<100]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithOpenRangeOutOfLowerBounds() {
    let substring = string[safe: -10..<10]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithClosedRangeSuccessful() {
    let substring = string[1...10]
    XCTAssertEqual(substring, "his is a d")
  }

  func testSafeFetchingSubscriptWithClosedRangeSuccessful() {
    let substring = string[safe: 1...10]
    XCTAssertEqual(substring, "his is a d")
  }

  func testFetchingSubscriptWithClosedRangeOutOfUpperBounds() {
    let substring = string[safe: 1...100]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithClosedRangeOutOfLowerBounds() {
    let substring = string[safe: -1...10]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithPartialThroughRangeSuccessful() {
    let substring = string[...10]
    XCTAssertEqual(substring, "This is a d")
  }

  func testSafeFetchingSubscriptWithPartialThroughRangeSuccessful() {
    let substring = string[safe: ...10]
    XCTAssertEqual(substring, "This is a d")
  }

  func testFetchingSubscriptWithPartialThrougRangeOutOfUpperBounds() {
    let substring = string[safe: ...100]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithPartialUpToRangeSuccessful() {
    let substring = string[..<10]
    XCTAssertEqual(substring, "This is a ")
  }

  func testSafeFetchingSubscriptWithPartialUpToRangeSuccessful() {
    let substring = string[safe: ..<10]
    XCTAssertEqual(substring, "This is a ")
  }

  func testFetchingSubscriptWithPartialUpToRangeOutOfUpperBounds() {
    let substring = string[safe: ..<100]
    XCTAssertNil(substring)
  }

  func testFetchingSubscriptWithPartialFromRangeSuccessful() {
    let substring = string[10...]
    XCTAssertEqual(substring, "dummy string")
  }
}
