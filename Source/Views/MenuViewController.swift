

import UIKit

class MenuViewController: UITableViewController {
	private var menu = Menu()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Show calculator on initial load, for iPhone
		if isPhone() {
			if let split = splitViewController, let sb = storyboard {
				let vc = sb.instantiateViewController(withIdentifier: "CalculatorView")
				split.showDetailViewController(vc, sender: self)
			}
		} else {
			let index = IndexPath(row: 0, section: 0)
			tableView.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.none)
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK:- Table View Delegates
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menu.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell

		if let mi = menu.itemAt(row: indexPath.row) {
			cell.setup(item: mi)
		}
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// Handle selection
		let mi = menu.itemAt(row: indexPath.row)
		let sid = mi!.title + "View"
		if let vc = storyboard?.instantiateViewController(withIdentifier: sid), let split = splitViewController {
			let nav = UINavigationController(rootViewController: vc)
			vc.navigationItem.leftBarButtonItem = split.displayModeButtonItem
			vc.navigationItem.leftItemsSupplementBackButton = true
			split.showDetailViewController(nav, sender: self)
		}
	}
}

