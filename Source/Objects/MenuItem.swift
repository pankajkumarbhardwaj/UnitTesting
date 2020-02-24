

import Foundation

struct MenuItem {
	var title = "Menu Item"
	
	init(dictionary:[String:String]) {
		if let title = dictionary["title"] {
			self.title = title
		}
	}
}
