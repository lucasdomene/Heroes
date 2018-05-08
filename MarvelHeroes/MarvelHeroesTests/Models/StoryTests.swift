//
//  StoryTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class StoryTests: XCTestCase {
	
	var id: Int!
	var title: String!
	var itemDescription: String!
	var thumbnail: Thumbnail!
	var json: [String: Any]!
	
	override func setUp() {
		id = 100
		title = "Story"
		itemDescription = "StoryDescription"
		thumbnail = Thumbnail(path: "path", imageExtension: "ext")
		json = ["id": 100,
				"title": "Story",
				"description": "StoryDescription",
				"thumbnail": ["path": "path",
							  "extension": "ext"]
			   ]
	}
	
	func testStoryCreationWithDefaultInitializer() {
		let story = Story(id: id, title: title, description: description, thumbnail: thumbnail)
		XCTAssertEqual(story.id, id)
		XCTAssertEqual(story.title, title)
		XCTAssertEqual(story.description, description)
		XCTAssertEqual(story.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(story.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testStoryCreationWithJSON() {
		let story = Story(json: json)
		XCTAssertEqual(story?.id, id)
		XCTAssertEqual(story?.title, title)
		XCTAssertEqual(story?.description, itemDescription)
		XCTAssertEqual(story?.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(story?.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
}
