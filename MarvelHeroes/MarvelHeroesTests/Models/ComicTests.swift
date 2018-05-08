//
//  ComicTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ComicTests: XCTestCase {
	
	var id: Int!
	var title: String!
	var itemDescription: String!
	var thumbnail: Thumbnail!
	var json: [String: Any]!
	
	override func setUp() {
		id = 100
		title = "Comic"
		itemDescription = "ComicDescription"
		thumbnail = Thumbnail(path: "path", imageExtension: "ext")
		json = ["id": 100,
				"title": "Comic",
				"description": "ComicDescription",
				"thumbnail": ["path": "path",
							  "extension": "ext"]
			   ]
	}
	
	func testComicCreationWithDefaultInitializer() {
		let comic = Comic(id: id, title: title, description: description, thumbnail: thumbnail)
		XCTAssertEqual(comic.id, id)
		XCTAssertEqual(comic.title, title)
		XCTAssertEqual(comic.description, description)
		XCTAssertEqual(comic.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(comic.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testComicCreationWithJSON() {
		let comic = Comic(json: json)
		XCTAssertEqual(comic?.id, id)
		XCTAssertEqual(comic?.title, title)
		XCTAssertEqual(comic?.description, itemDescription)
		XCTAssertEqual(comic?.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(comic?.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
}
