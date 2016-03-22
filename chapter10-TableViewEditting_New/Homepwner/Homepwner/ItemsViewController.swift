//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 3/8/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit


class ItemsViewController: UITableViewController{
	
	
	var itemStore: ItemStore!
	
	@IBAction func addNewItem(sender: AnyObject) {
		print("add")
		
	}
	
	@IBAction func toggleEditingMode(sender: AnyObject){
		print("edit")
		// If in editting mode..
		if editing {
			// Change text of button
			sender.setTitle("Edit", forState: .Normal)
			// turn off editing mode
			setEditing(false, animated: true)
		}else{
			// change text
			sender.setTitle("Done", forState: .Normal)
			// enter editting
			setEditing(true, animated: true)
		}
		
	}
	
	override func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
		return itemStore.allItems.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
		let item = itemStore.allItems[indexPath.row]
		
		cell.textLabel?.text = item.name
		cell.detailTextLabel?.text = "$\(item.valueInDollars)"
		
		return cell
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
		
		let insets = UIEdgeInsets(top: statusBarHeight, left:0, bottom:0, right:0)
		tableView.contentInset = insets
		tableView.scrollIndicatorInsets = insets
	}
	
}
