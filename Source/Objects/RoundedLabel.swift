
import UIKit

@IBDesignable class RoundedLabel: UILabel {
	@IBInspectable var textInset: CGFloat = 5.0 {
		didSet {
			textInsets = UIEdgeInsets(top: 0, left: textInset, bottom: 0, right: textInset)
			setNeedsDisplay()
		}
	}
	
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
	
	private var textInsets = UIEdgeInsets.zero {
		didSet { invalidateIntrinsicContentSize() }
	}

	override public func layoutSubviews() {
		super.layoutSubviews()
		clipsToBounds = true
	}
	
	override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
		return UIEdgeInsetsInsetRect(textRect, invertedInsets)
	}
	
	override func drawText(in rect: CGRect) {
		super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
	}
}
