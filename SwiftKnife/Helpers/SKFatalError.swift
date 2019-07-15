//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import Foundation

/// Throws a properly formatted error.
///
/// - Parameters:
///   - message: The message of the fatal error.
///   - file: The file that threw the fatal error.
///   - line: The line where the fatal error was thrown.
/// - Returns: Never as the return type since the function unconditionally throws an error.
public func SKFatalError(
  _ message: String,
  file: StaticString = #file,
  line: UInt = #line) -> Never {

  let report = "\(message). File: \(file). Line: \(line)"
  fatalError(report)
}
