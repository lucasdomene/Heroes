//
//  ImageService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class ImageService {
	
	// MARK: - Attributes
	
	let cache = NSCache<AnyObject, AnyObject>()
	
	// MARK: - Instance Methods
	
	func downloadImage(fromURL url: URL, completion: @escaping (UIImage?) -> Void) {
		Request.shared.run(urlRequest: URLRequest(url: url)) { data, response, error in
			completion(data != nil ? UIImage(data: data!) : nil)
		}
	}
	
	func setImage(image: UIImage?, forkey key: String) {
		if let image = image {
			cache.setObject(image, forKey: key as AnyObject)
			
			let imageURL = imageURLForKey(key: key)
			if let data = UIImageJPEGRepresentation(image, 0.5) {
				try? data.write(to: imageURL, options: .atomicWrite)
			}
		}
	}
	
	func imageForKey(key: String) -> UIImage? {
		if let existingImage = cache.object(forKey: key as AnyObject) as? UIImage {
			return existingImage
		}
		
		let imageURL = imageURLForKey(key: key)
		guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
			return nil
		}
		
		cache.setObject(imageFromDisk, forKey: key as AnyObject)
		return imageFromDisk
	}
	
	func imageURLForKey(key: String) -> URL {
		let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let documentDirectory = documentsDirectories.first!
		return documentDirectory.appendingPathComponent(key)
	}
	
}
