//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

public extension Bool {
  /// Returns the opposite value of `self`.
  var inverted: Bool {
    var b = self
    b.toggle()
    return b
  }

  /// Transforms `self` into a `CGFloat` value.
  var cgFloat: CGFloat {
    self ? 1.0 : 0.0
  }
}
