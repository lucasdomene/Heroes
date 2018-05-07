//
//  HeroesViewController+DataSource.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension HeroesViewController: UITableViewDataSource, FavoriteProtocol {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return isFavoritesActive ? FavoritesService.favorites.count : heroes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroTableViewCell
		let hero = isFavoritesActive ? FavoritesService.favorites[indexPath.row] : heroes[indexPath.row]
		cell.clean()
		cell.delegate = self
		cell.hero = hero
		return cell
	}
	
}
