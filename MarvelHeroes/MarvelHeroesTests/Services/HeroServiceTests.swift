//
//  HeroServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class HeroServiceTests: XCTestCase {
	
	func testFetchHeroes() {
		let expectation = XCTestExpectation(description: "Fetch heroes from Marvel API")
		HeroService.fetchHeroes(0) { result in
			switch result {
			case .success(_):
				XCTAssert(true)
			case .failure(_):
				XCTFail("Failure retrieving heroes")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 10.0)
	}
	
}
