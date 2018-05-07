//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

struct Hero: Codable {
	
	let id: Int
	let name: String
	let thumbnail: Thumbnail?
	
}

extension Hero: Equatable {
	public static func == (lhs: Hero, rhs: Hero) -> Bool {
		return lhs.id == rhs.id
	}
}

extension Hero: Parseable {
	
	init?(json: [String: Any]) {
		guard let id = json["id"] as? Int,
			let name = json["name"] as? String else {
				return nil
		}
		
		var thumbnail: Thumbnail?
		if let thumbnailJSON = json["thumbnail"] as? [String: Any],
			let downloadedThumbnail = Thumbnail(json: thumbnailJSON) {
			thumbnail = downloadedThumbnail
		}
		
		self.init(id: id, name: name, thumbnail: thumbnail)
	}
	
}
