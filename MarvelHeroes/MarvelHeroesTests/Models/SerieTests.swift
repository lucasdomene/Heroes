//
//  SerieTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class SerieTests: XCTestCase {
	
	var id: Int!
	var title: String!
	var itemDescription: String!
	var thumbnail: Thumbnail!
	var json: [String: Any]!
	
	override func setUp() {
		id = 100
		title = "Serie"
		itemDescription = "SerieDescription"
		thumbnail = Thumbnail(path: "path", imageExtension: "ext")
		json = ["id": 100,
				"title": "Serie",
				"description": "SerieDescription",
				"thumbnail": ["path": "path",
							  "extension": "ext"]
			   ]
	}
	
	func testSerieCreationWithDefaultInitializer() {
		let serie = Serie(id: id, title: title, description: description, thumbnail: thumbnail)
		XCTAssertEqual(serie.id, id)
		XCTAssertEqual(serie.title, title)
		XCTAssertEqual(serie.description, description)
		XCTAssertEqual(serie.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(serie.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testSerieCreationWithJSON() {
		let serie = Serie(json: json)
		XCTAssertEqual(serie?.id, id)
		XCTAssertEqual(serie?.title, title)
		XCTAssertEqual(serie?.description, itemDescription)
		XCTAssertEqual(serie?.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(serie?.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
}
