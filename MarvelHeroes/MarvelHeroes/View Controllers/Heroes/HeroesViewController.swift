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
	
	var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
	var emptyLabel: UILabel?
	var offset = 0
	var heroes = [Hero]()
	var isSearchActive = false
	
	// MARK: - Attributes
	
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

