//
//  HeroesViewController+DataSource.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension HeroesViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return heroes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroTableViewCell
		let hero = heroes[indexPath.row]
		cell.nameLabel.text = hero.name
		// TODO: - Set image placeHolder
		if let url = URL(string: hero.thumbnail.fullPath) {
			ImageService.setImage(withUrl: url, inImageView: cell.heroImage)
		}
		return cell
	}
	
}