//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation

public extension Encodable {
  /// Transforms an Encodable object into a [String: Any] dictionary.
  ///
  /// - Parameter encoder: The encoder to use in the transformation.
  /// - Returns: A dictionary containing the key and value of the encodable item.
  func dictionary(with encoder: JSONEncoder) -> [String: Any]? {
    let encodedData = try? encoder.encode(self)
    guard let data = encodedData else { return nil }
    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    return jsonObject.flatMap { $0 }
  }
}
