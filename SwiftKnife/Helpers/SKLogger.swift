//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

/// A cosole logger.
public enum SKLogger {
  /// Logs to the console a properly formatted debug message.
  ///
  /// - Parameters:
  ///   - title: The title of the log.
  ///   - message: The content of the log.
  ///   - file: The file where the log was from.
  ///   - line: The line where the log was from.
  public static func log(
    title: String,
    message: Any?,
    file: StaticString = #file,
    line: UInt = #line) {
    #if DEBUG
      print(
        """


        ===============
        File: \(file)

        Line: \(line)

        \(title)
        ===============

        \(message ?? "nil")


        """)
    #endif
  }
}
