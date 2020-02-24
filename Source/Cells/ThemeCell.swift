
import UIKit

class ThemeCell: UICollectionViewCell {
	@IBOutlet private weak var lblName: UILabel!
	@IBOutlet private weak var vwBG: UIView!
	@IBOutlet private weak var lblDisplay: UILabel!
	@IBOutlet private weak var lblHistory: UILabel!
	@IBOutlet private weak var btnDog: UIButton!
	@IBOutlet private weak var btnCat: UIButton!
	@IBOutlet private weak var btnChicken: UIButton!
	@IBOutlet private weak var btnHuman: UIButton!
	@IBOutlet private weak var lblDot: UILabel!
	@IBOutlet private weak var lbl0: UILabel!
	@IBOutlet private weak var lbl1: UILabel!
	@IBOutlet private weak var lbl2: UILabel!
	@IBOutlet private weak var lbl3: UILabel!
	@IBOutlet private weak var lbl4: UILabel!
	@IBOutlet private weak var lbl5: UILabel!
	@IBOutlet private weak var lbl6: UILabel!
	@IBOutlet private weak var lbl7: UILabel!
	@IBOutlet private weak var lbl8: UILabel!
	@IBOutlet private weak var lbl9: UILabel!
	@IBOutlet private weak var lblAdd: UILabel!
	@IBOutlet private weak var lblSub: UILabel!
	@IBOutlet private weak var lblMult: UILabel!
	@IBOutlet private weak var lblDiv: UILabel!
	@IBOutlet private weak var lblEqual: UILabel!
	@IBOutlet private weak var lblClear: UILabel!
	@IBOutlet private weak var lblDelete: UILabel!
	@IBOutlet private weak var imgSelected: UIImageView!

	override var isSelected: Bool {
		didSet {
			imgSelected.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
		}
	}

	// MARK:- Public Methods
	func configure(theme: Theme) {
		// Name
		lblName.text = theme.name
		// Background
		vwBG.backgroundColor = UIColor.from(hex: theme.bg)
		// Results
		lblDisplay.backgroundColor = UIColor.from(hex: theme.result)
		lblDisplay.textColor = UIColor.from(hex: theme.buttonText)
		// History
		lblHistory.textColor = UIColor.from(hex: theme.historyText)
		// Numbers
		lblDot.backgroundColor = UIColor.from(hex: theme.numbers)
		lblDot.textColor = UIColor.from(hex: theme.buttonText)
		lbl0.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl0.textColor = UIColor.from(hex: theme.buttonText)
		lbl1.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl1.textColor = UIColor.from(hex: theme.buttonText)
		lbl2.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl2.textColor = UIColor.from(hex: theme.buttonText)
		lbl3.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl3.textColor = UIColor.from(hex: theme.buttonText)
		lbl4.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl4.textColor = UIColor.from(hex: theme.buttonText)
		lbl5.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl5.textColor = UIColor.from(hex: theme.buttonText)
		lbl6.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl6.textColor = UIColor.from(hex: theme.buttonText)
		lbl7.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl7.textColor = UIColor.from(hex: theme.buttonText)
		lbl8.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl8.textColor = UIColor.from(hex: theme.buttonText)
		lbl9.backgroundColor = UIColor.from(hex: theme.numbers)
		lbl9.textColor = UIColor.from(hex: theme.buttonText)
		// Operators
		btnDog.backgroundColor = UIColor.from(hex: theme.operators)
		btnCat.backgroundColor = UIColor.from(hex: theme.operators)
		btnChicken.backgroundColor = UIColor.from(hex: theme.operators)
		btnHuman.backgroundColor = UIColor.from(hex: theme.operators)
		lblAdd.backgroundColor = UIColor.from(hex: theme.operators)
		lblAdd.textColor = UIColor.from(hex: theme.buttonText)
		lblSub.backgroundColor = UIColor.from(hex: theme.operators)
		lblSub.textColor = UIColor.from(hex: theme.buttonText)
		lblMult.backgroundColor = UIColor.from(hex: theme.operators)
		lblMult.textColor = UIColor.from(hex: theme.buttonText)
		lblDiv.backgroundColor = UIColor.from(hex: theme.operators)
		lblDiv.textColor = UIColor.from(hex: theme.buttonText)
		lblEqual.backgroundColor = UIColor.from(hex: theme.operators)
		lblEqual.textColor = UIColor.from(hex: theme.buttonText)
		// Actions
		lblClear.backgroundColor = UIColor.from(hex: theme.actions)
		lblClear.textColor = UIColor.from(hex: theme.buttonText)
		lblDelete.backgroundColor = UIColor.from(hex: theme.actions)
		lblDelete.textColor = UIColor.from(hex: theme.buttonText)
	}
}
