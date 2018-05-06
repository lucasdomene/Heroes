//
//  Thumbnail.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
	
	let path: String
	let imageExtension: String
	var fullPath: String {
		return [path, imageExtension].joined(separator: ".")
	}
	
}

extension Thumbnail {
	
	init?(json: [String: Any]) {
		guard let path = json["path"] as? String,
			let imageExtension = json["extension"] as? String else {
				return nil
		}
		self.init(path: path, imageExtension: imageExtension)
	}
	
}
