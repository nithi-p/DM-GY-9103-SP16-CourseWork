//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 3/29/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet var nameField: UITextField!
	@IBOutlet var serialNumberField: UITextField!
	@IBOutlet var valueField: UITextField!
	@IBOutlet var dateLabel: UILabel!
	
	@IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
		view.endEditing(true)
	}
	
	var item: Item! {
		didSet {
			navigationItem.title = item.name
		}
	}
	
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
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		//clear first responder
		view.endEditing(true)
		
		//"Save" Changes to item
		item.name = nameField.text ?? ""
		item.serialNumber = serialNumberField.text
		
		if let valueText = valueField.text, value = numberFormatter.numberFromString(valueText) {
				item.valueInDollars = value.integerValue
			
		}else{
			item.valueInDollars = 0
		}
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}