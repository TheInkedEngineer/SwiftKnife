//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import Foundation

/// Execute a closure on the main thread.
///
/// - Parameter closure: The closure to execute.
public func mainThread(_ closure: () -> ()) {
  if !Thread.isMainThread {
    DispatchQueue.main.sync {
      closure()
    }
  } else {
    closure()
  }
}
