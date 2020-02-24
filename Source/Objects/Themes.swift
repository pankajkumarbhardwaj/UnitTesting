

import Foundation

struct Themes {
	private var data = [Theme]()
	
	var count:Int {
		return data.count
	}
	
	init() {
		loadDefaults()
	}
	
	mutating func loadDefaults() {
		if let path = Bundle.main.path(forResource: "Themes", ofType: "plist") {
			loadThemesFrom(path: path)
		} else {
			assertionFailure("Could not load default themes")
		}
	}
	
	mutating func loadThemesFrom(path: String) {
		if let arr = NSArray(contentsOfFile: path) {
			for row in arr {
				if let dic = row as? [String:String] {
					let thm = Theme(dictionary: dic)
					data.append(thm)
				}
			}
		}
	}
	
	func themeAt(row: Int) -> Theme? {
		return data[row]
	}
}
