

import UIKit

class CalculatorViewController: UIViewController {
	@IBOutlet private weak var lblOutput: UILabel!
	@IBOutlet private weak var lblHistory: UILabel!
	@IBOutlet private weak var btnDog: UIButton!
	@IBOutlet private weak var btnCat: UIButton!
	@IBOutlet private weak var btnChicken: UIButton!
	@IBOutlet private weak var btnHuman: UIButton!
	@IBOutlet private weak var btnDot: UIButton!
	@IBOutlet private weak var btn0: UIButton!
	@IBOutlet private weak var btn1: UIButton!
	@IBOutlet private weak var btn2: UIButton!
	@IBOutlet private weak var btn3: UIButton!
	@IBOutlet private weak var btn4: UIButton!
	@IBOutlet private weak var btn5: UIButton!
	@IBOutlet private weak var btn6: UIButton!
	@IBOutlet private weak var btn7: UIButton!
	@IBOutlet private weak var btn8: UIButton!
	@IBOutlet private weak var btn9: UIButton!
	@IBOutlet private weak var btnAdd: UIButton!
	@IBOutlet private weak var btnSub: UIButton!
	@IBOutlet private weak var btnMult: UIButton!
	@IBOutlet private weak var btnDiv: UIButton!
	@IBOutlet private weak var btnEqual: UIButton!
	@IBOutlet private weak var btnClear: UIButton!
	@IBOutlet private weak var btnDelete: UIButton!

	private var isTypingANumber = false
	private var hasEnteredADot = false
	private var calc = Calculator()
	private var types = [UIButton]()
	private var currentType = Type.typeFor(tag: 100)
	
	var displayValue: Double {
		get {
			let text = lblOutput.text!
			return NumberFormatter().number(from: text)!.doubleValue
		}
		set {
			lblOutput.text = newValue.noZeroString()
			isTypingANumber = false
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// Get type buttons into array
		for i in 100 ... 103 {
			if let btn = view.viewWithTag(i) as? UIButton {
				// Set initial type selection
				if i == 100 {
					btn.isSelected = true
				}
				types.append(btn)
			}
		}
		// Update theme
		let themes = Themes()
		// Set current selection
		let def = UserDefaults.standard
		let selection = def.integer(forKey: "CurrentTheme")
		if let thm = themes.themeAt(row: selection) {
			setup(theme: thm)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	// MARK:- Actions
	@IBAction func selectType(sender: UIButton) {
		// Iterate over all type buttons
		for btn in types {
			btn.isSelected = btn == sender
		}
		// Switch type, if necessary
		if currentType.tag != sender.tag {
			let oldType = currentType
			currentType = Type.typeFor(tag: sender.tag)
			// Convert entry or displayed value to new type
			if calc.canConvert {
				if isTypingANumber {
					numberEntered()
				}
				// For first time
				if calc.lastOp == nil {
					_ = calc.evaluate(op: ">", arg: displayValue, type: oldType)
				}
				let result = calc.evaluate(op: ">", arg: displayValue, type:currentType)
				lblHistory.text = calc.history
				displayValue = result
			}
		}
	}
	
	@IBAction func appendDigit(sender: UIButton) {
		guard let text = lblOutput.text else { return }
		let digit = sender.currentTitle!
		if digit == "." {
			if hasEnteredADot {
				return
			} else {
				hasEnteredADot = true
			}
		}
		if isTypingANumber {
			lblOutput.text = text + digit
		} else {
			lblOutput.text = digit
			isTypingANumber = true
		}
	}
	
	@IBAction func operate(sender: UIButton) {
		if isTypingANumber {
			numberEntered()
		}
		if let op = sender.currentTitle {
			let result = calc.evaluate(op: op, arg: displayValue, type:currentType)
			lblHistory.text = calc.history
			displayValue = result
		}
	}
	
	@IBAction func clear() {
		numberEntered()
		lblOutput.text = "0"
		print("Calculator has been reset")
		calc = Calculator()
		lblHistory.text = calc.history
	}
	
	@IBAction func backspace() {
		guard let text = lblOutput.text else { return }
		if text.count > 0 {
			lblOutput.text = String(text.dropLast())
			if lblOutput.text!.isEmpty {
				isTypingANumber = false
				lblOutput.text = "0"
			}
		}
	}
	
	@IBAction func changeSign() {
		displayValue = -(displayValue)
	}
	
	// MARK:- Public Methods
	func setup(theme: Theme) {
		// Background
		view.backgroundColor = UIColor.from(hex: theme.bg)
		// Results
		lblOutput.backgroundColor = UIColor.from(hex: theme.result)
		lblOutput.textColor = UIColor.from(hex: theme.buttonText)
		// History
		lblHistory.textColor = UIColor.from(hex: theme.historyText)
		// Numbers
		btnDot.backgroundColor = UIColor.from(hex: theme.numbers)
		btnDot.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn0.backgroundColor = UIColor.from(hex: theme.numbers)
		btn0.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn1.backgroundColor = UIColor.from(hex: theme.numbers)
		btn1.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn2.backgroundColor = UIColor.from(hex: theme.numbers)
		btn2.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn3.backgroundColor = UIColor.from(hex: theme.numbers)
		btn3.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn4.backgroundColor = UIColor.from(hex: theme.numbers)
		btn4.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn5.backgroundColor = UIColor.from(hex: theme.numbers)
		btn5.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn6.backgroundColor = UIColor.from(hex: theme.numbers)
		btn6.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn7.backgroundColor = UIColor.from(hex: theme.numbers)
		btn7.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn8.backgroundColor = UIColor.from(hex: theme.numbers)
		btn8.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btn9.backgroundColor = UIColor.from(hex: theme.numbers)
		btn9.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		// Operators
		btnDog.backgroundColor = UIColor.from(hex: theme.operators)
		btnCat.backgroundColor = UIColor.from(hex: theme.operators)
		btnChicken.backgroundColor = UIColor.from(hex: theme.operators)
		btnHuman.backgroundColor = UIColor.from(hex: theme.operators)
		btnAdd.backgroundColor = UIColor.from(hex: theme.operators)
		btnAdd.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btnSub.backgroundColor = UIColor.from(hex: theme.operators)
		btnSub.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btnMult.backgroundColor = UIColor.from(hex: theme.operators)
		btnMult.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btnDiv.backgroundColor = UIColor.from(hex: theme.operators)
		btnDiv.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btnEqual.backgroundColor = UIColor.from(hex: theme.operators)
		btnEqual.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		// Actions
		btnClear.backgroundColor = UIColor.from(hex: theme.actions)
		btnClear.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
		btnDelete.backgroundColor = UIColor.from(hex: theme.actions)
		btnDelete.setTitleColor(UIColor.from(hex: theme.buttonText), for: UIControlState.normal)
	}
	
	// MARK:- Private Methods
	private func numberEntered() {
		isTypingANumber = false
		hasEnteredADot = false
	}
}
