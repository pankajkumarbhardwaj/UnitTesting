

import UIKit

func isPhone() -> Bool {
	let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
	return deviceIdiom == UIUserInterfaceIdiom.phone
}
