//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nithi Prasanpanich on 2/14/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
	
	

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
			
			//BRONZE CHALLENGE
			let replacementTextAlphabet0 = string.rangeOfString("0")
			let replacementTextAlphabet1 = string.rangeOfString("1")
			let replacementTextAlphabet2 = string.rangeOfString("2")
			let replacementTextAlphabet3 = string.rangeOfString("3")
			let replacementTextAlphabet4 = string.rangeOfString("4")
			let replacementTextAlphabet5 = string.rangeOfString("5")
			let replacementTextAlphabet6 = string.rangeOfString("6")
			let replacementTextAlphabet7 = string.rangeOfString("7")
			let replacementTextAlphabet8 = string.rangeOfString("8")
			let replacementTextAlphabet9 = string.rangeOfString("9")
			let replacementTextAlphabetdot = string.rangeOfString(".")

			
			if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeparator != nil {
				return false
			}
			
			//BRONZE CHALLENGE
			else if replacementTextAlphabet0 == nil && replacementTextAlphabet1 == nil && replacementTextAlphabet2 == nil && replacementTextAlphabet3 == nil && replacementTextAlphabet4 == nil && replacementTextAlphabet5 == nil && replacementTextAlphabet6 == nil && replacementTextAlphabet7 == nil && replacementTextAlphabet8 == nil && replacementTextAlphabet9 == nil && replacementTextAlphabetdot == nil{
				return false
			}
			
			
			else {
				return true
			}
			
	}


	
}
