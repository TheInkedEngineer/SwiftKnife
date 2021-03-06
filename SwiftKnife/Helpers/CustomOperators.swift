//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit

// MARK: - Percentage Operator

postfix operator %

/// Returns the value devided by 100.
/// - Parameter lhs: The value to divide.
public postfix func %(lhs: Double) -> Double { lhs / 100 }

/// Returns the value devided by 100.
/// - Parameter lhs: The value to divide.
public postfix func %(lhs: CGFloat) -> CGFloat { lhs / 100 }
