//
//  ImageStore.swift
//  Homepwner
//
//  Created by Nithi Prasanpanich on 4/5/16.
//  Copyright © 2016 Nithi. All rights reserved.
//

import UIKit

class ImageStore {
	let cache = NSCache()
	
	func imageURLForkey(key: String) -> NSURL {
		let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
		let documentDirectory = documentsDirectories.first!
		
		return documentDirectory.URLByAppendingPathComponent(key)
	}
	
	
	func setImage(image: UIImage, forKey key: String) {
		cache.setObject(image, forKey: key)
		
		let imageURL = imageURLForkey(key)
		
		if let data = UIImageJPEGRepresentation(image, 0.5){
			data.writeToURL(imageURL, atomically: true)
		}
		
		
	}
	
	
	func imageForKey (key: String) -> UIImage? {
		return cache.objectForKey(key) as? UIImage
		
		if let existingImage = cache.objectForKey(key) as? UIImage {
			return existingImage
		}
		let imageURL = imageURLForkey(key)
		guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else {
			return nil
		}
		
		cache.setObject(imageFromDisk, forKey: key)
		return imageFromDisk
		
		
	}
	
	
	func deleteImageForKey(key: String) {
		cache.removeObjectForKey(key)
		let imageURL = imageURLForkey(key)
		do {
			try NSFileManager.defaultManager().removeItemAtURL(imageURL)
		}catch let deleteError{
			print("Error removing the image from disk: \(deleteError)")
		}

	}
	
	

	
}
