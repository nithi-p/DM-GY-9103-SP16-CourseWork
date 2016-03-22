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
	
	@IBAction func addNewItem(sender: AnyObject) {
		print("add")
		
		//Create a new item and add it to the store
		let newItem = itemStore.createItem()
		
		// Find out where that item is in the array
		if let index = itemStore.allItems.indexOf(newItem){
			let indexPath = NSIndexPath(forRow: index, inSection: 0)
			
			//Insert this new row into the table
			tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
			
		}
		
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
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
		//if the table view is asking to commit a delete command...
		if editingStyle == .Delete {
			let item = itemStore.allItems[indexPath.row]
			//remove item from the store
			itemStore.removeItem(item)
			
			//Also remove that row from the table view with animation
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
		
		let insets = UIEdgeInsets(top: statusBarHeight, left:0, bottom:0, right:0)
		tableView.contentInset = insets
		tableView.scrollIndicatorInsets = insets
	}
	
}
