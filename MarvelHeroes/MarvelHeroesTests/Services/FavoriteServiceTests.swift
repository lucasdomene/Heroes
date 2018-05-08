//
//  FavoriteServiceTests.swift
//  MarvelHeroesTests
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class FavoriteServiceTests: XCTestCase {
	
	var hero: Hero!
	
	override func setUp() {
		hero = Hero(id: 1, name: "Hulk", thumbnail: nil)
	}
	
	func testIfHeroIsAdded() {
		FavoritesService.add(hero)
		XCTAssertTrue(FavoritesService.favorites.contains(hero))
	}
	
	func testIfHeroIsDeleted() {
		FavoritesService.remove(hero)
		XCTAssertFalse(FavoritesService.favorites.contains(hero))
	}
	
	func testIfItIsFavorite() {
		FavoritesService.add(hero)
		XCTAssertTrue(FavoritesService.isFavorite(hero))
	}
	
	func testIfItIsNotFavorite() {
		FavoritesService.remove(hero)
		XCTAssertFalse(FavoritesService.isFavorite(hero))
	}
}
