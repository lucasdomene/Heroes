//
//  ImageServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class ImageServiceTests: XCTestCase {
	
	var imageService: ImageService!
	
	override func setUp() {
		imageService = ImageService()
	}
	
	func testDownloadImage() {
		let url = "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
		let expectation = XCTestExpectation(description: "Downloading image")
		imageService.downloadImage(fromURL: URL(string: url)!) { image in
			XCTAssertNotNil(image)
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testSavingAndRetrievingImage() {
		imageService.setImage(image: #imageLiteral(resourceName: "imagePlaceholder"), forkey: "placeholderImage")
		let image = imageService.imageForKey(key: "placeholderImage")
		XCTAssertNotNil(image)
	}
	
}
