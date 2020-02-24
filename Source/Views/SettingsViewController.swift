

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	@IBOutlet private weak var collectionView: UICollectionView!
	private var themes = Themes()

    override func viewDidLoad() {
        super.viewDidLoad()
		// Configure collection view
		let width = (view.frame.size.width - 10) / 2
		let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width:width, height:width * 1.5)
		// Set current selection
		let def = UserDefaults.standard
		let selection = def.integer(forKey: "CurrentTheme")
		let index = IndexPath(row: selection, section: 0)
		collectionView.selectItem(at: index, animated: false, scrollPosition: UICollectionViewScrollPosition.top)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- Collection View Delegates
	func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return themes.count
	}

	func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = cv.dequeueReusableCell(withReuseIdentifier: "ThemeCell", for: indexPath) as! ThemeCell
		if let thm = themes.themeAt(row: indexPath.row) {
			cell.configure(theme: thm)
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// Save theme selection
		let def = UserDefaults.standard
		def.set(indexPath.row, forKey: "CurrentTheme")
		def.synchronize()
	}
}
