//
//  Story.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

struct Story: Detailable {
	
	var id: Int
	var title: String
	var description: String
	var thumbnail: Thumbnail?
	
}

extension Story: Parseable {
	
	init?(json: [String: Any]) {
		guard let id = json["id"] as? Int,
			let title = json["title"] as? String,
			let description = json["description"] as? String else {
				return nil
		}
		
		var thumbnail: Thumbnail?
		if let thumbnailJSON = json["thumbnail"] as? [String: Any],
			let downloadedThumbnail = Thumbnail(json: thumbnailJSON) {
			thumbnail = downloadedThumbnail
		}
		
		self.init(id: id, title: title, description: description, thumbnail: thumbnail)
	}
	
}
