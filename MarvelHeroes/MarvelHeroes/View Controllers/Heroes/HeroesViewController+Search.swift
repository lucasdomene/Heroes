//
//  HeroesViewController+Search.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension HeroesViewController: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		if let name = searchBar.text, !name.isEmpty {
			fetchHeroes(name: name)
		}
		searchBar.resignFirstResponder()
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		offset = 0
		heroes = []
		tableView.reloadData()
		isSearchActive = true
		emptyLabel?.isHidden = true
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		offset = 0
		heroes = []
		fetchHeroes()
		isSearchActive = false
		emptyLabel?.isHidden = true
	}
	
	func configureEmptyLabel() {
		emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
		emptyLabel?.isHidden = true
		emptyLabel?.text = "No results."
		emptyLabel?.textColor = UIColor.red
		emptyLabel?.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(emptyLabel!)
		
		emptyLabel?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		emptyLabel?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
}
