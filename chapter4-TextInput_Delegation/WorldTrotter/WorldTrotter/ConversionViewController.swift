//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nithi Prasanpanich on 2/14/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

	@IBOutlet var celsiusLabel: UILabel!
	@IBOutlet var textField: UITextField!
	
	@IBAction func fahrenheitFieldEdittingChanged(textField: UITextField) {
		if let text = textField.text where !text.isEmpty {
			celsiusLabel.text = text
		}
		else{
			celsiusLabel.text = "???"
		}
	}
	
}
