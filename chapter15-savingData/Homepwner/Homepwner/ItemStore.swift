//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 3/20/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class ItemStore {
	
	var allItems = [Item]()
	let itemArchiveURL: NSURL = {
		let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
		let documentDirectory = documentsDirectories.first!
		return documentDirectory.URLByAppendingPathComponent("items.archive")
	}()
	
	func saveChanges() -> Bool {
		print("Saving items to: \(itemArchiveURL.path!)")
		return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
	}
	
	func createItem() -> Item {
		let newItem = Item(random: true)
		allItems.append(newItem)
		return newItem
	}
	
	func removeItem(item: Item) {
		if let index = allItems.indexOf(item){
			allItems.removeAtIndex(index)
		}
	}

	func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
		if fromIndex == toIndex {
			return
		}
		//Get reference to object being moved so you can reinsert it
		let movedItem = allItems[fromIndex]
		
		//Remove item from array
		allItems.removeAtIndex(fromIndex)
		
		//Re-insert item in arrray at new index
		allItems.insert(movedItem, atIndex: toIndex)
	}
	
	init() {
		if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
			allItems += archivedItems
		}
	}
	
	
}

