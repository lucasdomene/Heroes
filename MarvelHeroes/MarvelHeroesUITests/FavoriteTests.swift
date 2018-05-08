//
//  FavoriteTests.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest

class FavoriteTests: XCTestCase {
	
	var app: XCUIApplication!
	
	override func setUp() {
		super.setUp()
		continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
	}
	
	func testFavoritesFromHeroesViewControler() {
		let app = XCUIApplication()
		
		// Wait to load
		let cells = app.tables["HeroesTableView"].cells
		let notEmpty = NSPredicate(format: "count > 0")
		expectation(for: notEmpty, evaluatedWith: cells, handler: nil)
		waitForExpectations(timeout: 5, handler: nil)
		
		// press favorite button
		app.tables["HeroesTableView"].cells.firstMatch.images["favoriteImage"].tap()
		
		// go to favorites
		let itemButton = app.navigationBars["Marvel"].buttons["Item"]
		itemButton.tap()
		
		// get current favorite count
		let favoriteCount = app.tables["HeroesTableView"].cells.count
		
		// go back to heroes
		itemButton.tap()
		
		// press favorite button again
		app.tables["HeroesTableView"].cells.firstMatch.images["favoriteImage"].tap()
		
		// go to favorites
		itemButton.tap()
		
		
		// See if changed
		XCTAssert(favoriteCount != app.tables["HeroesTableView"].cells.count)
		
	}
	
}
