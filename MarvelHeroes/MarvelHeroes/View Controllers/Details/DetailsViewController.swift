//
//  DetailsViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var tableView: UITableView!
	
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		initDetails()
		tableView.reloadData()
		navigationItem.title = hero.name
	}
	
	func initDetails() {
		for _ in 0...3 {
			details.append([])
		}
	}
	
	func fetchDetails(forSection section: Sections) {
		startLoading(forSection: section)
		switch section {
		case .comics:
			DetailsService.fetchDetails(type: Comic.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let comics):
					self.details[section.rawValue] = comics
					self.updateCell(forSection: section)
				case .failure(let error):
					print(error)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .events:
			DetailsService.fetchDetails(type: Event.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let events):
					self.details[section.rawValue] = events
					self.updateCell(forSection: section)
				case .failure(let error):
					print(error)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .stories:
			DetailsService.fetchDetails(type: Story.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let stories):
					self.details[section.rawValue] = stories
					self.updateCell(forSection: section)
				case .failure(let error):
					print(error)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
		case .series:
			DetailsService.fetchDetails(type: Serie.self, heroID: String(hero.id)) { result in
				switch result {
				case .success(let series):
					self.details[section.rawValue] = series
					self.updateCell(forSection: section)
				case .failure(let error):
					print(error)
				}
				self.stopLoading(forSection: section)
				self.didFetch[section.rawValue] = true
			}
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
	
}
