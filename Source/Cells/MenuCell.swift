

import UIKit

class MenuCell: UITableViewCell {
	@IBOutlet private weak var vwBG: UIView!
	@IBOutlet private weak var imgIcon: UIImageView!
	@IBOutlet private weak var lblTitle: UILabel!

	private let colNormal = #colorLiteral(red: 0.008669083938, green: 0.8590171337, blue: 0.929469049, alpha: 0.4)
	private let colSelected = #colorLiteral(red: 0, green: 0.6686167717, blue: 0.9414479136, alpha: 0.4)
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set up
		vwBG.backgroundColor = colNormal
		vwBG.layer.masksToBounds = true
		vwBG.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		vwBG.backgroundColor = selected ? colSelected : colNormal
    }

	func setup(item: MenuItem) {
		lblTitle.text = item.title
		imgIcon.image = UIImage(named: item.title)
	}
}
