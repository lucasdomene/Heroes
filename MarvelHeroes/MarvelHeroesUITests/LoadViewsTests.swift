//
//  LoadViewsTests.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest

class LoadViewsTests: XCTestCase {
	
	var app: XCUIApplication!
	
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
    }
    
    func testShowHeroDetails() {
		app.tables["HeroesTableView"].cells.firstMatch.tap()
		XCTAssertTrue(app.otherElements["DetailsView"].exists)
    }
	
	func testShowItemDetails() {
		app.tables["HeroesTableView"].cells.firstMatch.tap()
		app.collectionViews["DetailsCollectionView"].cells.firstMatch.tap()
		XCTAssertTrue(app.otherElements["ItemDetailsView"].exists)
	}
	
	func testIfLoadedHeroes() {
		let cells = app.tables["HeroesTableView"].cells
		let notEmpty = NSPredicate(format: "count > 0")
		expectation(for: notEmpty, evaluatedWith: cells, handler: nil)
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssert(cells.count > 0)
	}
    
}
