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
	
	func setImage(image: UIImage, forKey key: String) {
		cache.setObject(image, forKey: key)
	}
	func imageForKey (key: String) -> UIImage? {
		return cache.objectForKey(key) as? UIImage
	}
	func deleteImageForKey(key: String) {
		cache.removeObjectForKey(key)
	}
}
