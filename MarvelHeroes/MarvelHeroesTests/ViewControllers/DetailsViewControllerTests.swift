//
//  DetailsViewControllerTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class DetailsViewControllerTests: XCTestCase {
	
	var detailsViewController: DetailsViewController!
	
	override func setUp() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
		detailsViewController.hero = Hero(id: 100, name: "Hulk", thumbnail: nil)
		let _ = detailsViewController.view
	}
	
	func testIfDetailsInitialValueIsConfigured() {
		XCTAssertTrue(detailsViewController.details.count == 4)
	}
	
	func testIfDidFetchInitialStateIsFalse() {
		XCTAssertTrue(detailsViewController.didFetch.filter { $0 == true }.isEmpty)
	}
	
	func testIfCompletedInitialStateIsFalse() {
		XCTAssertFalse(detailsViewController.completed)
	}
	
	func testIfTitleIsConfigured() {
		XCTAssertEqual(detailsViewController.navigationItem.title, "Hulk")
	}
	
	func testFavoriteImageOn() {
		detailsViewController.setFavorite(true)
		XCTAssertEqual(detailsViewController.favoriteImageView.image, #imageLiteral(resourceName: "favorite_highlighted"))
	}
	
	func testFavoriteImageOff() {
		detailsViewController.setFavorite(false)
		XCTAssertEqual(detailsViewController.favoriteImageView.image, #imageLiteral(resourceName: "favorite_normal"))
	}
	
}
