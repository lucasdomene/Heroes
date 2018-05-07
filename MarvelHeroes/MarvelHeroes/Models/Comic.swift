//
//  Comic.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

struct Comic {
	
	let id: Int
	let title: String
	let thumbnail: Thumbnail
	
}

extension Comic: Parseable {
	
	init?(json: [String: Any]) {
		guard let id = json["id"] as? Int,
			let title = json["title"] as? String,
			let thumbnailJSON = json["thumbnail"] as? [String: Any],
			let thumbnail = Thumbnail(json: thumbnailJSON) else {
				return nil
		}
		self.init(id: id, title: title, thumbnail: thumbnail)
	}
	
}
