

#if os(iOS)
	import UIKit
#else
	import AppKit
#endif

extension Double {
	func formattedString(showSeparators:Bool=true, showDecimalZero:Bool=false) -> String {
		let fmt = NumberFormatter()
		fmt.usesGroupingSeparator = showSeparators
		let isWhole = rounded() == self
		if !showDecimalZero && isWhole {
			fmt.maximumFractionDigits = 0
			fmt.minimumFractionDigits = 0
		}
		if let str = fmt.string(for:self) {
			return str
		}
		return "fmtErr"
	}
	
	func noZeroString() -> String {
		var s = String(format:"%f", self)
		while s.hasSuffix("0") {
			let ndx = s.index(before:s.endIndex)
			s = String(s[..<ndx])
		}
		if s.hasSuffix(".") {
			let ndx = s.index(before:s.endIndex)
			s = String(s[..<ndx])
		}
		return s
	}
}
