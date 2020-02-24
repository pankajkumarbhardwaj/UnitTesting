
import UIKit
import MessageUI
import StoreKit

class AboutViewController: UITableViewController, MFMailComposeViewControllerDelegate {
	@IBOutlet private weak var lblVersion:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		// Set text
		if let info = Bundle.main.infoDictionary, let ver = info["CFBundleShortVersionString"] as? String, let bld = info["CFBundleVersion"] as? String {
			self.lblVersion.text = "Version: \(ver) (\(bld))"
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	// MARK:- Actions
	@IBAction func feedback() {
		// Send e-mail
		let mailComposerVC = MFMailComposeViewController()
		mailComposerVC.mailComposeDelegate = self
		mailComposerVC.setToRecipients(["someone@somewhere.com"])
		mailComposerVC.setSubject("Feedback...")
		mailComposerVC.setMessageBody("This is my feedback:", isHTML: false)
		if MFMailComposeViewController.canSendMail() {
			self.present(mailComposerVC, animated: true, completion: nil)
		} else {
			let alert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
			present(alert, animated: true, completion: nil)
		}
	}
	
	@IBAction func rate() {
		SKStoreReviewController.requestReview()
	}
	
	@IBAction func visitOurSite() {
		if let url = URL(string:"http://raywenderlich.com") {
			UIApplication.shared.open(url)
		}
	}
	
	@IBAction func followOnTwitter() {
		if let url = URL(string:"https://twitter.com/rwenderlich") {
			UIApplication.shared.open(url)
		}
	}
	
	// MARK:- MFMailComposeViewControllerDelegate Method
	func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
}
