//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

public extension NSLayoutConstraint {
  
  /// Sets the `NSLayoutConstraint` `isActive` property to `true`.
  func activate() {
    self.isActive = true
  }
  
  /// Sets the `NSLayoutConstraint` `isActive` property to `false`.
  func deactivate() {
    self.isActive = false
  }
}
