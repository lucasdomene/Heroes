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
		
		if indexPath.row > heroes.count - 2 && heroes.count > 5 && !isFavoritesActive {
			offset += 20
			fetchHeroes()
		}
		
		if let image = imageService.imageForKey(key: String(hero.id)) {
			(cell as? HeroTableViewCell)?.heroImage.image = image
			return
		}
		
		if let imagePath = hero.thumbnail?.fullPath, let url = URL(string: imagePath) {
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
		if isFavoritesActive {
			tableView.beginUpdates()
			tableView.deleteRows(at: [indexPath], with: .automatic)
			tableView.endUpdates()
		}
		emptyLabel?.isHidden = !(FavoritesService.favorites.isEmpty && isFavoritesActive)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let heroes = isFavoritesActive ? FavoritesService.favorites : self.heroes
		selectedHero = heroes[indexPath.row]
		if let cell = tableView.cellForRow(at: indexPath) as? HeroTableViewCell {
			selectedHeroImage = cell.heroImage.image
			selectedFrame = tableView.convert(cell.frame, to: tableView.superview)
		}
		performSegue(withIdentifier: "showDetails", sender: self)
	}
	
}
