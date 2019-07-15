//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import UIKit

public extension UIView {
  /// The opposite of `isHidden`.
  var isVisible: Bool {
    get { return !self.isHidden }
    set { self.isHidden = !newValue }
  }
}
