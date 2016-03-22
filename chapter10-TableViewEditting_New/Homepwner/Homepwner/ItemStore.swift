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

	
	
	
}

