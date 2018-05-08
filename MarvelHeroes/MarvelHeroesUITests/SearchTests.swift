//
//  SearchTests.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest

class SearchTests: XCTestCase {
        
	var app: XCUIApplication!
	
	override func setUp() {
		super.setUp()
		continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
	}
	
	func testSearch() {
		let searchBar = app.otherElements["searchBar"]
		searchBar.tap()
		searchBar.typeText("hulk")
		app.keyboards.buttons["Search"].tap()
		
		let cells = app.tables["HeroesTableView"].cells
		let notEmpty = NSPredicate(format: "count > 0")
		expectation(for: notEmpty, evaluatedWith: cells, handler: nil)
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssert(cells.count > 0)
	}
	
}
