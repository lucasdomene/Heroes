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
		let hero = heroes[indexPath.row]
		(cell as? HeroTableViewCell)?.setImage(withImagePath: hero.thumbnail.fullPath)
	}
	
	
}
