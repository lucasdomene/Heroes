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
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var favoritesButton: UIBarButtonItem!
	
	var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
	var emptyLabel: UILabel?
	var offset = 0
	var heroes = [Hero]()
	var favorites = [Hero]()
	var isSearchActive = false
	var isFavoritesActive = false
	
	// MARK: - View life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		registerCell()
		fetchHeroes()
		configureSpinner()
		configureEmptyLabel()
	}
	
	func registerCell() {
		let nib = UINib(nibName: "HeroTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "HeroCell")
	}
	
	@IBAction func favoritesPressed(_ sender: UIBarButtonItem) {
		isFavoritesActive = !isFavoritesActive
		favoritesButton.image = isFavoritesActive ? #imageLiteral(resourceName: "close") : #imageLiteral(resourceName: "favorites")
		tableView.reloadData()
		emptyLabel?.isHidden = !(favorites.isEmpty && isFavoritesActive)
	}
	
	func fetchHeroes(name: String? = nil) {
		startLoading()
		HeroService.fetchHeroes(offset, name: name) { result in
			switch result {
			case .success(let heroes):
				self.heroes.append(contentsOf: heroes)
				DispatchQueue.main.async {
					self.tableView.reloadData()
					self.emptyLabel?.isHidden = !(self.isSearchActive && self.heroes.isEmpty)
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

