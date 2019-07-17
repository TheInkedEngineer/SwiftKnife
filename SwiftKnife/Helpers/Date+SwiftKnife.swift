//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import Foundation

public extension Date {

  // MARK:- Variables

  /// Checks if the date corresponds to today, regardless of the time.
  var isToday: Bool {
    return Calendar.current.isDate(self, inSameDayAs: Date())
  }

  /// Checks if the date is from the past.
  var isDayFromPast: Bool {
    let today = Calendar.current.startOfDay(for: Date())
    return self.timeIntervalSince(today) < 0
  }

  /// Checks if the date is from the future.
  var isDayFromFuture: Bool {
    return !self.isToday && !self.isDayFromPast
  }

  /// Returns the date as a day number (ie: 28).
  var dayNumber: Int {
    guard let dayNumber = Calendar.current.dateComponents([.day], from: self).day else {
      SKFatalError("error extracting day number from date: \(self)")
    }
    return dayNumber
  }

  // MARK:- Functions

  /// Returns the short (3 letters) or full version name of the month from a given date.
  static func monthName(
    date: Date,
    returnShortVersion: Bool,
    locale: Locale = Locale(identifier: "en_US_POSIX")
    ) -> String {
    
    let formatter = DateFormatter()
    formatter.dateFormat = returnShortVersion ? "MMM" : "MMMM"
    formatter.locale = locale
    return formatter.string(from: date)
  }
}
