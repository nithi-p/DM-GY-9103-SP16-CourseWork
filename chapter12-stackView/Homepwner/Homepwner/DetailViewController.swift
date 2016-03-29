//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 3/29/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	@IBOutlet var nameField: UITextField!
	@IBOutlet var serialNumberField: UITextField!
	@IBOutlet var valueField: UITextField!
	@IBOutlet var dateLabel: UILabel!
	
	var item: Item!
	
	/* formatter */
	
	let numberFormatter: NSNumberFormatter = {
		let formatter = NSNumberFormatter()
		formatter.numberStyle = .DecimalStyle
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 2
		return formatter
	}()
	
	let dateFormatter: NSDateFormatter = {
		let formatter = NSDateFormatter()
		formatter.dateStyle = .MediumStyle
		formatter.timeStyle = .NoStyle
		return formatter
	}()
	
	
	/* formatter ends */
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		nameField.text = item.name
		serialNumberField.text = item.serialNumber
		/*valueField.text = "\(item.valueInDollars)"
		dateLabel.text = "\(item.dateCreated)"*/
		valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
		dateLabel.text  = dateFormatter.stringFromDate(item.dateCreated)
	}
}