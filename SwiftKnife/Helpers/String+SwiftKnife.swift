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

  /// The string contains at least one lowecase character.
  var containsLowercase: Bool {
    return !isDigits && !isUppercased
  }

  /// Checks if a string is made of only uppercase charaters.
  var isUppercased: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { String($0).isDigits == true || String($0) != $0.uppercased() }
  }

  /// The string contains at least one uppercase character.
  var containsUppercase: Bool {
    return !isDigits && !isLowercased
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

    if !includeLowercaseLetters && !includeCapitalLetters && !includeDigits && additionalCharacters.isEmpty { return "" }

    var allowedCharacters = ""

    if includeLowercaseLetters { allowedCharacters += "abcdefghijklmnopqrstuvwxyz" }

    if includeCapitalLetters { allowedCharacters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }

    if includeDigits { allowedCharacters += "0123456789" }

    if !additionalCharacters.isEmpty { allowedCharacters += additionalCharacters }

    let allowedCharsCount = UInt32(allowedCharacters.count)
    var randomString = ""

    (0..<length).forEach { _ in
      let index = Int(arc4random_uniform(allowedCharsCount))
      let newCharacter: String = allowedCharacters[index]
      randomString += String(newCharacter)
    }

    return randomString
  }
}
