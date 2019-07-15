//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import UIKit

public extension UIColor {
  ///  Initializes and returns a random color object using the specified opacity and RGB component values.
  static var random: UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }

  /// Initializes and returns a random color object using the specified opacity and RGB component values in the Display P3 color space.
  static var p3Random: UIColor {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
  }
}
