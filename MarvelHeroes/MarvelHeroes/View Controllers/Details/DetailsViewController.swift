//
//  DetailsViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	// MARK: - Outlet
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var favoriteImageView: UIImageView!
	
	// MARK: - Attributes
	
	var hero: Hero!
	var details = [[Detailable]]()
	let imageService = ImageService()
	var didFetch = [false, false, false, false] {
		didSet {
			completed = didFetch.filter { $0 == false }.isEmpty
		}
	}
	var completed = false {
		didSet {
			if completed {
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
	
	enum Sections: Int {
		case comics = 0
		case events
		case stories
		case series
		
		init(rawValue: Int){
			switch rawValue {
			case 0:
				self = .comics
			case 1:
				self = .events
			case 2:
				self = .stories
			case 3:
				self = .series
			default:
				self = .comics
			}
		}
	}
	
	// MARK: - View life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		initDetails()
		tableView.reloadData()
		navigationItem.title = hero.name
		configureFavoriteButton()
		setFavorite(FavoritesService.isFavorite(hero))
	}
	
	// MARK: - View configuration
	
	func configureFavoriteButton() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoritePressed))
		favoriteImageView.addGestureRecognizer(tapGesture)
	}
	
	func setFavorite(_ isFavorite: Bool) {
		favoriteImageView.image = isFavorite ? #imageLiteral(resourceName: "favorite_highlighted") : #imageLiteral(resourceName: "favorite_normal")
	}
	
	func initDetails() {
		for _ in 0...3 {
			details.append([])
		}
	}
	
	// MARK: - Actions
	
	@objc func favoritePressed() {
		let isFavorite = FavoritesService.isFavorite(hero)
		isFavorite ? FavoritesService.remove(hero) : FavoritesService.add(hero)
		setFavorite(!isFavorite)
	}
	
	func startLoading(forSection section: Sections) {
		DispatchQueue.main.async {
			let indexPath = IndexPath(row: 0, section: section.rawValue)
			let cell = self.tableView.cellForRow(at: indexPath)
			(cell as? DetailsTableViewCell)?.spinner?.startAnimating()
		}
	}
	
	func stopLoading(forSection section: Sections) {
		DispatchQueue.main.async {
			let indexPath = IndexPath(row: 0, section: section.rawValue)
			let cell = self.tableView.cellForRow(at: indexPath)
			(cell as? DetailsTableViewCell)?.spinner?.stopAnimating()
		}
	}
	
	func updateCell(forSection section: Sections) {
		DispatchQueue.main.async {
			let indexPath = IndexPath(row: 0, section: section.rawValue)
			let cell = self.tableView.cellForRow(at: indexPath)
			self.tableView.reloadRows(at: [indexPath], with: .none)
			(cell as? DetailsTableViewCell)?.emptyLabel.isHidden = !self.details[section.rawValue].isEmpty
		}
	}
	
	
	// MARK: - Data Fetchers
	
	func fetchDetails(forSection section: Sections) {
		startLoading(forSection: section)
		switch section {
		case .comics:
			DetailsService.fetchDetails(type: Comic.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let comics):
					self.handleSuccess(withItems: comics, forSection: section)
				case .failure(let error):
					ErrorHandler.handle(error: error, inViewController: self)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .events:
			DetailsService.fetchDetails(type: Event.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let events):
					self.handleSuccess(withItems: events, forSection: section)
				case .failure(let error):
					ErrorHandler.handle(error: error, inViewController: self)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .stories:
			DetailsService.fetchDetails(type: Story.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let stories):
					self.handleSuccess(withItems: stories, forSection: section)
				case .failure(let error):
					ErrorHandler.handle(error: error, inViewController: self)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .series:
			DetailsService.fetchDetails(type: Serie.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let series):
					self.handleSuccess(withItems: series, forSection: section)
				case .failure(let error):
					ErrorHandler.handle(error: error, inViewController: self)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		}
	}
	
	func handleSuccess(withItems items: [Detailable], forSection section: Sections) {
		self.details[section.rawValue] = items
		self.updateCell(forSection: section)
	}

	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showItem" {
			let detailItem = sender as? (Detailable, UIImage?)
			let destination = segue.destination as! ItemDetailViewController
			destination.itemTitle = detailItem?.0.title
			destination.itemDescription = detailItem?.0.description
			destination.image = detailItem?.1 ?? #imageLiteral(resourceName: "imagePlaceholder")
		}
	}
	
}
