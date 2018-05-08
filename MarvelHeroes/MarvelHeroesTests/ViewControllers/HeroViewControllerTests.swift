//
//  HeroViewControllerTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class HeroesViewControllerTests: XCTestCase {

	var heroesViewController: HeroesViewController!
	
	override func setUp() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		heroesViewController = storyboard.instantiateViewController(withIdentifier: "HeroesViewController") as! HeroesViewController
		let _ = heroesViewController.view
	}
	
	func testIfOffsetInitialValueIsZero() {
		XCTAssertEqual(heroesViewController.offset, 0)
	}
	
	func testIfHeroesInitialValueIsEmpty() {
		XCTAssertTrue(heroesViewController.heroes.isEmpty)
	}
	
	func testIfIsSearchActiveInitialValueIsFalse() {
		XCTAssertFalse(heroesViewController.isSearchActive)
	}
	
	func testIfIsFavoritesActiveInitialValueIsFalse() {
		XCTAssertFalse(heroesViewController.isFavoritesActive)
	}
	
	func testIfEmptyLabelIsConfigured() {
		heroesViewController.configureEmptyLabel()
		XCTAssertEqual(heroesViewController.emptyLabel?.text, "No results.")
	}
	
}
