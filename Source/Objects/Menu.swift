

import Foundation

struct Menu {
	private var data = [MenuItem]()
	
	var count:Int {
		return data.count
	}
	
	init() {
		loadDefaultMenu()
	}
	
	mutating func loadDefaultMenu() {
		if let path = Bundle.main.path(forResource: "Menu", ofType: "plist") {
			loadMenu(path: path)
		} else {
			assertionFailure("Could not load default menu")
		}
	}
	
	mutating func loadMenu(path: String) {
        data.removeAll()
		if let arr = NSArray(contentsOfFile: path) {
			for row in arr {
				if let dic = row as? [String:String] {
					let itm = MenuItem(dictionary: dic)
					data.append(itm)
				}
			}
        }else {
            NSLog("Could not load menue file at \(path)")
        }
	}
	
	func itemAt(row: Int) -> MenuItem? {
		return data[row]
	}
}
