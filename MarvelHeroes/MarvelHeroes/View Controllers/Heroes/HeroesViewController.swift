//
//  HeroesViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController, Loadable {
	
	// MARK: - Attributes
	
	@IBOutlet weak var tableView: UITableView!
	var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
	var offset = 0
	var heroes = [Hero]()
	
	// MARK: - Attributes
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerCell()
		fetchHeroes()
		configureSpinner()
	}
	
	func registerCell() {
		let nib = UINib(nibName: "HeroTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "HeroCell")
	}
	
	func fetchHeroes() {
		startLoading()
		HeroService.fetchHeroes(offset) { result in
			switch result {
			case .success(let heroes):
				self.heroes.append(contentsOf: heroes)
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
			DispatchQueue.main.async {
				self.stopLoading()
			}
		}
	}

}

