//
//  FavoritesService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class FavoritesService {
	
	// TODO: - Fetch from database
	static var favorites = [Hero]()
	
	class func add(_ hero: Hero) {
		favorites.append(hero)
	}
	
	class func remove(_ hero: Hero) {
		favorites = favorites.filter { $0.id != hero.id }
	}
	
}
