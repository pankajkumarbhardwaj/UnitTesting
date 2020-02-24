

import Foundation

struct Theme {
	var name = "Theme"
	var bg = "FFFFFF"
	var result = "EFEFF4"
	var numbers = "EFEFF4"
	var operators = "FFC050CC"
	var actions = "FF372780"
	var historyText = "000000"
	var buttonText = "000000"

	init(dictionary:[String:String]) {
		if let name = dictionary["name"] {
			self.name = name
		}
		if let bg = dictionary["bg"] {
			self.bg = bg
		}
		if let result = dictionary["result"] {
			self.result = result
		}
		if let numbers = dictionary["numbers"] {
			self.numbers = numbers
		}
		if let operators = dictionary["operators"] {
			self.operators = operators
		}
		if let actions = dictionary["actions"] {
			self.actions = actions
		}
		if let historyText = dictionary["historyText"] {
			self.historyText = historyText
		}
		if let buttonText = dictionary["buttonText"] {
			self.buttonText = buttonText
		}
	}
}
