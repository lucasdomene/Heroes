//
//  HeroesViewController+Delegate.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension HeroesViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let heroes = isFavoritesActive ? FavoritesService.favorites : self.heroes
		cell.tag = indexPath.row
		let hero = heroes[indexPath.row]
		if let url = URL(string: hero.thumbnail.fullPath) {
			ImageService.downloadImage(fromURL: url) { image in
				DispatchQueue.main.async {
					if cell.tag == indexPath.row {
						(cell as? HeroTableViewCell)?.heroImage.image = image
					}
				}
			}
		}
		
		if indexPath.row > heroes.count - 2 && heroes.count > 5 {
			offset += 20
			fetchHeroes()
		}
	}
	
}
