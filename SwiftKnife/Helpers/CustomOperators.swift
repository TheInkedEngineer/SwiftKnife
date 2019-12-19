//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

// MARK: - Percentage Operator

postfix operator %

/// Returns the value devided by 100.
/// - Parameter lhs: The value to divide.
postfix func %(lhs: Double) -> Double { lhs / 100 }

/// Returns the value devided by 100.
/// - Parameter lhs: The value to divide.
postfix func %(lhs: CGFloat) -> CGFloat { lhs / 100 }
