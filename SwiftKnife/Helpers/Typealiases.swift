//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import Foundation

/// Typically used as a user interaction where it takes no parameters.
typealias Interaction = () -> ()

/// Sugar syntax for when using result in a completion handler.
typealias Completion<T, V: Error> = ((Result<T, V>) -> Void)
