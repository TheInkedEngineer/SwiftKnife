//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

extension String {
  /// Returns the character at a given index, casted as a string.
  /// If distance is positive, this is the same value as the result of distance calls to index(after:).
  /// If distance is negative, this is the same value as the result of abs(distance) calls to index(before:).
  ///
  /// - Parameter idx: The index where to subscript.
  subscript(idx: Int) -> String {
    if idx >= 0 { return String(self[index(startIndex, offsetBy: idx)]) }
    else { return String(self[index(endIndex, offsetBy: idx)]) }
  }


  /// Returns the character at a given index, casted as a string if found, otherwise nil.
  /// If distance is positive, this is the same value as the result of distance calls to index(after:).
  /// If distance is negative, this is the same value as the result of abs(distance) calls to index(before:).
  ///
  /// - Parameter idx: The index where to subscript.
  subscript(safe idx: Int) -> String? {
    guard self.count > abs(idx) else { return nil }
    return self[idx]
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
    guard let found: String = self[safe: idx] else {
      return nil
    }
    return Character(found)
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
