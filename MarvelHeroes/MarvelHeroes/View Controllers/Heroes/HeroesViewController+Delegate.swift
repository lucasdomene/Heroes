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
		
		if indexPath.row > heroes.count - 2 && heroes.count > 5 {
			offset += 20
			fetchHeroes()
		}
		
		if let image = imageService.imageForKey(key: String(hero.id)) {
			(cell as? HeroTableViewCell)?.heroImage.image = image
			return
		}
		
		if let url = URL(string: hero.thumbnail.fullPath) {
			imageService.downloadImage(fromURL: url) { image in
				self.imageService.setImage(image: image, forkey: String(hero.id))
				DispatchQueue.main.async {
					if cell.tag == indexPath.row {
						(cell as? HeroTableViewCell)?.heroImage.image = image
					}
				}
			}
		}
		
	}
	
	func didRemoveHero(atIndexPath indexPath: IndexPath) {
		tableView.beginUpdates()
		tableView.deleteRows(at: [indexPath], with: .automatic)
		tableView.endUpdates()
		
		if FavoritesService.favorites.isEmpty {
			emptyLabel?.isHidden = false
		}
	}
	
}
