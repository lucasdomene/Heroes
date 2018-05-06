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
	
	func clean() {
		heroImage.image = nil
		nameLabel.text = ""
	}
	
	func fill(withName name: String) {
		nameLabel.text = name
		// TODO: - Set image placeHolder
	}
	
}
