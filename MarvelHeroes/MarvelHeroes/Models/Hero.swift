//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

struct Hero: Decodable {
	
	let id: Int
	let name: String
	let thumbnail: Thumbnail
	
}

extension Hero: Equatable {
	public static func == (lhs: Hero, rhs: Hero) -> Bool {
		return lhs.id == rhs.id
	}
}

extension Hero {
	
	init?(json: [String: Any]) {
		guard let id = json["id"] as? Int,
			let name = json["name"] as? String,
			let thumbnailJSON = json["thumbnail"] as? [String: Any],
			let thumbnail = Thumbnail(json: thumbnailJSON) else {
				return nil
		}
		self.init(id: id, name: name, thumbnail: thumbnail)
	}
	
}
