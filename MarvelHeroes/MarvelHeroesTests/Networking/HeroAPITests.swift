//
//  HeroAPITests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class HeroAPITests: XCTestCase {
	
	func testHeroEndpointCreation() {
		let endpoint = HeroAPI.heroes(offset: 0, name: "hulk")
		XCTAssertEqual(endpoint.method, .get)
		XCTAssertEqual(endpoint.path, "characters")
		XCTAssertEqual(endpoint.parameters["offset"] as! Int, 0)
		XCTAssertEqual(endpoint.parameters["name"] as! String, "hulk")
		XCTAssertEqual(endpoint.parameters["limit"] as! Int, 20)
	}
	
	func testComicEndpointCreation() {
		let endpoint = HeroAPI.comics(heroID: "100")
		XCTAssertEqual(endpoint.method, .get)
		XCTAssertEqual(endpoint.path, "characters/100/comics")
		XCTAssertEqual(endpoint.parameters["limit"] as! Int, 20)
	}
	
	func testEventEndpointCreation() {
		let endpoint = HeroAPI.events(heroID: "100")
		XCTAssertEqual(endpoint.method, .get)
		XCTAssertEqual(endpoint.path, "characters/100/events")
		XCTAssertEqual(endpoint.parameters["limit"] as! Int, 20)
	}
	
	func testStoryEndpointCreation() {
		let endpoint = HeroAPI.stories(heroID: "100")
		XCTAssertEqual(endpoint.method, .get)
		XCTAssertEqual(endpoint.path, "characters/100/stories")
		XCTAssertEqual(endpoint.parameters["limit"] as! Int, 20)
	}
	
	func testSerieEndpointCreation() {
		let endpoint = HeroAPI.series(heroID: "100")
		XCTAssertEqual(endpoint.method, .get)
		XCTAssertEqual(endpoint.path, "characters/100/series")
		XCTAssertEqual(endpoint.parameters["limit"] as! Int, 20)
	}
	
}
