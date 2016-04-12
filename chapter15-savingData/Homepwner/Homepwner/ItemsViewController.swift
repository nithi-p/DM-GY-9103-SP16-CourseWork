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
	
	var imageStore: ImageStore!
	
	
	override func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
		return itemStore.allItems.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
		
		//Update the label for the new size
		cell.updateLabels()
		
		
		
		let item = itemStore.allItems[indexPath.row]
		
		//configure the cell with the item
		cell.nameLabel.text = item.name
		cell.serialNumberLabel.text = item.serialNumber
		cell.valueLabel.text = "$\(item.valueInDollars)"
		
		
		//Bronze challenge
		if ( item.valueInDollars < 50 ) {
			cell.valueLabel.textColor = UIColor.greenColor()
		} else {
			cell.valueLabel.textColor = UIColor.redColor()
		}
		
		
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
	
	
	
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
		//if the table view is asking to commit a delete command...
		if editingStyle == .Delete {
			let item = itemStore.allItems[indexPath.row]
			
			let title = "Delete \(item.name)?"
			let message = "Are you sure?"
			
			let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
			let cancelAction = UIAlertAction(title: "Cancel",style: .Cancel, handler: nil)
			ac.addAction(cancelAction)
			
			let deleteAction = UIAlertAction(title: "Remove", style: .Destructive, handler: { (action) -> Void in
			
			//remove item from the store
			self.itemStore.removeItem(item)
				
				
			// IMAGE ! Remove item's image for the image store 
				self.imageStore.deleteImageForKey(item.itemKey)
			
			//Also remove that row from the table view with animation
			self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
			
			})
			ac.addAction(deleteAction)
			
			// PRESENT THE ALERT CONTROLLER
			presentViewController(ac, animated: true, completion: nil)
		}
	}
	
	override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
		// update the model
		itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowItem" {
			//check which row is just tapped
			if let row = tableView.indexPathForSelectedRow?.row {
				// get the item
				let item = itemStore.allItems[row]
				let detailViewController = segue.destinationViewController as! DetailViewController
				detailViewController.item = item
				detailViewController.imageStore = imageStore
				
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 65
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}
	
	required init?(coder aDecoder: NSCoder){
		super.init(coder: aDecoder)
		navigationItem.leftBarButtonItem = editButtonItem()
	}
	
}
