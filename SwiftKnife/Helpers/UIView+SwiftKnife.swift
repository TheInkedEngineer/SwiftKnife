//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import UIKit

public extension UIView {
  /// The opposite of `isHidden`.
  var isVisible: Bool {
    get { return !self.isHidden }
    set { self.isHidden = !newValue }
  }
}

// MARK: - Gradients

extension UIView {
  
  /// A horizonatal gradiente starting from left to right in the middle of the screen vertically equally distributed.
  var backgroundHorizontalGradientColor: [CGColor]? {
    get {
      return self.backgroundGradientColor
    }
    
    set {
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = bounds
      gradientLayer.colors = newValue
      gradientLayer.locations = [0.0, 1.0]
      gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
      layer.insertSublayer(gradientLayer, at: 0)
    }
  }
  
  /// A horizonatal gradiente starting from top to bottom in the middle of the screen horizontally equally distributed.
  var backgroundVerticalGradientColor: [CGColor]? {
    get {
      return self.backgroundGradientColor
    }
    
    set {
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = bounds
      gradientLayer.colors = newValue
      gradientLayer.locations = [0.0, 1.0]
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
      gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
      layer.insertSublayer(gradientLayer, at: 0)
    }
  }
  
  /// Returns the used gradient color.
  var backgroundGradientColor: [CGColor]? {
    get {
      return ((layer.sublayers?[0] as? CAGradientLayer)?.colors as? [CGColor])
    }
  }
}

// MARK: - Autolayout

public extension UIView {
  
  /// Sets `translatesAutoresizingMaskIntoConstraints` to false.
  func activateAutoLayout() {
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
