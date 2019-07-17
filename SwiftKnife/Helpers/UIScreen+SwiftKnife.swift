//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit

public extension UIScreen {
  
  // MARK: - Variables

  /// The width of the screen relative to the orientation.
  static var relativeWidth: CGFloat {
    return UIScreen.screenSize().width
  }

  /// The height of the screen relative to the orientation.
  static var relativeHeight: CGFloat {
    return UIScreen.screenSize().height
  }

  /// The width of the device in portrait mode.
  static var portraitWidth: CGFloat {
    return min(relativeWidth, relativeHeight)
  }

  /// The height of the device in portrait mode.
  static var portraitHeight: CGFloat {
    return max(relativeWidth, relativeHeight)
  }

  /// The width of the device in landscape mode.
  static var landscapeWidth: CGFloat {
    return max(relativeWidth, relativeHeight)
  }

  /// The height of the device in landscape mode.
  static var landscapeHeight: CGFloat {
    return min(relativeWidth, relativeHeight)
  }

  // MARK: - Functions

  /// The size of the device.
  /// Note: Orientation is taken into account.
  ///
  /// - Returns: The CGSize of the screen.
  static func screenSize() -> CGSize {
    return UIScreen.main.bounds.size
  }
}
