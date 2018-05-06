//
//  ImageService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class ImageService {
	
	private class func downloadImage(fromURL url: URL, completion: @escaping (UIImage?) -> Void) {
		Request.shared.run(urlRequest: URLRequest(url: url)) { data, response, error in
			completion(data != nil ? UIImage(data: data!) : nil)
		}
	}
	
	class func setImage(withUrl url: URL, inImageView imageView: UIImageView?) {
		downloadImage(fromURL: url) { image in
			DispatchQueue.main.async {
				imageView?.image = image
			}
		}
	}
	
}
