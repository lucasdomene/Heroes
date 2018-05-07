//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit


class HeroTableViewCell: UITableViewCell {

	@IBOutlet weak var heroImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var favoriteImageView: UIImageView!
	
	var hero: Hero? {
		didSet {
			nameLabel.text = hero?.name
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
			let isFavorite = FavoritesService.isFavorite(hero)
			isFavorite ? FavoritesService.remove(hero) : FavoritesService.add(hero)
			setFavorite(!isFavorite)
		}
	}
	
}
