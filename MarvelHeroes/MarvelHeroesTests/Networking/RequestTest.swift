//
//  RequestTest.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

import XCTest
@testable import MarvelHeroes

class RequestTests: XCTestCase {
	
	func testDownloadWebData() {
		let expectation = XCTestExpectation(description: "Download apple.com home page")
		let url = URL(string: "https://apple.com")!
		
		Request.shared.run(urlRequest: URLRequest(url: url)) { (data, _, _) in
			XCTAssertNotNil(data, "No data was downloaded.")
			expectation.fulfill()
		}

		wait(for: [expectation], timeout: 10.0)
	}
}
