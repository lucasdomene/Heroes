//
//  EventTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class EventTests: XCTestCase {
	
	var id: Int!
	var title: String!
	var itemDescription: String!
	var thumbnail: Thumbnail!
	var json: [String: Any]!
	
	override func setUp() {
		id = 100
		title = "Event"
		itemDescription = "EventDescription"
		thumbnail = Thumbnail(path: "path", imageExtension: "ext")
		json = ["id": 100,
				"title": "Event",
				"description": "EventDescription",
				"thumbnail": ["path": "path",
							  "extension": "ext"]
			   ]
	}
	
	func testEventCreationWithDefaultInitializer() {
		let event = Event(id: id, title: title, description: description, thumbnail: thumbnail)
		XCTAssertEqual(event.id, id)
		XCTAssertEqual(event.title, title)
		XCTAssertEqual(event.description, description)
		XCTAssertEqual(event.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(event.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testEventCreationWithJSON() {
		let event = Event(json: json)
		XCTAssertEqual(event?.id, id)
		XCTAssertEqual(event?.title, title)
		XCTAssertEqual(event?.description, itemDescription)
		XCTAssertEqual(event?.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(event?.thumbnail?.imageExtension, thumbnail.imageExtension)
	}

}
