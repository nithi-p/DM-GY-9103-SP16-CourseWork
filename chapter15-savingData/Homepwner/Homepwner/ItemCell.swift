//
//  ItemCell.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 3/29/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var serialNumberLabel: UILabel!
	@IBOutlet var valueLabel: UILabel!
	
	func updateLabels() {
		let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
		nameLabel.font = bodyFont
		valueLabel.font = bodyFont
		
		let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
		serialNumberLabel.font = caption1Font
		

		
	}
}
