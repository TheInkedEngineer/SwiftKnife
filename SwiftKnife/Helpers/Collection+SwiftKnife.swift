//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

public extension Collection {
  /// Safely retrieves an element in the collection. Otherwise returns nil.
  ///
  /// - Parameter offset: The offset of the element compared to the `startIndex`.
  subscript (safe offset: Int) -> Iterator.Element? {
    guard offset >= 0, offset < distance(from: self.startIndex, to: self.endIndex) else {
      return nil
    }
    let index = self.index(self.startIndex, offsetBy: offset)
    return self[index]
  }

  /// The opposite of `isEmpty`.
  var isNotEmpty: Bool {
    return !isEmpty
  }
}
