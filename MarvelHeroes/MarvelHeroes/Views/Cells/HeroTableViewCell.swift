//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

protocol FavoriteProtocol: class {
	func didRemoveHero(atIndexPath indexPath: IndexPath)
}

class HeroTableViewCell: UITableViewCell {

	@IBOutlet weak var heroImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var favoriteImageView: UIImageView!
	weak var delegate: FavoriteProtocol?
	
	var hero: Hero? {
		didSet {
			nameLabel.text = hero?.name
			// TODO: - Set image placeholder
			if let hero = hero {
				setFavorite(FavoritesService.isFavorite(hero))
			}
		}
	}
	
	override func awakeFromNib() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoritePressed))
		favoriteImageView.addGestureRecognizer(tapGesture)
	}
	
	func clean() {
		heroImage.image = nil
		nameLabel.text = ""
	}
	
	func setFavorite(_ isFavorite: Bool) {
		favoriteImageView.image = isFavorite ? #imageLiteral(resourceName: "favorite_highlighted") : #imageLiteral(resourceName: "favorite_normal")
	}
	
	@objc func favoritePressed() {
		if let hero = hero {
			var indexPath: IndexPath?
			if let row = FavoritesService.favorites.index(of: hero) {
				indexPath = IndexPath(row: row, section: 0)
			}
			let isFavorite = FavoritesService.isFavorite(hero)
			isFavorite ? FavoritesService.remove(hero) : FavoritesService.add(hero)
			setFavorite(!isFavorite)
			if let indexPath = indexPath, isFavorite {
				delegate?.didRemoveHero(atIndexPath: indexPath)
			}
		}
	}
	
}
