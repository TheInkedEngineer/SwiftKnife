//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit

/// An image based checkbox.
open class SKCheckbox: UIControl {

  // MARK: - Properties

  /// The currently displayed checkbox Image.
  private var checkboxImage = UIImageView()

  /// The image of the checkbox when checked and enabled.
  public var isEnabledAndCheckedImage: UIImage? {
    didSet { self.update() }
  }

  /// The image of the checkbox when unchecked and enabled.
  public var isEnabledAndNotCheckedImage: UIImage? {
    didSet { self.update() }
  }

  /// The image of the checkbox when checked and disabled.
  public var isDisabledAndCheckedImage: UIImage? {
    didSet { self.update() }
  }

  /// The image of the checkbox when unchecked and disabled.
  public var isDisabledAndNotCheckedImage: UIImage? {
    didSet { self.update() }
  }

  /// Overriding the original method to update the icon based on state.
  open override var isEnabled: Bool {
    didSet { self.update() }
  }

  /// Whether or not the checkbox is checked.
  public var isChecked: Bool = false {
    didSet { self.update() }
  }

  /// The image to display based on `isChecked` and `isEnabled` status.
  private var imageToDisplay: UIImage? {
    switch (self.isChecked, self.isEnabled) {
    case (true, true):
      return self.isEnabledAndCheckedImage
    case (true, false):
      return self.isDisabledAndCheckedImage
    case (false, true):
      return self.isEnabledAndNotCheckedImage
    case (false, false):
      return self.isDisabledAndNotCheckedImage
    }
  }

  // MARK: Interaction

  /// An closure that allows the user to add a condition to whether or not the checkbox value should change.
  /// If it returns true, the tracking continues, the checkbox switches state.
  /// If it returns false, the value of the checkbox does not change.
  public var valueShouldChange: ((_ checkbox: SKCheckbox, _ newValue: Bool) -> (Bool))?

  /// An interaction that is called right before the checkbox switches state.
  /// Use it to execute any pre change operations.
  public var valueWillChange: ((_ checkbox: SKCheckbox, _ oldValue: Bool) -> Void)?

  /// An interaction that is called right after the checkbox switches state.
  /// Use it to execute any post change operations.
  public var valueDidChange: ((_ checkbox: SKCheckbox, _ oldValue: Bool) -> Void)?

  // MARK: - init

  /// `init` via code.
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
    self.update()
  }

  /// `init` via IB.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
    self.update()
  }

  // MARK: SUL

  private func setup() {
    self.addSubview(self.checkboxImage)
  }

  private func update() {
    self.checkboxImage.image = self.imageToDisplay
  }

  /// Layout the image inside the button.
  open override func layoutSubviews() {
    self.checkboxImage.frame = self.bounds
  }

  /// A responder to when a touch interaction starts.
  open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // check if the change should take place.
    // if the closure is not assigned, proceed.
    let valueShouldChange = self.valueShouldChange?(self, !self.isChecked) ?? true

    guard valueShouldChange else { return }

    // do any final opertaions before changing.
    self.valueWillChange?(self, self.isChecked)

    // update value.
    self.isChecked = !self.isChecked

    // do additional operations after state change.
    self.valueDidChange?(self, self.isChecked)

  }
}

