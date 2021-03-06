

import UIKit

extension UIColor {
	convenience init(hex:String, alpha:Float = 1.0) {
		var al = alpha
		// Remove # prefix, if used
		var tmp = hex.hasPrefix("#") ? String(hex[hex.index(after:hex.startIndex)...]) : hex
		// Handle standard HTML colours such as black, white etc.
		let colours = ["black":"000000", "white":"FFFFFF", "red":"FF0000", "cyan":"00FFFF", "blue":"0000FF", "purple":"800080", "yellow":"FFFF00", "lime":"00FF00", "magenta":"FF00FF", "silver":"C0C0C0", "green":"008000", "olive":"808000"]
		if let buf = colours[tmp] {
			tmp = buf
		}
		// Set a default of black (in case the string is invalid)
		var strR = "0"
		var strG = "0"
		var strB = "0"
		let cnt = tmp.count
		// Is this a 3 digit hex string?
		var from = tmp.startIndex
		if cnt == 3 {
			var to = tmp.index(after:from)
			strR = String(tmp[from..<to])
			from = tmp.index(after:from)
			to = tmp.index(after:from)
			strG = String(tmp[from..<to])
			from = tmp.index(after:from)
			to = tmp.index(after:from)
			strB = String(tmp[from..<to])
		}
		// Handle 6 digit hex string
		if cnt >= 6 {
			var to = tmp.index(from, offsetBy:2)
			strR = String(tmp[from..<to])
			from = to
			to = tmp.index(from, offsetBy:2)
			strG = String(tmp[from..<to])
			from = to
			to = tmp.index(from, offsetBy:2)
			strB = String(tmp[from..<to])
			if cnt == 8 {
				from = to
				to = tmp.index(from, offsetBy:2)
				let str = String(tmp[from..<to])
				var a:CUnsignedInt = 0
				Scanner(string:str).scanHexInt32(&a)
				al = Float(a) / 255.0
			}
		}
		// Convert strings to Int values
		var r:CUnsignedInt = 0
		var g:CUnsignedInt = 0
		var b:CUnsignedInt = 0
		Scanner(string:strR).scanHexInt32(&r)
		Scanner(string:strG).scanHexInt32(&g)
		Scanner(string:strB).scanHexInt32(&b)
		let rf = Float(r) / 255.0
		let gf = Float(g) / 255.0
		let bf = Float(b) / 255.0
//		println("Final values r:\(rf), g:\(gf), b:\(bf)")
		self.init(red:CGFloat(rf), green:CGFloat(gf), blue:CGFloat(bf), alpha:CGFloat(al))
	}
	
	@objc public class func from(hex:String)->UIColor {
		return UIColor(hex:hex, alpha:1.0)
	}
	
	var hexString:String {
		let colorSpace = cgColor.colorSpace!.model
		var r:Float = 0
		var g:Float = 0
		var b:Float = 0
		var a:Float = 0
		if let comps = cgColor.components {
			if colorSpace == CGColorSpaceModel.monochrome {
				r = Float(comps[0])
				g = Float(comps[0])
				b = Float(comps[0])
				a = Float(comps[1])
			} else if colorSpace == CGColorSpaceModel.rgb {
				r = Float(comps[0])
				g = Float(comps[1])
				b = Float(comps[2])
				a = Float(comps[3])
			}
		}
		return String(format:"#%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
	}
}
