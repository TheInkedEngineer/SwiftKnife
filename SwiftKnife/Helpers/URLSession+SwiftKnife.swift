//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import Foundation

extension URLSession {

  /// Swift 5 wrapper for DataTask to support Result Type. It expects the `URLResponse` and `Data` to be not `nil`.
  ///
  /// - Parameters:
  ///   - url: The url to be retrived.
  ///   - result: a `Completion<(URLResponse, Data), Error>` that is invoked when the load request finishes.
  /// - Returns: a `URLSessionDataTask`
  func dataTask(with url: URL, result: @escaping Completion<(URLResponse, Data), Error>) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
      if let error = error {
        result(.failure(error))
        return
      }

      guard let response = response else {
        let error = NSError(domain: "Network", code: -1, userInfo: ["message": "The server returned no response"])
        result(.failure(error))
        return
      }

      guard let data = data else {
        let error = NSError(domain: "Network", code: -2, userInfo: ["message": "The server did not return any data"])
        result(.failure(error))
        return
      }

      result(.success((response, data)))
    }
  }

  /// Swift 5 wrapper for DataTask to support Result Type. It may have the `URLResponse` and `Data` equal to `nil`.
  ///
  /// - Parameters:
  ///   - url: The url to be retrived.
  ///   - result: a `Completion<(URLResponse?, Data?), Error>` that is invoked when the load request finishes.
  /// - Returns: a `URLSessionDataTask`
  func dataTask(with url: URL, result: @escaping Completion<(URLResponse?, Data?), Error>) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
      if let error = error {
        result(.failure(error))
        return
      }

      result(.success((response, data)))
    }
  }
}
