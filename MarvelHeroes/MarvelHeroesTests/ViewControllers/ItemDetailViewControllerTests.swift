//
//  ItemDetailViewControllerTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ItemDetailViewControllerTests: XCTestCase {
	
	var itemDetailViewController: ItemDetailViewController!
	
	override func setUp() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		itemDetailViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
		itemDetailViewController.itemTitle = "ItemTitle"
		itemDetailViewController.itemDescription = "ItemDescription"
		itemDetailViewController.image = #imageLiteral(resourceName: "imagePlaceholder")
		let _ = itemDetailViewController.view
	}
	
	func testIfViewIsInitialized() {
		XCTAssertEqual(itemDetailViewController.titleLabel.text, "ItemTitle")
		XCTAssertEqual(itemDetailViewController.descriptionLabel.text, "ItemDescription")
		XCTAssertEqual(itemDetailViewController.itemImageView.image, #imageLiteral(resourceName: "imagePlaceholder"))
	}
	

}
