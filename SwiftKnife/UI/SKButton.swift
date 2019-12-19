//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit

/// `SKButton` is a subclass of `UIButton` that enables setting different background color for different states.
open class SKButton: UIButton {

  // MARK: - Properties
  
    /// A dictionary containing all available Opacity for various states.
  private var opacity: [UIControl.State: CGFloat] = [
    UIControl.State.normal: 1.0,
    UIControl.State.selected: 1.0,
    UIControl.State.highlighted: 0.7,
    UIControl.State.disabled: 0.5
  ]
  
  /// A dictionary containing all available colors for various states.
  private var color: [UIControl.State: UIColor] = [
    UIControl.State.normal: UIColor.clear
  ]

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
    self.style()
  }

  /// `init` via IB.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.style()
  }

  // MARK: - SU

  /// Sets up the default style of the button at startup.
  private func style() {
    self.backgroundColor = self.color[.normal]
  }

  /// Called when relative button criteria changes so it reflects such changes.
  private func update() {
    self.updateBackgrounColor()
    self.updateOpacity()
  }

  /// Updates the background color.
  private func updateBackgrounColor() {
    self.backgroundColor = self.color[self.state] ?? self.color[.normal]
  }
  
  /// Updates the alpha of the element.
  private func updateOpacity() {
    self.alpha = self.opacity[self.state] ?? self.opacity[.normal]!
  }

  // MARK: - Public Methods

  /// Sets the background color for a given state.
  ///
  /// - Parameters:
  ///   - color: The color to assign.
  ///   - state: The state to which the color should be assigned.
  public func setColor(_ color: UIColor, for state: UIControl.State) {
    self.color[state] = color
    self.update()
  }

  /// Returns the assigned color to a given state, if any.
  ///
  /// - Parameter state: The state of which the color should be retrieved.
  /// - Returns: The color assigned to the state if found, otherwise nil.
  public func getColor(for state: UIControl.State) -> UIColor? {
    self.color[state]
  }

  /// The color of a given state. This does not reflect the color assigned to that state,
  /// but rather the color that will show up, since if no color is assigned it fallsback to `.normal` state.
  ///
  /// - Parameter state: The state of which the color should be retrieved.
  /// - Returns: The color that will appear given that state.
  public func color(for state: UIControl.State) -> UIColor {
    self.color[state] ?? self.color[.normal]! // safe to force unwrap because `.normal` is assigned by default.
  }
  
  // MARK: - Public Methods

  /// Sets the title opacity of a given state.
  ///
  /// - Parameters:
  ///   - opacity: The desired opacity.
  ///   - state: The button state to modify.
  public func setOpacity(_ opacity: CGFloat, for state: UIControl.State) {
    self.opacity[state] = opacity
    self.update()
  }

  /// Checks the title opacity of a given state.
  ///
  /// - Parameter state: The button state.
  /// - Returns: The opacity of that state if assigned, otherwise nil.
  public func getOpacity(for state: UIControl.State) -> CGFloat? {
    self.opacity[state]
  }

  /// The title opacity of a given state. This does not reflect the opacity assigned to that state,
  /// but rather the opacity that will show up, since if no opacity is assigned it fallsback to `.normal` state.
  ///
  /// - Parameter state: The state of the button.
  /// - Returns: The opacity that will appear given that state.
  public func opacity(for state: UIControl.State) -> CGFloat {
    self.opacity[state] ?? self.opacity[.normal]! // safe to force unwrap because `.normal` is assigned by default.
  }
}
