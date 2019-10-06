//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import Foundation
import UIKit

/// `SKTextButton` is a subclass of `UIButton` that has no background and only a centered text.
open class SKTextButton: UIButton {
  
  // MARK: - Properties

  /// A dictionary containing different opacities for various states.
  private var opacities: [UIControl.State: CGFloat] = [
    UIControl.State.normal: 1.0,
    UIControl.State.selected: 1.0,
    UIControl.State.highlighted: 0.7,
    UIControl.State.disabled: 0.5
  ]

  /// The attributed title of the button.
  public var attributedTitle: NSAttributedString? = nil {
    didSet { self.update() }
  }

  /// Overriding the original method to update the button background when the button is highlighted.
  open override var isHighlighted: Bool {
    didSet { self.update() }
  }

  /// Overriding the original method to update the button background when the button is enabled.
  open override var isEnabled: Bool {
    didSet { self.update() }
  }

  /// Overriding the original method to update the button background when the button is selected.
  open override var isSelected: Bool {
    didSet { self.update() }
  }

  // MARK: - init

  /// `init` via code.
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  /// `init` via IB.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  // MARK: - SU

  private func setup() {
    self.backgroundColor = .clear
  }

  private func update() {
    self.setAttributedTitle(self.attributedTitle, for: .normal)
    self.titleLabel?.alpha = self.opacities[self.state] ?? 1.0
  }

  // MARK: - Public Methods

  /// Sets the title opacity of a given state.
  ///
  /// - Parameters:
  ///   - opacity: The desired opacity.
  ///   - state: The button state to modify.
  public func setOpacity(_ opacity: CGFloat, for state: UIControl.State) {
    self.opacities[state] = opacity
    self.update()
  }

  /// Checks the title opacity of a given state.
  ///
  /// - Parameter state: The button state.
  /// - Returns: The opacity of that state if assigned, otherwise nil.
  public func getOpacity(for state: UIControl.State) -> CGFloat? {
    self.opacities[state]
  }

  /// The title opacity of a given state. This does not reflect the opacity assigned to that state,
  /// but rather the opacity that will show up, since if no opacity is assigned it fallsback to `.normal` state.
  ///
  /// - Parameter state: The state of the button.
  /// - Returns: The opacity that will appear given that state.
  public func opacity(for state: UIControl.State) -> CGFloat {
    self.opacities[state] ?? self.opacities[.normal]! // safe to force unwrap because `.normal` is assigned by default.
  }
}
