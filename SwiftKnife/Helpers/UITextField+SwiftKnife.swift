//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

extension UITextField {
  /// The `selectedTextRange` as `NSRange`.
  var selectedNSRange: NSRange? {
    guard let range = selectedTextRange else { return nil }
    let location = offset(from: beginningOfDocument, to: range.start)
    let length = offset(from: range.start, to: range.end)
    return NSRange(location: location, length: length)
  }
  
  /// Position the cursor at the desired position (offset) compared to the start of the document.
  ///
  /// - Parameter offset: The desired offset.
  func setCursorFromStart(at offset: Int) {
    guard let position = self.position(from: beginningOfDocument, offset: offset) else { return }
    self.selectedTextRange = self.textRange(from: position, to: position)
  }
}
