//
//  DetailsServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class DetailsServiceTests: XCTestCase {

	func testFetchComics() {
		let expectation = XCTestExpectation(description: "Fetch comics from Marvel API")
		DetailsService.fetchDetails(type: Comic.self, heroID: "1011334") { result in
			switch result {
			case .success(_):
				XCTAssert(true)
			case .failure(_):
				XCTFail("Error fetching comics")
			}
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testFetchEvents() {
		let expectation = XCTestExpectation(description: "Fetch events from Marvel API")
		DetailsService.fetchDetails(type: Event.self, heroID: "1011334") { result in
			switch result {
			case .success(_):
				XCTAssert(true)
			case .failure(_):
				XCTFail("Error fetching events")
			}
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testFetchSeries() {
		let expectation = XCTestExpectation(description: "Fetch series from Marvel API")
		DetailsService.fetchDetails(type: Serie.self, heroID: "1011334") { result in
			switch result {
			case .success(_):
				XCTAssert(true)
			case .failure(_):
				XCTFail("Error fetching series")
			}
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testFetchStories() {
		let expectation = XCTestExpectation(description: "Fetch stories from Marvel API")
		DetailsService.fetchDetails(type: Story.self, heroID: "1011334") { result in
			switch result {
			case .success(_):
				XCTAssert(true)
			case .failure(_):
				XCTFail("Error fetching comics")
			}
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	
}
