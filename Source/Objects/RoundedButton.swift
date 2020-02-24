

import UIKit

@IBDesignable class RoundedButton: UIButton {
	@IBInspectable var cornerRadius: CGFloat = 5.0 {
		didSet {
			layer.cornerRadius = cornerRadius
		}
	}
	
	@IBInspectable var borderColor: UIColor = UIColor.white {
		didSet {
			layer.borderColor = borderColor.cgColor
		}
	}
	
	@IBInspectable var borderWidth: CGFloat = 2.0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	
	@IBInspectable var selectedColor: UIColor = UIColor.blue
	
	override var isSelected: Bool {
		didSet {
			layer.borderColor = isSelected ? selectedColor.cgColor : borderColor.cgColor
		}
	}
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		clipsToBounds = true
	}
}
