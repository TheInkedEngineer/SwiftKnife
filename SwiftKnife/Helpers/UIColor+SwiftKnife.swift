//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import UIKit

public extension UIColor {
  ///  Initializes and returns a random color object using the specified opacity and RGB component values.
  static var random: UIColor {
    let red =   CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue =  CGFloat.random(in: 0...1)
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }

  /// Initializes and returns a random color object using the specified opacity and
  /// RGB component values in the Display P3 color space.
  static var p3Random: UIColor {
    let red =   CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue =  CGFloat.random(in: 0...1)
    return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
  }
}

// MARK: - Hex to RGBA extension

public extension UIColor {
  
  /// Possible errors for UIColor Hexadecimal extension
  enum HexCodeError: Error {
    /// The content of the hex string is invalid.
    case invalidContent
    /// The length of the hex code is invalid. The code can be 3,4,6 or 8 digits long excluding the optional '#'.
    case invalidLength
  }

  /// Initializes a new `UIColor` from its `Hexadecimal` representation.
  /// - Parameter code: The `Hexadecimal` representation from which to extract the code.
  /// - Throws: `HexCodeError`.
  convenience init(hex code: String) throws {
    var decimalValue = UInt64()
    let hexString = code.first == "#" ?
      String(code[PartialRangeFrom(code.index(after: code.startIndex))]) : code

    guard Scanner(string: hexString).scanHexInt64(&decimalValue) else {
      throw HexCodeError.invalidContent
    }

    switch hexString.count {
    case 3:
      self.init(hex3: decimalValue)
      
    case 4:
      self.init(hex4: decimalValue)
      
    case 6:
      self.init(hex6: decimalValue)

    case 8:
      self.init(hex8: decimalValue)

    default:
      throw HexCodeError.invalidLength
    }
  }
  
  private convenience init(hex3 decimalValue: UInt64) {
    self.init(
      displayP3Red: CGFloat((decimalValue & 0xF00) >> 8) / 15,
      green:        CGFloat((decimalValue & 0x0F0) >> 4) / 15,
      blue:         CGFloat((decimalValue & 0x00F)     ) / 15,
      alpha: 1
    )
  }
  
  private convenience init(hex4 decimalValue: UInt64) {
    self.init(
      displayP3Red: CGFloat((decimalValue & 0xF000) >> 12) / 15,
      green:        CGFloat((decimalValue & 0x0F00) >> 8 ) / 15,
      blue:         CGFloat((decimalValue & 0x00F0) >> 4 ) / 15,
      alpha:        CGFloat((decimalValue & 0x000F)      ) / 15
    )
  }
  
  private convenience init(hex6 decimalValue: UInt64) {
    self.init(
      displayP3Red: CGFloat((decimalValue & 0xFF0000) >> 16) / 255,
      green:        CGFloat((decimalValue & 0x00FF00) >> 8 ) / 255,
      blue:         CGFloat((decimalValue & 0x0000FF)      ) / 255,
      alpha: 1
    )
  }
  
  private convenience init(hex8 decimalValue: UInt64) {
    self.init(
      displayP3Red: CGFloat((decimalValue & 0xFF000000) >> 24) / 255,
      green:        CGFloat((decimalValue & 0x00FF0000) >> 16) / 255,
      blue:         CGFloat((decimalValue & 0x0000FF00) >> 8 ) / 255,
      alpha:        CGFloat((decimalValue & 0x000000FF)      ) / 255
    )
  }
}

public extension UIColor {
  
  /// Initializes a UIColor from an array of CGFloat components if possible, otherwise returns nil.
  /// - Parameter components: The components making up the UIColor. Either [red, green, blue] or [red, green, blue, alpha].
  convenience init?(components: [CGFloat]?) {
    guard
      let components = components,
      (components.count == 3 || components.count == 4),
      let red = components[safe: 0],
      let green = components[safe: 1],
      let blue = components[safe: 2]
    
      else {
        return nil
    }
    
    self.init(
      displayP3Red: red,
      green: green,
      blue: blue,
      alpha: components[safe: 3] ?? 1
    )
  }
}
