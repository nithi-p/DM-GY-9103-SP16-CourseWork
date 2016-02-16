//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nithi Prasanpanich on 2/14/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
	
	
	//SILVER CHALLENGE
	override func viewWillAppear(thing: Bool) {
		super.viewWillAppear(thing);
		let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
		print(hour)
		if hour >= 17 {
			self.view.backgroundColor = UIColor(red: 0.1137, green: 0.1725, blue: 0.4, alpha: 1.0)
		}else if hour >= 0 && hour <= 6 {
			self.view.backgroundColor = UIColor(red: 0.1137, green: 0.1725, blue: 0.4, alpha: 1.0)
		}else{
			self.view.backgroundColor = UIColor(red: 0.7176, green: 0.9176, blue: 1, alpha: 1.0)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("ConversionViewController loaded its view")
	}
	


	@IBOutlet var celsiusLabel: UILabel!
	@IBOutlet var textField: UITextField!
	
	let numberFormatter: NSNumberFormatter = {
		let nf = NSNumberFormatter()
		nf.numberStyle = .DecimalStyle
		nf.minimumFractionDigits = 0
		nf.maximumFractionDigits = 1
		return nf
	}()
	
	func updateCelsiusLabel() {
		if let value = celsiusValue {
			celsiusLabel.text = numberFormatter.stringFromNumber(value)
		}
		else{
			celsiusLabel.text = "???"
		}
	}
	
	
	var fahrenheitValue: Double? {
		didSet {
			updateCelsiusLabel()
		}
	}
	
	var celsiusValue: Double? {
		if let value = fahrenheitValue{
			return (value-32) * (5/9)
		}else{
			return nil
		}
	}
	

	@IBAction func dismissKeyboard(sender: AnyObject){
		textField.resignFirstResponder()
	}
	
	
	@IBAction func fahrenheitFieldEdittingChanged(textField: UITextField) {
		if let text = textField.text, value = Double(text) {
			fahrenheitValue = value
		}else{
			fahrenheitValue = nil
		}
	}
	
	

	
	func textField(textField: UITextField,
		shouldChangeCharactersInRange range: NSRange,
		replacementString string:String) -> Bool {
			
			let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
			let replacementTextHasDecimalSeparator = string.rangeOfString(".")

			
			if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeparator != nil {
				return false
			}
			
			else {
				return true
			}
			
	}


	
}
