//
//  FavoritesService.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import Foundation

class FavoritesService {
	
	static var favorites = [Hero]()
	
	class func add(_ hero: Hero) {
		favorites.append(hero)
		store(heroes: favorites)
	}
	
	class func remove(_ hero: Hero) {
		favorites = favorites.filter { $0.id != hero.id }
		store(heroes: favorites)
	}
	
	private class func store(heroes: [Hero]) {
		let encoder = JSONEncoder()
		do {
			let data = try encoder.encode(favorites)
			if FileManager.default.fileExists(atPath: favoritesURL().path) {
				try FileManager.default.removeItem(at: favoritesURL())
			}
			FileManager.default.createFile(atPath: favoritesURL().path, contents: data, attributes: nil)
		} catch {
			print(error.localizedDescription)
		}
	}
	
	static func retrieve() {
		if !FileManager.default.fileExists(atPath: favoritesURL().path) {
			favorites = []
		}
		
		if let data = FileManager.default.contents(atPath: favoritesURL().path) {
			let decoder = JSONDecoder()
			do {
				let heroes = try decoder.decode([Hero].self, from: data)
				favorites = heroes
			} catch {
				print(error.localizedDescription)
			}
		}
	}
	
	class func isFavorite(_ hero: Hero) -> Bool {
		return favorites.contains(hero)
	}
	
	class func favoritesURL() -> URL {
		let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let documentDirectory = documentsDirectories.first!
		return documentDirectory.appendingPathComponent("favorites")
	}
	
}
