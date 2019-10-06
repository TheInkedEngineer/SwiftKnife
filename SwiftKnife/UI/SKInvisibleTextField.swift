//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
// 

import UIKit

/// A `UITextField` subclass that is invisible.
/// This can be used where invisible text needs to be inserted in order to invoke other actions.
public class SKInvisibleTextField: UITextField {

  // MARK: - init

  /// `init` via code.
  public override init(frame: CGRect) {
    super.init(frame: frame)

    self.style()
  }

  /// `init` via IB.
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    self.style()
  }

  // MARK: - S
  
  private func style() {
    self.backgroundColor = .clear
    self.textColor = .clear
    self.tintColor = .clear
  }

  /// MARK: - Public Methods

  override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    guard
      action != #selector(copy(_:)),
      action != #selector(cut(_:)),
      action != #selector(selectAll(_:)),
      action != #selector(select(_:)),
      action != #selector(paste(_:))
    else {
      return false
    }

    return super.canPerformAction(action, withSender: sender)
  }
  
  override public func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
    []
  }

  /// Delete a character from the displayed text.
  /// Invokes the delegate even when textField is empty and the delete button is pressed.
  override public func deleteBackward() {
    super.deleteBackward()

    // a workaround to invoke the delegate
    // textField(_: UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool
    // when the textfield is empty.
    // By default when the textfield is empty this method is not invoked.
    // since we know the textfield is empty, and it is a delete action then the range is of location 0 and length 0.
    if self.text == nil || self.text!.isEmpty {
      _ = self.delegate?.textField?(
        self,
        shouldChangeCharactersIn: NSRange(location: 0, length: 0),
        replacementString: ""
      )
    }
  }
}
