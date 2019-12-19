//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation


public extension UIView {
  
  /// Sets `translatesAutoresizingMaskIntoConstraints` to false.
  func activateAutoLayout() {
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  /// Centers view Horizontally relative to a superview.
  /// - Parameter view: The view to use as a reference when centering.
  func centerH(relativeTo view: UIView) {
    self.activateAutoLayout()
    self.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
  }

  /// Centers view Vertically relative to a superview.
  /// - Parameter view: The view to use as a reference when centering.
  func centerV(relativeTo view: UIView) {
    self.activateAutoLayout()
    self.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
  }
  
  /// Centers view relative to a superview.
  /// - Parameter view: The view to use as a reference when centering.
  func center(relativeTo view: UIView) {
    self.activateAutoLayout()
    self.centerH(relativeTo: view)
    self.centerV(relativeTo: view)
  }
}
