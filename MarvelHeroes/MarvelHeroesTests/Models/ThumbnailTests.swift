//
//  ThumbnailTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ThumbnailTests: XCTestCase {
	
	var path: String!
	var ext: String!
	var json: [String: Any]!
	
	override func setUp() {
		path = "path"
		ext = "ext"
		json = ["path": "path", "extension": "ext"]
	}
	
	func testThumbnailCreationWithDefaultInitializer() {
		let thumbnail = Thumbnail(path: path, imageExtension: ext)
		XCTAssertEqual(thumbnail.path, path)
		XCTAssertEqual(thumbnail.imageExtension, ext)
		XCTAssertEqual(thumbnail.fullPath, [path, ext].joined(separator: "."))
	}
	
	func testThumbnailCreationWithJSON() {
		let thumbnail = Thumbnail(json: json)
		XCTAssertEqual(thumbnail?.path, path)
		XCTAssertEqual(thumbnail?.imageExtension, ext)
		XCTAssertEqual(thumbnail?.fullPath, [path, ext].joined(separator: "."))
	}
}
