//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

public extension String {
  /// Checks if the string starts with a capital letter.
  var isCapitalized: Bool {
    guard !self.isEmpty else { return false }
    let firstLetter = String(self.first!)
    return firstLetter == firstLetter.capitalized
  }

  /// Checks if a string is made of only digits.
  var isDigits: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { Int(String($0)) == nil }
  }

  /// Checks if a string is made of only lowercase charaters.
  var isLowercased: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { String($0).isDigits == true || String($0) != $0.lowercased() }
  }

  /// Checks if a string is made of only uppercase charaters.
  var isUppercased: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { String($0).isDigits == true || String($0) != $0.uppercased() }
  }

  /// Returns a `String` of random numbers.
  ///
  /// - Parameter length: The desired length of the string.
  /// - Returns: A string long as the desired length made of random digits.
  static func randomDigits(length: Int) -> String {
    return String.random(length: length, includeLowercaseLetters: false, includeCapitalLetters: false, includeDigits: true)
  }

  /// Returns a string
  ///
  /// - Parameters:
  ///   - length: The desired length of the string.
  ///   - includeLowercaseLetters: If true, includes "abcdefghijklmnopqrstuvwxyz" in allowed characters.
  ///   - includeCapitalLetters: If true, includes "ABCDEFGHIJKLMNOPQRSTUVWXYZ" in allowed characters.
  ///   - includeDigits: If true, includes "0123456789" in allowed characters.
  ///   - additionalCharacters: A list of aditional characters to include.
  /// - Returns: A `String` as long as the desired length, made of the allowed characters.
  ///            If no character type is allowed, and no additionalCharacters are passed, returns an empty string.
  static func random(
    length: Int,
    includeLowercaseLetters: Bool = true,
    includeCapitalLetters: Bool = true,
    includeDigits: Bool = true,
    additionalCharacters: String = ""
    ) -> String {

    if !includeLowercaseLetters && !includeCapitalLetters && !includeDigits && additionalCharacters.isEmpty {
      return ""
    }

    var allowedCharacters = ""

    if includeLowercaseLetters {
      allowedCharacters += "abcdefghijklmnopqrstuvwxyz"
    }

    if includeCapitalLetters {
      allowedCharacters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }

    if includeDigits {
      allowedCharacters += "0123456789"
    }

    if !additionalCharacters.isEmpty {
      allowedCharacters += additionalCharacters
    }

    let allowedCharsCount = UInt32(allowedCharacters.count)
    var randomString = ""

    for _ in 0..<length {
      let index = Int(arc4random_uniform(allowedCharsCount))
      let newCharacter: String = allowedCharacters[index]
      randomString += String(newCharacter)
    }

    return randomString
  }

  /**
   Returns the character at a given index, casted as a string.
   If distance is positive, this is the same value as the result of distance calls to index(after:).
   If distance is negative, this is the same value as the result of abs(distance) calls to index(before:).
   Use `safe` to return an optional but avoid a fatal crash.
   */
  subscript(idx: Int) -> String {
    if idx >= 0 { return String(self[index(startIndex, offsetBy: idx)]) }
    else { return String(self[index(endIndex, offsetBy: idx)]) }
  }

  subscript(safe idx: Int) -> String? {
    guard self.count > abs(idx) else { return nil }

    if idx >= 0 { return String(self[index(startIndex, offsetBy: idx)]) }
    else { return String(self[index(endIndex, offsetBy: idx)]) }
  }

  /// Returns the character at a given index.
  /// If distance is positive, this is the same value as the result of distance calls to index(after:).
  /// If distance is negative, this is the same value as the result of abs(distance) calls to index(before:).
  ///
  /// - Parameter idx: The index where to subscript.
  subscript(idx: Int) -> Character {
    if idx >= 0 { return self[index(startIndex, offsetBy: idx)] }
    else { return self[index(endIndex, offsetBy: idx)] }
  }

  /// Returns the character at a given index if found, otherwise nil.
  /// If distance is positive, this is the same value as the result of distance calls to index(after:).
  /// If distance is negative, this is the same value as the result of abs(distance) calls to index(before:).
  ///
  /// - Parameter idx: The index where to subscript.
  subscript(safe idx: Int) -> Character? {
    guard self.count > abs(idx) else { return nil }

    if idx >= 0 { return self[index(startIndex, offsetBy: idx)] }
    else { return self[index(endIndex, offsetBy: idx)] }
  }

  /// Returns a substring from the lower bound of the range up to but not including the upper bound.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(range: Range<Int>) -> String {
    let start = String.Index(utf16Offset: range.lowerBound, in: self)
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[start..<end])
  }

  /// Returns a substring from the lower bound of the range up to but not including the upper bound.
  /// If the range is out of bounds, returns nil.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(safe range: Range<Int>) -> String? {
    guard range.lowerBound >= 0, range.upperBound <= self.count else { return nil }

    let start = String.Index(utf16Offset: range.lowerBound, in: self)
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[start..<end])
  }

  /// Returns a substring from the lower bound of the range up to the upper bound.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(range: ClosedRange<Int>) -> String {
    let start = String.Index(utf16Offset: range.lowerBound, in: self)
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[start...end])
  }

  /// Returns a substring from the lower bound of the range up to the upper bound.
  /// If the range is out of bounds, returns nil.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(safe range: ClosedRange<Int>) -> String? {
    guard range.lowerBound >= 0, range.upperBound < self.count else { return nil }

    let start = String.Index(utf16Offset: range.lowerBound, in: self)
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[start...end])
  }

  /// Returns a substring from a given lower bound to the end of the string.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(range: PartialRangeFrom<Int>) -> String {
    let start = String.Index(utf16Offset: range.lowerBound, in: self)

    return String(self[start...])
  }

  /// Returns a substring from the start up to a given upper bound.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(range: PartialRangeThrough<Int>) -> String {
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[...end])
  }

  /// Returns a substring from the start up to a given upper bound.
  /// If the range is out of bounds, returns nil.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(safe range: PartialRangeThrough<Int>) -> String? {
    guard range.upperBound < self.count else { return nil }

    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[...end])
  }

  /// Returns a substring from the start up to a given but not included upper bound.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(range: PartialRangeUpTo<Int>) -> String {
    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[..<end])
  }

  /// Returns a substring from the start up to a given but not included upper bound.
  /// If the range is out of bounds, returns nil.
  ///
  /// - Parameter range: The range of the characters to subscript.
  subscript(safe range: PartialRangeUpTo<Int>) -> String? {
    guard range.upperBound <= self.count else { return nil }

    let end = String.Index(utf16Offset: range.upperBound, in: self)

    return String(self[..<end])
  }
}
