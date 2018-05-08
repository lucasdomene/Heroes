//
//  HeroTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class HeroTests: XCTestCase {

	var heroID: Int!
	var heroName: String!
	var thumbnail: Thumbnail!
	var json: [String: Any]!
	
	override func setUp() {
		heroID = 100
		heroName = "Hulk"
		thumbnail = Thumbnail(path: "path", imageExtension: "ext")
		json = ["id": 100,
				"name": "Hulk",
				"thumbnail": ["path": "path", 				"extension": "ext"]
		]
	}
	
	func testHeroCreationWithDefaultInitializer() {
		let hero = Hero(id: heroID, name: heroName, thumbnail: thumbnail)
		XCTAssertEqual(hero.name, heroName)
		XCTAssertEqual(hero.id, heroID)
		XCTAssertEqual(hero.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(hero.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testHeroCreationWithJSON() {
		let hero = Hero(json: json)
		XCTAssertEqual(hero?.name, heroName)
		XCTAssertEqual(hero?.id, heroID)
		XCTAssertEqual(hero?.thumbnail?.path, thumbnail.path)
		XCTAssertEqual(hero?.thumbnail?.imageExtension, thumbnail.imageExtension)
	}
	
	func testIfHeroesAreEqual() {
		let heroA = Hero(id: heroID, name: heroName, thumbnail: thumbnail)
		let heroB = Hero(id: heroID, name: heroName, thumbnail: thumbnail)
		XCTAssertTrue(heroA == heroB)
	}
	
	func testIfHeroesAreDifferent() {
		let heroA = Hero(id: heroID, name: heroName, thumbnail: thumbnail)
		let heroB = Hero(id: 101, name: heroName, thumbnail: thumbnail)
		
		XCTAssertFalse(heroA == heroB)
	}
	
}
